<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Branch extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper('branch_helper');

		$this->load->model('branch_model', 'branch');
	}

	public function index()
	{
	    if( $this->uri->uri_string() == 'admin/branch/branch/index' || $this->uri->uri_string() == 'admin/branch/branch') {
	        show_404();
	    }
		$ss = $this->acl_permits('general.*');
/*var_dump($this->auth_role);
		var_dump($ss);*/
/*		var_dump("expression"); die();*/
		$data['branch_users'] = unusedBranchUsers();

		$page_content = $this->load->view('admin/branch/branch/branch', $data, TRUE);
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


		$branch_data = [
			'name'   			=> $this->input->post('name'),
			'address' 			=> $this->input->post('address'),
			'country' 			=> $this->input->post('country'),
			'state' 			=> $this->input->post('state'),
			'city' 				=> $this->input->post('city'),
			'zip' 				=> $this->input->post('zip'),
			'phone' 			=> $this->input->post('phone'),
			'contact_person' 	=> $this->input->post('contact_person'),
			'mobile' 			=> $this->input->post('mobile'),
			'created_at' 		=> date('Y-m-d H:i:s')

		];

		$this->load->helper('auth');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'name',
				'label' => 'Branch Name',
				'rules' => 'required|min_length[3]|max_length[250]',
				'errors' => [
					'required' => 'Branch Name Required.',
				]
			],
			[
				'field' => 'branch_admin',
				'label' => 'Branch Admin',
				'rules' => 'required',
				'errors' => [
					'required' => 'Branch Admin Required.',
				]
			],
			[
				'field' 	=> 'address',
				'label' => 'Branch Address',
				'rules' => 'required',
				'errors' => [
					'required' => 'Branch Address Required.',
				]
			],
			[
				'field' => 'zip',
				'label' => 'Zip code',
				'rules' => 'required',
				'errors' => [
					'required' => 'Zip Code Required.',
				]
			],
			[
				'field' => 'phone',
				'label' => 'Phone Number',
				'rules' => 'required',
				'errors' => [
					'required' => 'Phone Number Required.',
				]
			],
			[
				'field' => 'contact_person',
				'label' => 'Contact Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Contact Name Required.',
				]
			],
			[
				'field' => 'mobile',
				'label' => 'Mobile Number',
				'rules' => 'required',
				'errors' => [
					'required' => 'Mobile Number Required.',
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );

		$data['branch_users'] = unusedBranchUsers();
        if ($this->form_validation->run() == FALSE)
        {
        	$page_content = $this->load->view('admin/branch/branch/branch_add', $data, TRUE);
        }
        else
        {
			$this->db->set($branch_data)
				->insert(db_table('branch_table'));
			if( $this->db->affected_rows() == 1 ){
				$branch_id = $this->db->insert_id();

				$branch_user_data = ['branch_id' => $branch_id, 'user_id' => $this->input->post('branch_admin'), 'is_admin' => 1];
				$this->db->set($branch_user_data)
				->insert(db_table('branch_user_table'));

				redirect('admin/branch'); die();
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
?>