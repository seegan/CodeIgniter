<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Category extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('question_helper'));

		$this->load->model('question_model', 'question');
	}

	public function index()
	{

		$page_content = $this->load->view('admin/question/category/category', '', TRUE);
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

		$category_data = [
			'category'   => $this->input->post('category'),
			'description'   => $this->input->post('description'),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'category',
				'label' => 'Category',
				'rules' => 'required',
				'errors' => [
					'required' => 'Category Required.',
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );

        if ($this->form_validation->run() == FALSE)
        {
            $page_content = $this->load->view('admin/question/category/category_add', '', TRUE);
        }
        else
        {
			$this->db->set($category_data)
				->insert(db_table('category_table'));

			if( $this->db->affected_rows() == 1 ){
				redirect('admin/question/category'); die();
			}
			else {
				$page_content = $this->load->view('admin/question/category/category_add', '', TRUE);
			}
        }



		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);

	}

}