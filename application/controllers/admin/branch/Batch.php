
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Batch extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('branch_helper', 'subject_helper'));

		$this->load->model('branch_model', 'branch');
		$this->load->model('subject_model', 'subject');
	}

	public function index()
	{
		$data['final_foot'] = '<script type="text/javascript">
            jQuery(document).ready(function(){
                    populateMultiSelect("#batch_subjects");
                    
                    jQuery(".branch_name").on("change", function(){
                        var branch_id = jQuery(this).val();

                        var subjectSel = document.getElementById("batch_subjects"); 
                        subjectSel.length = 1;

                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/branch/getBranchSubjects").'", 
                            data: { branch_id: branch_id }, 
                            dataType: "json",
                            success: function (data) {
                                var subjects = data.subjects;
                                
                                jQuery("#batch_subjects").change();
                                if(data.subject_success) {
                                    for (var subject in subjects) {
                                        if (typeof  subjects[subject].id  !== "undefined") {
                                            subjectSel.options[subjectSel.options.length] = new Option(subjects[subject].subject, subjects[subject].id);
                                        }
                                    }
                                    
                                }
                                jQuery("#batch_subjects").change();
                                populateMultiSelect("#batch_subjects");
                            }
                        });
                    });
                });
        </script>
        ';
		$data['branchs'] = getAdminBranch(1);

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

		$data['javascripts'][] = base_url().'theme/assets/js/custom/list-batch.js';

		$page_content = $this->load->view('admin/branch/batch/batch', $data, TRUE);
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
                    populateMultiSelect("#batch_subjects");
                    
                    jQuery(".branch_name").on("change", function(){
                        var branch_id = jQuery(this).val();

                        var subjectSel = document.getElementById("batch_subjects"); 
                        subjectSel.length = 1;

                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/branch/getBranchSubjects").'", 
                            data: { branch_id: branch_id }, 
                            dataType: "json",
                            success: function (data) {
                                var subjects = data.subjects;
                                
                                jQuery("#batch_subjects").change();
                                if(data.subject_success) {
                                    for (var subject in subjects) {
                                        if (typeof  subjects[subject].id  !== "undefined") {
                                            subjectSel.options[subjectSel.options.length] = new Option(subjects[subject].subject, subjects[subject].id);
                                        }
                                    }
                                    
                                }
                                jQuery("#batch_subjects").change();
                                populateMultiSelect("#batch_subjects");
                            }
                        });
                    });
                });
        </script>
        ';

		$batch_data = [
			'branch_id'   	=> $this->input->post('branch_name'),
			'batch_name' 	=> $this->input->post('batch_name'),
			'created_at' 		=> date('Y-m-d H:i:s')

		];

		$this->load->helper('auth');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'branch_name',
				'label' => 'Branch Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Branch Name Required.',
				]
			],
			[
				'field' => 'batch_name',
				'label' => 'Batch Name',
				'rules' => 'required',
				'errors' => [
					'required' => 'Batch Name Required.',
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );

		$data['branchs'] = getAdminBranch(1);

        if ($this->form_validation->run() !== FALSE)
        {


			$this->db->set($batch_data)
				->insert(db_table('batch_table'));
			if( $this->db->affected_rows() == 1 ){
				$batch_id = $this->db->insert_id();
				$branch_id = $this->input->post('branch_name');
				$subjects = $this->input->post('subjects');
				if( $subjects && is_array($subjects) && count($subjects) > 0 ) {
					foreach ($subjects as $subject) {
						$batch_subject_data = ['batch_id' => $batch_id, 'branch_id' => $branch_id, 'subject_id' => $subject];
						$this->db->set($batch_subject_data)
						->insert(db_table('batch_subject_table'));
					}
				}
				redirect('admin/branch/batch'); 
				die();
			}
        }

        $page_content = $this->load->view('admin/branch/batch/batch_add', $data, TRUE);

		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', '', TRUE);
	}


	public function getBatchByBranch() {
		$data['success'] = false;
		if(!$this->input->is_ajax_request() || !$this->input->post('branch_id')) {
			$data['msg'] = 'Please use A valid Browser!';
			echo json_encode($data);
			die();
		}

		$data['success'] = true;

		$batchs = getBatchByBranch($this->input->post('branch_id'));
		$data['batch_success'] = ($batchs) ? true : false;
		$data['batchs'] = $batchs;


		echo json_encode($data);

	}
}
?>