<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Scheduler extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');

		$this->load->helper(array('exam_helper', 'candidate_helper'));
        $this->load->model('exam_model', 'exam');
        $this->load->model('candidate_model', 'candidate');

/*		$this->load->helper(array('question_helper', 'subject_helper'));

		$this->load->model('question_model', 'question');
		$this->load->model('subject_model', 'subject');*/
	}

	public function index()
	{

		$this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'se.status_order',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'ASC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->schedule_list_pagination($result_args);
        $data['javascripts'][] = base_url().'theme/assets/js/custom/list-schedule.js';

		$page_content = $this->load->view('admin/exam/scheduler/scheduler', $data, TRUE);
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

		$data['final_foot'] = '<script type="text/javascript">
            jQuery(document).ready(function(){
                populateMultiSelect("#question_batchs");
            });
        </script>';

        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/custom/add-schedule.js';


		$schedule_data = [
			'exam_id'   => $this->input->post('exam_id'),
			'schedule_name' => $this->input->post('schedule_name'),
			'description' => trim($this->input->post('schedule_description')),
			'start_date' => man_to_machine_date(join_date_time($this->input->post('start_date'), $this->input->post('start_time'))),
			'end_date' => man_to_machine_date(join_date_time($this->input->post('end_date'), $this->input->post('end_time'))),
			'result_date' => man_to_machine_date(join_date_time($this->input->post('result_date'), $this->input->post('result_time'))),
			'offered_as' => $this->input->post('offer_as'),
			'offer_cost' => $this->input->post('exam_cost'),
			'result_as' => $this->input->post('result_as'),
			'schedule_to' => $this->input->post('schedule_to'),
			'created_at' => date('Y-m-d H:i:s')
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'schedule_name',
				'label' => 'Exam Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Schedule Name Required.',
				]
			],
			[
				'field' => 'start_date',
				'label' => 'Start Date',
				'rules' => 'required',
				'errors' => [
					'required' => 'Start Date Required.',
				]
			],
			[
				'field' => 'end_date',
				'label' => 'End Date',
				'rules' => 'required',
				'errors' => [
					'required' => 'End Date Required.',
				]
			],
			[
				'field' => 'result_date',
				'label' => 'Result Date',
				'rules' => 'required',
				'errors' => [
					'required' => 'Result Date Required.',
				]
			],

		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE)
        {
			$this->db->set($schedule_data)
				->insert(db_table('exam_schedule_table'));

			if( $this->db->affected_rows() == 1 ){

				$schedule_id = $this->db->insert_id();

				$candidates = json_encode(array());
				if( $this->input->post('selected_candidate') ) {
					$candidates = json_encode($this->input->post('selected_candidate'));
				}

				$schedule_candidate_data = ['schedule_id' => $schedule_id, 'candidates' => $candidates ];
				$this->db->set($schedule_candidate_data)->insert(db_table('exam_schedule_candidate_table'));

				if($this->input->post('exam_batchs') && is_array($this->input->post('exam_batchs'))) {
					foreach ($this->input->post('exam_batchs') as $batch_id) {
						$schedule_batch_data = ['schedule_id' => $schedule_id, 'batch_id' => $batch_id ];
						$this->db->set($schedule_batch_data)->insert(db_table('exam_schedule_batch_table'));
					}
				}

				redirect('admin/exam/scheduler'); die();
			}
        }

        $page_content = $this->load->view('admin/exam/scheduler/scheduler_add', $data, TRUE);

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);
	}



	public function update($schedule_id = 0)
	{

		$data['final_foot'] = '<script type="text/javascript">
            jQuery(document).ready(function(){
                populateMultiSelect("#question_batchs");
            });
        </script>';

        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/custom/update-schedule.js';


		$schedule_data = [
			'exam_id'   => $this->input->post('exam_id'),
			'schedule_name' => $this->input->post('schedule_name'),
			'description' => trim($this->input->post('schedule_description')),
			'start_date' => man_to_machine_date(join_date_time($this->input->post('start_date'), $this->input->post('start_time'))),
			'end_date' => man_to_machine_date(join_date_time($this->input->post('end_date'), $this->input->post('end_time'))),
			'result_date' => man_to_machine_date(join_date_time($this->input->post('result_date'), $this->input->post('result_time'))),
			'offered_as' => $this->input->post('offer_as'),
			'offer_cost' => $this->input->post('exam_cost'),
			'result_as' => $this->input->post('result_as'),
			'schedule_to' => $this->input->post('schedule_to'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'schedule_name',
				'label' => 'Exam Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Schedule Name Required.',
				]
			],
			[
				'field' => 'start_date',
				'label' => 'Start Date',
				'rules' => 'required',
				'errors' => [
					'required' => 'Start Date Required.',
				]
			],
			[
				'field' => 'end_date',
				'label' => 'End Date',
				'rules' => 'required',
				'errors' => [
					'required' => 'End Date Required.',
				]
			],
			[
				'field' => 'result_date',
				'label' => 'Result Date',
				'rules' => 'required',
				'errors' => [
					'required' => 'Result Date Required.',
				]
			],

		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE)
        {

        	$this->db->where('id', $schedule_id);
			$this->db->update(db_table('exam_schedule_table'), $schedule_data);

			$candidates = json_encode(array());
			if( $this->input->post('selected_candidate') ) {
				$candidates = json_encode($this->input->post('selected_candidate'));
			}

			$this->db->delete(db_table('exam_schedule_candidate_table'), array('schedule_id' => $schedule_id));
			$schedule_candidate_data = ['schedule_id' => $schedule_id, 'candidates' => $candidates ];
			$this->db->set($schedule_candidate_data)->insert(db_table('exam_schedule_candidate_table'));


			$this->db->delete(db_table('exam_schedule_batch_table'), array('schedule_id' => $schedule_id));
			if($this->input->post('exam_batchs') && is_array($this->input->post('exam_batchs'))) {
				foreach ($this->input->post('exam_batchs') as $batch_id) {
					$schedule_batch_data = ['schedule_id' => $schedule_id, 'batch_id' => $batch_id ];
					$this->db->set($schedule_batch_data)->insert(db_table('exam_schedule_batch_table'));
				}
			}
        }

        $data['schedule'] = getScheduleById($schedule_id);
        $exam_id = (isset($data['schedule']) && isset($data['schedule']['exam_id'])) ? $data['schedule']['exam_id'] : 0;
        $data['exam'] = getExamById($exam_id);
        $data['eligible_batchs'] = getEligibleBatchsFromExam($exam_id);
        $data['schedule_batchs'] = getScheduleBatchs($schedule_id);
        $data['schedule_candidates'] = getScheduleCandidates($schedule_id);

        //$data['exam_questions'] = getExamQuestions($exam_id);

        $page_content = $this->load->view('admin/exam/scheduler/scheduler_update', $data, TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);
	}


}