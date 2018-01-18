<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Instruction extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('exam_helper'));
	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/exam/instruction/index' ) {
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

	}
}