<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Instruction extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('exam_helper'));

		$this->load->model('exam_model', 'exam');
	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/exam/instruction/index' ) {
	        show_404();
	    }

		$this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'i.created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->instruction_list_pagination($result_args);
        $data['javascripts'][] = base_url().'theme/assets/js/custom/list-instruction.js';

		$page_content = $this->load->view('admin/exam/instruction/instruction', $data, TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);
	}

	public function add() {

        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/custom/add-instruction.js';

		$instruction_data = [
			'instruction_name'   => $this->input->post('instruction_name'),
			'instruction' => $this->input->post('instruction'),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'instruction_name',
				'label' => 'Instruction Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Instruction Name Required.',
				]
			],
		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE)
        {
			$this->db->set($instruction_data)
				->insert(db_table('instruction_table'));

			if( $this->db->affected_rows() == 1 ){
				redirect('admin/exam/instruction'); die();
			}  
        }

        $page_content = $this->load->view('admin/exam/instruction/instruction_add', $data, TRUE);

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);
	}


	public function update($instruction_id = 0)
	{


        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/custom/update-instruction.js';

		$instruction_data = [
			'instruction_name'   => $this->input->post('instruction_name'),
			'instruction' => $this->input->post('instruction'),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'instruction_name',
				'label' => 'Instruction Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Instruction Name Required.',
				]
			],
		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE)
        {
        	$this->db->where('id', $instruction_id);
			$this->db->update(db_table('instruction_table'), $instruction_data);
        }

        $data['instruction'] = getInstructionById($instruction_id);

        $page_content = $this->load->view('admin/exam/instruction/instruction_update', $data, TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);
	}



}