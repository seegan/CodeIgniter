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

            foreach ($list as $list_key) {

                $user_name = isset($import_data[$list_key][0]) ? $import_data[$list_key][0] : false;
                $enrol_no = isset($import_data[$list_key][2]) ? $import_data[$list_key][2] : false;
                $email = isset($import_data[$list_key][7]) ? $import_data[$list_key][7] : false;

                if( $user_name && $enrol_no && $email && $user_name != '' && $enrol_no != '' && $email != '') {


/*$data = array(
    'test' => 'This is a test',
);

$this->form_validation->set_data($data); 
$this->form_validation->set_rules('test', 'Test Field', 'required|max_length[20]');
if ($this->form_validation->run()) 
{
    $message = "passed validation";
}
*/


                    
                    var_dump("check ok");
                } else {
                    var_dump("check not ok");
                }


            }
            
        }

        die();
    }



}