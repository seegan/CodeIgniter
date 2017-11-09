<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Branch extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/branch/branch/index' || $this->uri->uri_string() == 'admin/branch/branch')
	    {
	        show_404();
	    }
		$ss = $this->acl_permits('general.*');
/*var_dump($this->auth_role);
		var_dump($ss);*/
/*		var_dump("expression"); die();*/
		$page_content = $this->load->view('admin/branch/branch/branch', '', TRUE);
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
	    if( $this->uri->uri_string() == 'admin/branch/branch/add')
	    {
	        show_404();
	    }		

		$page_content = $this->load->view('admin/branch/branch/branch_add', '', TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);

	}
}
?>