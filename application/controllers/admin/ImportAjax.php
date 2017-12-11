<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class ImportAjax extends MY_Controller {

	private $action_val;

	public function __construct()
	{
    	parent::__construct();
		$this->load->helper('url');
	}


    public function candidate_import() {

        $config['upload_path']          = './uploads/candidate/';
        $config['allowed_types']        = 'gif|jpg|png|xlsx';
        $config['max_size']             = 100;
        $config['max_width']            = 1024;
        $config['max_height']           = 768;

        $this->load->library('upload', $config);
        if ( ! $this->upload->do_upload('FileInput')) {
            $error = array('error' => $this->upload->display_errors());
            var_dump($error);
        } else {
            $data = array('upload_data' => $this->upload->data());
            echo "success";
        }
        die();
    }

}