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
		$this->action_val = $this->input->post('action');
		$function = $this->action_val;
		echo $this->$function();
		die();
	}

	private function question_filter() {

        $this->load->library('paginator', '', 'paginatefilter');
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
}
