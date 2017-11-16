<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Subject extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper('subject_helper');

		$this->load->model('subject_model', 'subject');
	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/subject/subject/index' || $this->uri->uri_string() == 'admin/subject/subject') {
	        show_404();
	    }

	    $data['question_types'] = getQuestionTypes(1);

		$page_content = $this->load->view('admin/subject/subject/subject', $data, TRUE);
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
	    if( $this->uri->uri_string() == 'admin/subject/subject/add')
	    {
	        show_404();
	    }
/*if($this->input->method(TRUE) == 'POST') {
	echo "<pre>";
	var_dump($this->input->post('question_type'));
	die();
}*/
		$subject_data = [
			'subject'   => $this->input->post('subject'),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'subject',
				'label' => 'Subject Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Username Required.',
				]
			],
			[
				'field' => 'question_type[]',
				'label' => 'Question Type',
				'rules' => 'required',
				'errors' => [
					'required' => 'Question Type Required.',
				]
			]			
		];

	    $data['question_types'] = getQuestionTypes(1);
		$this->form_validation->set_rules( $validation_rules );

        if ($this->form_validation->run() == FALSE)
        {
            $page_content = $this->load->view('admin/subject/subject/subject_add', $data, TRUE);
        }
        else
        {

			$this->db->set($subject_data)
				->insert(db_table('subject_table'));



			if( $this->db->affected_rows() == 1 ){

				$subject_id = $this->db->insert_id();
				foreach ($this->input->post('question_type') as $type) {
					$this->db->set(array('subject_id' => $subject_id, 'type_id' => $type ))->insert(db_table('subject_question_type_table'));
				}
				//echo '<h1>Congratulations</h1>' . '<p>User ' . $user_data['username'] . ' was created.</p>';
				redirect('admin/subject'); die();
			}
			else {
				$page_content = $this->load->view('admin/subject/subject/subject_add', $data, TRUE);
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