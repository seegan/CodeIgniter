<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Question extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper(array('question_helper', 'subject_helper'));

		$this->load->model('question_model', 'question');
		$this->load->model('subject_model', 'subject');
	}

	public function index()
	{


		$data['final_foot'] = '<script type="text/javascript">
            $(document).ready(function () {
                if($("#main_question").length > 0){
                    tinymce.init({
                        selector: "textarea#main_question",
                        theme: "modern",
                        height:100,
                        plugins: [
                            "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                            "save table contextmenu directionality emoticons template paste textcolor"
                        ],
                        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
                        style_formats: [
                            {title: "Bold text", inline: "b"},
                            {title: "Red text", inline: "span", styles: {color: "#ff0000"}},
                            {title: "Red header", block: "h1", styles: {color: "#ff0000"}},
                            {title: "Example 1", inline: "span", classes: "example1"},
                            {title: "Example 2", inline: "span", classes: "example2"},
                            {title: "Table styles"},
                            {title: "Table row 1", selector: "tr", classes: "tablerow1"}
                        ]
                    });
                }
            });
        </script>';
        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/jquery.repeater.js';
		$data['subjects'] = getSubjects(1);

		$page_content = $this->load->view('admin/question/question/question', $data, TRUE);
		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);
	}

	public function add()
	{


		$data['final_foot'] = '<script type="text/javascript">
            $(document).ready(function () {
                if($("#main_question").length > 0){
                    tinymce.init({
                        selector: "textarea#main_question",
                        theme: "modern",
                        height:100,
						setup : function(ed) {
							ed.on("keyup", function(e, evt) {
					        	questionEditor(e);
					    	});
						},                     
                        plugins: [
                            "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                            "save table contextmenu directionality emoticons template paste textcolor autoresize"
                        ],
                        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons",
                        style_formats: [
                            {title: "Bold text", inline: "b"},
                            {title: "Red text", inline: "span", styles: {color: "#ff0000"}},
                            {title: "Red header", block: "h1", styles: {color: "#ff0000"}},
                            {title: "Example 1", inline: "span", classes: "example1"},
                            {title: "Example 2", inline: "span", classes: "example2"},
                            {title: "Table styles"},
                            {title: "Table row 1", selector: "tr", classes: "tablerow1"}
                        ]
                    });
                }


            });



        </script>';
        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/jquery.repeater.js';

        $data['subjects'] = getSubjects(1);


		$question_data = [
			'main_question'   => $this->input->post('main_question'),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');

		$validation_rules = [
			[
				'field' => 'main_question',
				'label' => 'Question',
				'rules' => 'required',
				'errors' => [
					'required' => 'Question Required.',
				]
			]
		];

		$this->form_validation->set_rules( $validation_rules );

        if ($this->form_validation->run() == FALSE)
        {
            $page_content = $this->load->view('admin/question/question/question_add', $data, TRUE);
        }
        else
        {

        }



		$left_sidebar = $this->load->view('admin/common/left_sidebar', '', TRUE);
		$right_sidebar = $this->load->view('admin/common/right_sidebar', '', TRUE);

		echo $this->load->view('admin/common/header', '', TRUE);
		echo $left_sidebar;
		echo $page_content;
		echo $right_sidebar;
		echo $this->load->view('admin/common/footer', $data, TRUE);

	}


	public function getQuestionOptions() {
		$data['success'] = false;
		if(!$this->input->is_ajax_request() || !$this->input->post('cat_id')) {
			$data['msg'] = 'Please use A valid Browser!';
			echo json_encode($data);
			die();
		}
		$data['success'] = true;

		$topics = getTopicsByCategory($this->input->post('cat_id'));
		$data['topic_success'] = ($topics) ? true : false;
		$data['topics'] = $topics;

		$types = getQuestionTypesByCategory($this->input->post('cat_id'));
		$data['type_success'] = ($types) ? true : false;
		$data['types'] = $types;

		echo json_encode($data);
	}


	public function getQuestionData() {
		$data['success'] = false;
		if(!$this->input->is_ajax_request() || !$this->input->post('type_id')) {
			$data['msg'] = 'Please use A valid Browser!';
			echo json_encode($data);
			die();
		}

		if($this->input->post('type_id') == 1) {
			echo $this->load->view('admin/question/question/ajax/single_choice', '', TRUE);
		}
		if($this->input->post('type_id') == 2) {
			echo $this->load->view('admin/question/question/ajax/multiple_choice', '', TRUE);
		}
		if($this->input->post('type_id') == 3) {
			echo $this->load->view('admin/question/question/ajax/fill_blank_choice', '', TRUE);
		}		
	}


}