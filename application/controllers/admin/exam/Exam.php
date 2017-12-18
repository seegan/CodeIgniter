<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Exam extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('exam_helper','question_helper', 'subject_helper'));

        $this->load->model('exam_model', 'exam');
		$this->load->model('question_model', 'question');
		$this->load->model('subject_model', 'subject');
	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/exam/exam/index' || $this->uri->uri_string() == 'admin/exam/exam') {
	        show_404();
	    }

		$this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'e.created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->exam_list_pagination($result_args);
        $data['javascripts'][] = base_url().'theme/assets/js/custom/list-exam.js';

		$page_content = $this->load->view('admin/exam/exam/exam', $data, TRUE);
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

        $data['subjects'] = getSubjects(1);

        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/custom/add-exam.js';

		$exam_data = [
			'exam_name'   => $this->input->post('exam_name'),
			'exam_duration' => $this->input->post('exam_duration'),
			'total_questions' => $this->input->post('total_questions'),
			'total_marks' => $this->input->post('total_marks'),
			'description' => trim($this->input->post('test_description')),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'exam_name',
				'label' => 'Exam Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Exam Name Required.',
				]
			],
			[
				'field' => 'exam_duration',
				'label' => 'Exam Duration',
				'rules' => 'required',
				'errors' => [
					'required' => 'Exam Duration Required.',
				]
			],
			[
				'field' => 'total_questions',
				'label' => 'Total Questions',
				'rules' => 'required',
				'errors' => [
					'required' => 'Total Questions Required.',
				]
			],
			[
				'field' => 'total_marks',
				'label' => 'Total Marks',
				'rules' => 'required',
				'errors' => [
					'required' => 'Total Marks Required.',
				]
			],
		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE)
        {
			$this->db->set($exam_data)
				->insert(db_table('exam_table'));

			if( $this->db->affected_rows() == 1 ){

				$questions = serialize(array());
				if( $this->input->post('selected_question') ) {
					$questions = serialize($this->input->post('selected_question'));
				}
				$exam_id = $this->db->insert_id();

				$exam_question_data = ['exam_id' => $exam_id, 'questions' => $questions ];
				$this->db->set($exam_question_data)->insert(db_table('exam_questions_table'));
				if( $this->db->affected_rows() == 1 ){
					redirect('admin/exam'); die();
				}
				
			}  
        }

        $page_content = $this->load->view('admin/exam/exam/exam_add', $data, TRUE);

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);

	}



	public function update($exam_id = 0)
	{

        $data['subjects'] = getSubjects(1);

        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/custom/update-exam.js';

		$exam_data = [
			'exam_name'   => $this->input->post('exam_name'),
			'exam_duration' => $this->input->post('exam_duration'),
			'total_questions' => $this->input->post('total_questions'),
			'total_marks' => $this->input->post('total_marks'),
			'description' => trim($this->input->post('test_description')),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'exam_name',
				'label' => 'Exam Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Exam Name Required.',
				]
			],
			[
				'field' => 'exam_duration',
				'label' => 'Exam Duration',
				'rules' => 'required',
				'errors' => [
					'required' => 'Exam Duration Required.',
				]
			],
			[
				'field' => 'total_questions',
				'label' => 'Total Questions',
				'rules' => 'required',
				'errors' => [
					'required' => 'Total Questions Required.',
				]
			],
			[
				'field' => 'total_marks',
				'label' => 'Total Marks',
				'rules' => 'required',
				'errors' => [
					'required' => 'Total Marks Required.',
				]
			],
		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE)
        {

        	$this->db->where('id', $exam_id);
			$this->db->update(db_table('exam_table'), $exam_data);

			$questions = serialize(array());
			if( $this->input->post('selected_question') ) {
				$questions = serialize($this->input->post('selected_question'));
			}

			$questions = array('questions' => $questions);
        	$this->db->where('exam_id', $exam_id);
			$this->db->update(db_table('exam_questions_table'), $questions);

        }

        $data['exam'] = getExamById($exam_id);
        $data['exam_questions'] = getExamQuestions($exam_id);

        $page_content = $this->load->view('admin/exam/exam/exam_update', $data, TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);
	}
}