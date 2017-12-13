<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class ImportAjax extends MY_Controller {

	private $action_val;

	public function __construct()
	{
    	parent::__construct();
        if(!$this->input->is_ajax_request()) {
            $data['success'] = false;
            echo json_encode($data);
            die();            
        }
        $this->load->helper('url');
        $this->load->helper('import_helper');
	}

    public function index() {
        if($this->input->post('action')) {
            $this->action_val = $this->input->post('action');
            $function = $this->action_val;
            echo json_encode($this->$function());
            die();            
        }

    }

    public function candidate_import() {

        $config['upload_path']          = './uploads/candidate/';
        $config['allowed_types']        = 'xlsx|xls';
        $config['max_size']             = 5120;

        $data['success'] = false;

        $this->load->library('upload', $config);
        if ( !$this->upload->do_upload('FileInput')) {
            $data['error'] = $this->upload->display_errors();
            $data['success'] = false;
        } else {
            $file_data = $this->upload->data();
            $data['upload_name'] = $file_data['file_name'];
            if( $upload_id = createCandidateImport($this->auth_user_id, $data['upload_name']) ) {
                $data['success'] = true;
                $data['upload_id'] = $upload_id;
            }
        }
        echo json_encode($data);
        die();
    }


    public function analyzeUploadedFile() {

        $data['success'] = false;
        $upload_id = ( $this->input->post('upload_id') ) ? $this->input->post('upload_id') : 0;
        $import_type = ( $this->input->post('upload_id') ) ? 'uploads/'.$this->input->post('import_type') : 'uploads/candidate';
        $upload_data = getUploadFile($upload_id, $this->auth_user_id, $this->auth_level);

        if($upload_data = getUploadFile($upload_id, $this->auth_user_id, $this->auth_level) ) {

            $file_path = FCPATH.$import_type.'/'.$upload_data->file_name;

            //load the excel library
            $this->load->library('excel');

            //read file from path
            $objPHPExcel = PHPExcel_IOFactory::load($file_path);
            $excel_data = $objPHPExcel->getActiveSheet()->toArray();
            unset($excel_data[0]);

            $data['analyze_msg'] = '';
            foreach ($excel_data as $key => $value) {
                if( !isset($value[0]) || !isset($value[2]) || !isset($value[7]) || !$value[0] || !$value[2] || !$value[7] || $value[0] == '' || $value[2] == '' || $value[7] == '' ) {
                    unset($excel_data[$key]);
                    $data['analyze_msg'][] = 'Missing Mandatory Fields On Row '.$key. ' (skipped)'; 
                }
            }
            if( updateCandidateImport($upload_id, $excel_data) ) {
                $data['success'] = true;
                $data['update_id'] = $upload_id;
                $data['candidate_count'] = count($excel_data);
                $data['analyze_msg'][] = '<span style="color:green;">Done!</span>';
            }

            return $data;
        }

        $data['analyze_msg'][] = 'You have no permission to access this file'; 
        return $data;
    }


    public function importAccept() {
        $data['success'] = false;
        $upload_id = ( $this->input->post('update_id') ) ? $this->input->post('update_id') : 0;
        if(getUploadFile($upload_id, $this->auth_user_id, $this->auth_level) ) {
            $table = 'xtra_import_files';
            $cond = array('id' => $upload_id);
            $data = array('active' => 1);
            if( $this->common->update($table, $cond, $data) ) {
                $data['success'] = true;
                $data['upload_id'] = $upload_id;
            }
        }
        return $data;
    }


    private function createCandidateFromImport() {

        $import_id = ( $this->input->post('import_id') ) ? $this->input->post('import_id') : 0;
        $upload_data = getUploadFile($import_id, $this->auth_user_id, $this->auth_level, 1);
        $import_data = unserialize($upload_data->import_data);

        if($upload_data && is_array($import_data)) {

            $create_list = $this->input->post('select_list');
            $list = explode(",",$create_list);


            $this->load->helper('branch_helper');
            $this->load->model('branch_model', 'branch');
            $branchs = getAdminBranchArray();
            $batchs = getAllBatchs();


            foreach ($list as $list_key) {

                $branch = ( isset($import_data[$list_key][14]) && $import_data[$list_key][14] ) != '' ? (string)$import_data[$list_key][14] : 0;
                $batch = ( isset($import_data[$list_key][16]) && $import_data[$list_key][16] ) != '' ? (string)$import_data[$list_key][16] : 0;


                $branch_search_key = is_numeric($branch) ? 'id' : 'name';

                $batch_search_key = is_numeric($batch) ? 'id' : 'batch_name';
                $branch_avail = array_search($branch, array_column($branchs, $branch_search_key ));
                if($branch_avail !== false) {

                    $branch_search_key = is_numeric($branch) ? 'branch_id' : 'branch_name';
                    $batch_check = searchInsideArray($batchs, $branch_search_key, $batch_search_key, $branch, $batch);

                    var_dump($batch_check);
                }
                    //var_dump(is_numeric($batch));
                
                die();


                $user_name = ( isset($import_data[$list_key][0]) && $import_data[$list_key][0]  != '')  ? $import_data[$list_key][0] : false;
                $password = ( isset($import_data[$list_key][1]) && $import_data[$list_key][1]  != '')  ? $import_data[$list_key][1] : 12345678;
                $enrol_no = ( isset($import_data[$list_key][2]) && $import_data[$list_key][2]  != '')  ? $import_data[$list_key][2] : false;
                $email = ( isset($import_data[$list_key][7]) && $import_data[$list_key][7]  != '' ) ? $import_data[$list_key][7] : false;
                $active = ( isset($import_data[$list_key][20]) && $import_data[$list_key][20]  != '' &&  $import_data[$list_key][20] != 'yes' ) ? 1 : 0;

                $gender = ( isset($import_data[$list_key][4]) && $import_data[$list_key][4]  != '' ) ? $import_data[$list_key][4] : 'Male';
                $date_birth = ( isset($import_data[$list_key][5]) && $import_data[$list_key][5]  != '' ) ? date('Y-m-d', strtotime($import_data[$list_key][5])) : 0;

                $name = isset($import_data[$list_key][3]) ? $import_data[$list_key][3] : '';
                $registration_date = ( isset($import_data[$list_key][6]) && $import_data[$list_key][6] != '' ) ? date('Y-m-d', strtotime($import_data[$list_key][6])) : date('Y-m-d');

                $phone = ( isset($import_data[$list_key][8]) && $import_data[$list_key][8] != '' ) ? $import_data[$list_key][8] : '';
                $mobile = ( isset($import_data[$list_key][9]) && $import_data[$list_key][9] != '' ) ? $import_data[$list_key][9] : '';
                
                $address = ( isset($import_data[$list_key][10]) && $import_data[$list_key][10] != '' ) ? $import_data[$list_key][10] : '';
                $enquiry = ( isset($import_data[$list_key][11]) && $import_data[$list_key][11] != '' ) ? $import_data[$list_key][11] : '';
                $hear_about = ( isset($import_data[$list_key][12]) && $import_data[$list_key][12] != '' ) ? $import_data[$list_key][12] : '';
                $institute = ( isset($import_data[$list_key][13]) && $import_data[$list_key][13] != '' ) ? $import_data[$list_key][13] : '';

                $guardian_name = ( isset($import_data[$list_key][17]) && $import_data[$list_key][17] != '' ) ? $import_data[$list_key][17] : '';
                $guardian_mobile = ( isset($import_data[$list_key][18]) && $import_data[$list_key][18] != '' ) ? $import_data[$list_key][18] : '';
                $send_mail = ( isset($import_data[$list_key][19]) && $import_data[$list_key][19] != '' && $import_data[$list_key][19] != 'No') ? 1 : 0;

                $this->load->helper('auth');
                $this->load->model('examples/examples_model');
                $this->load->model('examples/validation_callables');
                $this->load->library('form_validation');


                if( $user_name && $enrol_no && $email && $user_name != '' && $enrol_no != '' && $email != '' && !isset($import_data[$list_key]['status']) ) {



                    $user_data = array(
                        'username' => $user_name,
                        'passwd' => $password,
                        'enrol_no' => $enrol_no,
                        'email' => $email,
                        'auth_level' => 1
                    );

                    $validation_rules = [
                        [
                            'field' => 'username',
                            'label' => 'username',
                            'rules' => 'required|min_length[3]|max_length[12]|is_unique[' . db_table('user_table') . '.username]',
                            'errors' => [
                                'required' => 'Username Required.',
                                'is_unique' => 'Username already in use.'
                            ]
                        ],
                        [
                            'field' => 'passwd',
                            'label' => 'passwd',
                            'rules' => [
                                'trim',
                                'required',
                                [ 
                                    '_check_password_strength', 
                                    [ $this->validation_callables, '_check_password_strength' ] 
                                ]
                            ],
                            'errors' => [
                                'required' => 'The password field is required.'
                            ]
                        ],
                        [
                            'field' => 'enrol_no',
                            'label' => 'Enroll No',
                            'rules'  => 'trim|required',
                            'errors' => [
                                'is_unique' => 'Enroll No Required.'
                            ]
                        ],
                        [
                            'field'  => 'email',
                            'label'  => 'email',
                            'rules'  => 'trim|required|valid_email|is_unique[' . db_table('user_table') . '.email]',
                            'errors' => [
                                'is_unique' => 'Email address already in use.'
                            ]
                        ]
                    ];


                    $message = '';
                    $this->form_validation->set_data($user_data); 
                    $this->form_validation->set_rules($validation_rules);
                    if ($this->form_validation->run()) {

                        unset($user_data['enrol_no']);
                        $user_data['passwd']     = $this->authentication->hash_passwd($user_data['passwd']);
                        $user_data['user_id']    = $this->examples_model->get_unused_id();
                        $user_data['created_at'] = date('Y-m-d H:i:s');

                        // If username is not used, it must be entered into the record as NULL
                        if( empty( $user_data['username'] ) ) {
                            $user_data['username'] = NULL;
                        }

                        $this->db->set($user_data)->insert(db_table('user_table'));

                        if( $this->db->affected_rows() == 1 ){

                            $this->db->where('user_id', $user_data['user_id']);
                            $this->db->update(db_table('user_table'), array('banned' => (string)$active));

                            $extra_data = [
                                'user_id'       => $user_data['user_id'],
                                'name'          => $name,
                                'enrollment_no' => $enrol_no,
                                'ref_pass'  => $password,
                                'mobile'    => $mobile,
                                'phone'     => $phone,
                                'address'   => $address,
                                'enquiry_from'  => $enquiry,
                                'hear_from'     => $hear_about,
                                'guardian_name'  => $guardian_name,
                                'guardian_mobile'   => $guardian_mobile,                     
                                'gender'    => $gender ,
                                'send_mail'     => $send_mail,
                                'registration_date' => $registration_date ,
                                'birth_date'   => $date_birth,
                                'instiute'  => $institute,
                                'referred_by' => $this->auth_user_id,
                            ];
                            $this->db->set($extra_data)->insert(db_table('candidate_table'));

                            $import_data[$list_key]['candidate_id'] = $user_data['user_id'];
                            $import_data[$list_key]['status'] = 'success';
                            $import_data[$list_key]['status_message'] = 'Candidate Import Success!';

                            $data[$list_key]['status'] = 'success';
                            $data[$list_key]['status_message'] = 'Candidate Import Success!';

                        } else {
                            $import_data[$list_key]['status'] = 'failed';
                            $import_data[$list_key]['status_message'] = 'Invalid User Id Or Enroll No Or Email';

                            $data[$list_key]['status'] = 'failed';
                            $data[$list_key]['status_message'] = 'Invalid User Id Or Enroll No Or Email';
                        }

                    } else {

                        $import_data[$list_key]['status'] = 'failed';
                        $import_data[$list_key]['status_message'] = validation_errors();

                        $data[$list_key]['status'] = 'failed';
                        $data[$list_key]['status_message'] = validation_errors();
                    }

                    $this->form_validation->reset_validation();
                } else {


                    $data[$list_key]['status'] = 'failed';
                    $data[$list_key]['status_message'] = 'Already Tried this data!';

                    if(!isset($import_data[$list_key]['status'])) {

                        $data[$list_key]['status'] = 'failed';
                        $data[$list_key]['status_message'] = 'Invalid User Id Or Enroll No Or Email';

                        $import_data[$list_key]['status'] = 'failed';
                        $import_data[$list_key]['status_message'] = 'Invalid User Id Or Enroll No Or Email';
                    }

                }

                $this->db->where('id', $import_id);
                $this->db->update(db_table('import_files'), array('import_data' => serialize($import_data)));
            }

            return $data;
        }

        die();
    }



}