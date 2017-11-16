<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Topic extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('subject_helper'));

		$this->load->model('subject_model', 'subject');
	}

	public function index()
	{

		$data['subjects'] = getSubjects(1);

		$page_content = $this->load->view('admin/subject/topic/topic', $data, TRUE);
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

		$subject_data = [
			'subject_id'   => $this->input->post('subject'),
			'topic'   => $this->input->post('topic'),
			'created_at' => date('Y-m-d H:i:s'),
		];


		$data['subjects'] = getSubjects(1);

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
					'required' => 'Subject Required.',
				]
			],
			[
				'field' => 'topic',
				'label' => 'Topic Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Topic Required.',
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );

        if ($this->form_validation->run() == FALSE)
        {
            $page_content = $this->load->view('admin/subject/topic/topic_add', $data, TRUE);
        }
        else
        {

			$this->db->set($subject_data)
				->insert(db_table('subject_topic_table'));

			if( $this->db->affected_rows() == 1 ){
				//echo '<h1>Congratulations</h1>' . '<p>User ' . $user_data['username'] . ' was created.</p>';
				redirect('admin/subject/topic'); die();
			}
			else {
				$page_content = $this->load->view('admin/subject/topic/topic_add', $data, TRUE);
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