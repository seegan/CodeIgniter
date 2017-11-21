<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Candidate extends MY_Controller {

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
	    if( $this->uri->uri_string() == 'admin/candidate/candidate/index' || $this->uri->uri_string() == 'admin/candidate/candidate') {
	        show_404();
	    }
		$data['final_foot'] = '<script type="text/javascript">
            jQuery(document).ready(function(){
                    
                    jQuery(".branch_name").on("change", function(){

                        var branch_id = jQuery(this).val();

                        var batchSel = document.getElementById("batch_name"); 
                        batchSel.length = 1

                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/branch/batch/getBatchByBranch").'", 
                            data: { branch_id: branch_id }, 
                            dataType: "json",
                            success: function (data) {

                                var batchs = data.batchs;
                                
                                jQuery("#question_topic").change();
                                if(data.batch_success) {
                                    for (var batch in batchs) { 
                                        if (typeof  batchs[batch].id  !== "undefined") {
                                            batchSel.options[batchSel.options.length] = new Option(batchs[batch].batch_name, batchs[batch].id);
                                        }
                                        
                                    }
                                }

                            }
                        });
                    });
                });
        </script>
        ';


		$data['branchs'] = getAdminBranch(1);
		$page_content = $this->load->view('admin/candidate/candidate/candidate', $data, TRUE);
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
	    if( $this->uri->uri_string() == 'admin/candidate/candidate/add')
	    {
	        show_404();
	    }



		$data['final_foot'] = '<script type="text/javascript">
            jQuery(document).ready(function(){
                    
                    jQuery(".branch_name").on("change", function(){

                        var branch_id = jQuery(this).val();

                        var batchSel = document.getElementById("batch_name"); 
                        batchSel.length = 1

                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/branch/batch/getBatchByBranch").'",  
                            data: { branch_id: branch_id }, 
                            dataType: "json",
                            success: function (data) {

                                var batchs = data.batchs;
                                
                                jQuery("#question_topic").change();
                                if(data.batch_success) {
                                    for (var batch in batchs) { 
                                        if (typeof  batchs[batch].id  !== "undefined") {
                                            batchSel.options[batchSel.options.length] = new Option(batchs[batch].batch_name, batchs[batch].id);
                                        }
                                        
                                    }
                                }

                            }
                        });
                    });
                });
        </script>
        ';



		$user_data = [
			'username'   => $this->input->post('username'),
			'passwd'     => $this->input->post('passwd'),
			'email'      => $this->input->post('email'),
			'auth_level' => '1', // 9 if you want to login @ examples/index.
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'username',
				'label' => 'username',
				'rules' => 'required|min_length[3]|max_length[12]|is_unique[' . db_table('user_table') . '.username]',
				'errors' => [
					'required' => 'Username Required.',
					'is_unique' => 'Username already in use.'
				]
			],
			[
				'field' => 'passwd',
				'label' => 'passwd',
				'rules' => [
					'trim',
					'required',
					[ 
						'_check_password_strength', 
						[ $this->validation_callables, '_check_password_strength' ] 
					]
				],
				'errors' => [
					'required' => 'The password field is required.'
				]
			],
			[
				'field'  => 'email',
				'label'  => 'email',
				'rules'  => 'trim|required|valid_email|is_unique[' . db_table('user_table') . '.email]',
				'errors' => [
					'is_unique' => 'Email address already in use.'
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );
		$data['branchs'] = getAdminBranch(1);

        if ($this->form_validation->run() == FALSE)
        {
            $page_content = $this->load->view('admin/candidate/candidate/candidate_add', $data, TRUE);
        }
        else
        {

			$user_data['passwd']     = $this->authentication->hash_passwd($user_data['passwd']);
			$user_data['user_id']    = $this->examples_model->get_unused_id();
			$user_data['created_at'] = date('Y-m-d H:i:s');

			// If username is not used, it must be entered into the record as NULL
			if( empty( $user_data['username'] ) ) {
				$user_data['username'] = NULL;
			}

			$this->db->set($user_data)
				->insert(db_table('user_table'));

			if( $this->db->affected_rows() == 1 ){
				$extra_data = [
					'user_id'   	=> $user_data['user_id'],
					'name'     	=> $this->input->post('name'),
					'enrollment_no'      	=> $this->input->post('enroll_no'),
					'ref_pass' 	=> $this->input->post('passwd'),
					'mobile' 	=> $this->input->post('mobile'),
					'phone' 	=> $this->input->post('phone'),
					'address' 	=> $this->input->post('address'),
					'enquiry_from' 	=> $this->input->post('enquiry_from'),
					'hear_from' 	=> $this->input->post('hear_from'),
					'guardian_name' 	=> $this->input->post('guardian_name'),
					'guardian_mobile' 	=> $this->input->post('guardian_mobile'),
					'gender' 	=> $this->input->post('gender'),
					'send_mail' 	=> ( $this->input->post('send_mail') ) ? $this->input->post('send_mail') : 0,
					'registration_date' 	=> ( $this->input->post('registration_date') ) ? date("Y-m-d", strtotime($this->input->post('registration_date'))) : '0000-00-00',
					'birth_date' 	=> ( $this->input->post('birth_date') ) ? date("Y-m-d", strtotime($this->input->post('birth_date'))) : '0000-00-00',
				];
				$this->db->set($extra_data)->insert(db_table('candidate_table'));

				if( $this->db->affected_rows() == 1 && $this->input->post('branch_name') != 0 &&  $this->input->post('batch_name') != 0){
					$extra_data = [
						'candidate_id'   	=> $user_data['user_id'],
						'branch_id'     	=> $this->input->post('branch_name'),
						'batch_id'     		=> $this->input->post('batch_name'),
					];
					$this->db->set($extra_data)->insert(db_table('candidate_branch_batch_table'));
				}
				redirect('admin/candidate'); die();
			}
			else {
				$page_content = $this->load->view('admin/candidate/candidate/candidate_add', $data, TRUE);
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