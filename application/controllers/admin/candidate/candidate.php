<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Candidate extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper( array('candidate_helper','branch_helper') );

		$this->load->model('branch_model', 'branch');
		$this->load->model('candidate_model', 'candidate');

	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/candidate/candidate/index' || $this->uri->uri_string() == 'admin/candidate/candidate') {
	        show_404();
	    }
		$data['branchs'] = getAdminBranch(1);

		$this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $this->paginatefilter->candidate_year = date('Y');

        $result_args = array(
            'orderby_field' => 'c.registration_date',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );

        $data['data_list'] = $this->paginatefilter->candidate_list_pagination($result_args);
        $data['javascripts'][] = base_url().'theme/assets/js/custom/list-candidate.js';

		$page_content = $this->load->view('admin/candidate/candidate/candidate', $data, TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);

	}


	public function add()
	{
	    if( $this->uri->uri_string() == 'admin/candidate/candidate/add')
	    {
	        show_404();
	    }


		$data['final_foot'] = '<script type="text/javascript">
            jQuery(document).ready(function(){
                    
                    jQuery(".branch_name").on("change", function(){

                        var branch_id = jQuery(this).val();

                        var batchSel = document.getElementById("batch_name"); 
                        batchSel.length = 1

                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/branch/batch/getBatchByBranch").'",  
                            data: { branch_id: branch_id }, 
                            dataType: "json",
                            success: function (data) {

                                var batchs = data.batchs;
                                
                                jQuery("#batch_name").change();
                                if(data.batch_success) {
                                    for (var batch in batchs) { 
                                        if (typeof  batchs[batch].id  !== "undefined") {
                                            batchSel.options[batchSel.options.length] = new Option(batchs[batch].batch_name, batchs[batch].id);
                                        }
                                    }
                                }
                                jQuery("#batch_name").change();

                            }
                        });
                    });
                });
        </script>
        ';



		$user_data = [
			'username'   => $this->input->post('username'),
			'passwd'     => $this->input->post('passwd'),
			'email'      => $this->input->post('email'),
			'auth_level' => '1', // 9 if you want to login @ examples/index.
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

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
				'field'  => 'email',
				'label'  => 'email',
				'rules'  => 'trim|required|valid_email|is_unique[' . db_table('user_table') . '.email]',
				'errors' => [
					'is_unique' => 'Email address already in use.'
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() != FALSE) {

			$user_data['passwd']     = $this->authentication->hash_passwd($user_data['passwd']);
			$user_data['user_id']    = $this->examples_model->get_unused_id();
			$user_data['created_at'] = date('Y-m-d H:i:s');

			// If username is not used, it must be entered into the record as NULL
			if( empty( $user_data['username'] ) ) {
				$user_data['username'] = NULL;
			}

			$this->db->set($user_data)
				->insert(db_table('user_table'));

			if( $this->db->affected_rows() == 1 ){
				$extra_data = [
					'user_id'   	=> $user_data['user_id'],
					'name'     	=> $this->input->post('name'),
					'enrollment_no'      	=> $this->input->post('enroll_no'),
					'ref_pass' 	=> $this->input->post('passwd'),
					'mobile' 	=> $this->input->post('mobile'),
					'phone' 	=> $this->input->post('phone'),
					'address' 	=> $this->input->post('address'),
					'enquiry_from' 	=> $this->input->post('enquiry_from'),
					'hear_from' 	=> $this->input->post('hear_from'),
					'guardian_name' 	=> $this->input->post('guardian_name'),
					'guardian_mobile' 	=> $this->input->post('guardian_mobile'),
					'gender' 	=> $this->input->post('gender'),
					'send_mail' 	=> ( $this->input->post('send_mail') ) ? $this->input->post('send_mail') : 0,
					'registration_date' 	=> ( $this->input->post('registration_date') ) ? man_to_machine_date($this->input->post('registration_date')) : date('Y-m-d H:i:s'),
					'birth_date' 	=> ( $this->input->post('birth_date') ) ? man_to_machine_date($this->input->post('birth_date')) : '0000-00-00',
				];
				$this->db->set($extra_data)->insert(db_table('candidate_table'));

				if( $this->db->affected_rows() == 1 && $this->input->post('branch_name') != 0 &&  $this->input->post('batch_name') != 0){
					$extra_data = [
						'candidate_id'   	=> $user_data['user_id'],
						'branch_id'     	=> $this->input->post('branch_name'),
						'batch_id'     		=> $this->input->post('batch_name'),
					];
					$this->db->set($extra_data)->insert(db_table('candidate_branch_batch_table'));
				}
				redirect('admin/candidate'); die();
			}
        }

		$data['branchs'] = getAdminBranch(1);
        $page_content = $this->load->view('admin/candidate/candidate/candidate_add', $data, TRUE);

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);

	}



	public function update($candidate_id = 0)
	{
	    if( $this->uri->uri_string() == 'admin/candidate/candidate/update')
	    {
	        show_404();
	    }
	    $data['candidate_data'] = getCandidateData($candidate_id);
		$page_content = "No Record Found!";

		if( $data['candidate_data'] ) {
			$data['final_foot'] = '<script type="text/javascript">
	            jQuery(document).ready(function(){
	                    
	                    jQuery(".branch_name").on("change", function(){

	                        var branch_id = jQuery(this).val();

	                        var batchSel = document.getElementById("batch_name"); 
	                        batchSel.length = 1

	                        jQuery.ajax({ 
	                            type: "POST", 
	                            url: "'.base_url("admin/branch/batch/getBatchByBranch").'",  
	                            data: { branch_id: branch_id }, 
	                            dataType: "json",
	                            success: function (data) {

	                                var batchs = data.batchs;
	                                
	                                jQuery("#batch_name").change();
	                                if(data.batch_success) {
	                                    for (var batch in batchs) { 
	                                        if (typeof  batchs[batch].id  !== "undefined") {
	                                            batchSel.options[batchSel.options.length] = new Option(batchs[batch].batch_name, batchs[batch].id);
	                                        }
	                                    }
	                                }
	                                jQuery("#batch_name").change();

	                            }
	                        });
	                    });
	                });
	        </script>';


			$user_data = [
				'passwd'     	=> $this->input->post('passwd'),
				'banned' 		=> $this->input->post('activation'),
			];

			$this->load->helper('auth');
			$this->load->model('examples/examples_model');
			$this->load->model('examples/validation_callables');
			$this->load->library('form_validation');

			$validation_rules = [
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
			];


			$this->form_validation->set_rules( $validation_rules );
	        if ($this->form_validation->run() != FALSE) {

				$extra_data = [
					'name'     	=> $this->input->post('name'),
					'enrollment_no'      	=> $this->input->post('enroll_no'),
					'ref_pass' 	=> $this->input->post('passwd'),
					'mobile' 	=> $this->input->post('mobile'),
					'phone' 	=> $this->input->post('phone'),
					'address' 	=> $this->input->post('address'),
					'enquiry_from' 	=> $this->input->post('enquiry_from'),
					'hear_from' 	=> $this->input->post('hear_from'),
					'guardian_name' 	=> $this->input->post('guardian_name'),
					'guardian_mobile' 	=> $this->input->post('guardian_mobile'),
					'gender' 	=> $this->input->post('gender'),
					'send_mail' 	=> ( $this->input->post('send_mail') ) ? $this->input->post('send_mail') : 0,
					'registration_date' 	=> ( $this->input->post('registration_date') ) ? man_to_machine_date($this->input->post('registration_date')) : date('Y-m-d'),
					'birth_date' 	=> ( $this->input->post('birth_date') ) ? man_to_machine_date($this->input->post('birth_date')) : '0000-00-00',
				];


				$user_data['passwd']     = $this->authentication->hash_passwd($user_data['passwd']);

				$this->db->where('user_id', $candidate_id);
				$this->db->update(db_table('user_table'), $user_data);

				$this->db->where('user_id', $candidate_id);
				$this->db->update(db_table('candidate_table'), $extra_data);

				$this->db->where('candidate_id', $candidate_id);
				$this->db->delete(db_table('candidate_branch_batch_table'));

				if( $this->input->post('branch_name') != 0 &&  $this->input->post('batch_name') != 0){
					$extra_data = [
						'candidate_id'   	=> $candidate_id,
						'branch_id'     	=> $this->input->post('branch_name'),
						'batch_id'     		=> $this->input->post('batch_name'),
					];
					$this->db->set($extra_data)->insert(db_table('candidate_branch_batch_table'));
				}
				redirect('admin/candidate'); die();
			}

			$data['branchs'] = getAdminBranch(1);
			$data['candidate_branch'] = getCandidateBranch($candidate_id);
			$data['candidate_batch'] = getCandidateBatch($candidate_id);

			$data['batchs'] = array();
			if( $data['candidate_branch'] && isset($data['candidate_branch']->branch_id) ) {
				$data['batchs'] = getBatchByBranch($data['candidate_batch']->branch_id);
			}

			$page_content = $this->load->view('admin/candidate/candidate/candidate_update', $data, TRUE);
		}

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);
	}



	public function import($upload_id = 0) {
		
		if( $this->uri->uri_string() == 'admin/candidate/candidate/import')
	    {
	        show_404();
	    }
	    $this->load->helper('import_helper');

		$data['javascripts'][] = base_url().'theme/assets/js/jquery.form.min.js';
		$data['javascripts'][] = base_url().'theme/assets/js/custom/candidate-import.js';


		$page_content = $this->load->view('admin/candidate/candidate/candidate_import', $data, TRUE);

		if( $upload_data = getUploadFile($upload_id, $this->auth_user_id, $this->auth_level, 1) ) {
			$data['import_list'] = unserialize( $upload_data->import_data );
			$data['upload_id'] = $upload_id;

			$data['final_foot'] = "<script>jQuery('#import-list').footable({pageSize: ".$upload_data->estimated_count."});</script>";
			$page_content = $this->load->view('admin/candidate/candidate/candidate_import_process', $data, TRUE);
		}

		

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);
	}



/*	public function import() {

		$file = APPPATH.'/sample.xlsx';

		//load the excel library
		$this->load->library('excel');

		//read file from path
		$objPHPExcel = PHPExcel_IOFactory::load($file);

echo "<pre>";
var_dump($objPHPExcel->getActiveSheet()->toArray());die();
		//get only the Cell Collection
		$cell_collection = $objPHPExcel->getActiveSheet()->getCellCollection();
		 
		//extract to a PHP readable array format
		foreach ($cell_collection as $cell) {



		    $column = $objPHPExcel->getActiveSheet()->getCell($cell)->getColumn();
		    $row = $objPHPExcel->getActiveSheet()->getCell($cell)->getRow();
		    $data_value = $objPHPExcel->getActiveSheet()->getCell($cell)->getValue();
		    echo "<pre>";
var_dump($cell);
//die();
		    if ($row == 1) {
		        $header[$row][$column] = $data_value;
		    } else {
		        $arr_data[$row][$column] = $data_value;
		    }
		}

		//send the data in an array format
		$data['header'] = $header;
		$data['values'] = $arr_data;

	}*/



}