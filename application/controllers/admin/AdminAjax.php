<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class AdminAjax extends MY_Controller {

	private $action_val;

	public function __construct()
	{
    	parent::__construct();
		$this->load->helper('url');
        if(!$this->input->is_ajax_request() || !$this->input->post('action')) {
            die();
        }
	}

	public function index() {
		$this->action_val = ( $this->input->post('action') ) ? $this->input->post('action') : $this->input->get('action')  ;
		$function = $this->action_val;
		echo $this->$function();
		die();
	}

	private function question_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'q.created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->question_list_pagination($result_args);

		return $this->load->view('admin/question/question/ajax/filter/list', $data, TRUE);
	}

	private function subject_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 's.created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['subject_list'] = $this->paginatefilter->subject_list_pagination($result_args);


		return $this->load->view('admin/subject/subject/ajax/filter/list', $data, TRUE);
	}

	private function topic_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['topic_list'] = $this->paginatefilter->topic_list_pagination($result_args);


		return $this->load->view('admin/subject/topic/ajax/filter/list', $data, TRUE);
	}

	private function category_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['category_list'] = $this->paginatefilter->category_list_pagination($result_args);


		return $this->load->view('admin/question/category/ajax/filter/list', $data, TRUE);
	}

    private function branch_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['branch_list'] = $this->paginatefilter->branch_list_pagination($result_args);


        return $this->load->view('admin/branch/branch/ajax/filter/list', $data, TRUE);
    }

    private function batch_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['batch_list'] = $this->paginatefilter->batch_list_pagination($result_args);


        return $this->load->view('admin/branch/batch/ajax/filter/list', $data, TRUE);
    }

    private function user_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;
        $result_args = array(
            'orderby_field' => 'created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['user_list'] = $this->paginatefilter->user_list_pagination($result_args);


        return $this->load->view('admin/branch/user/ajax/filter/list', $data, TRUE);
    }


    private function candidate_filter() {
        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;

        $result_args = array(
            'orderby_field' => 'c.registration_date',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->candidate_list_pagination($result_args);
        return $this->load->view('admin/candidate/candidate/ajax/filter/list', $data, TRUE);
    }

    private function exam_filter() {
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
        return $this->load->view('admin/exam/exam/ajax/filter/list', $data, TRUE);
    }














    private function search_exam() {
        $this->load->helper(array('exam_helper'));
        $this->load->model('exam_model', 'exam');
        $data['success'] = 0;
        $search_term = $this->input->post('search_key');
        $data['result'] = getExamByName($search_term);

        if($data['result']) {
            $data['success'] = 1;
        }
        echo json_encode($data);
        die();
    }


    private function get_scheduler_data() {
        $this->load->helper(array('exam_helper'));
        $this->load->model('exam_model', 'exam');
        $data['success'] = 0;
        $exam_id = $this->input->post('exam_id');
        $data['result'] = getEligibleBatchsFromExam($exam_id);
  
        if($data['result']) {
            $data['success'] = 1;
        }
        echo json_encode($data);
        die();
    }




    private function question_exam_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;

        $result_args = array(
            'orderby_field' => 'q.created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->question_list_pagination($result_args);

        return $this->load->view('admin/exam/exam/ajax/filter/question/list', $data, TRUE);
    }

    private function candidate_scheduler_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 20;

        $result_args = array(
            'orderby_field' => 'c.registration_date',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->candidate_list_pagination($result_args);
        return $this->load->view('admin/exam/scheduler/ajax/filter/candidate/list', $data, TRUE);
    }




}
