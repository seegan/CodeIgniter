<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Settings extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
	}

	public function index()
	{
		var_dump("expression"); die();
	}

	public function noindex()
	{
		var_dump("expression"); die();
	}
}
?>