<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class AdminAjax extends MY_Controller {

	private $action_val;

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
	}

	public function index() {
		if(!$this->input->is_ajax_request() || !$this->input->post('action')) {
			die();
		}
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
            'orderby_field' => 'created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['subject_list'] = $this->paginatefilter->subject_list_pagination($result_args);


		return $this->load->view('admin/subject/subject/ajax/filter/list', $data, TRUE);
	}



	private function question_exam_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
        $this->paginatefilter->ppage = 2;

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




}
