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

        $this->load->library('paginator', '', 'paginatefilter');
        $result_args = array(
            'orderby_field' => 'q.created_at',
            'page' => $this->paginatefilter->cpage,
            'order_by' => 'DESC',
            'items_per_page' => $this->paginatefilter->ppage ,
            'condition' => '',
        );
        $data['data_list'] = $this->paginatefilter->question_list_pagination($result_args);


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


                jQuery(".question_subject").on("change", function(){
                    var cat_id = jQuery(this).val();

                    var topicSel = document.getElementById("question_topic"); 
                    var typeSel = document.getElementById("question_type"); 
                    topicSel.length = 1
                    typeSel.length = 1

                    jQuery.ajax({ 
                        type: "POST", 
                        url: "'.base_url("admin/question/getQuestionOptions").'", 
                        data: { cat_id: cat_id }, 
                        dataType: "json",
                        success: function (data) {

                            var topics = data.topics;
                            var types = data.types;
                            
                            jQuery("#question_topic").change();
                            if(data.topic_success) {
                                for (var topic in topics) {
                                    topicSel.options[topicSel.options.length] = new Option(topics[topic].topic, topics[topic].id);
                                }
                            }

                            jQuery("#question_type").change();
                            if(data.type_success) {
                                for (var type in types) {
                                    typeSel.options[typeSel.options.length] = new Option(types[type].question_type, types[type].id);
                                }
                            }

                            jQuery(".question_subject").prop("disabled", true)
                        }
                    });
                });

                jQuery("#question_type").on("change", function(){
                    if( jQuery(this).val() == 1 || jQuery(this).val() == 2 || jQuery(this).val() == 3 || jQuery(this).val() == 4 || jQuery(this).val() == 5 ) {
                        var type_id = jQuery(this).val();
                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/question/getQuestionData").'", 
                            data: { type_id: type_id }, 
                            dataType: "html",
                            success: function (data) {
                                jQuery(".option_data").html(data);
                                if(type_id == 1 || type_id == 2) {
                                    loadRepeter();
                                }
                                if(type_id == 3) {
                                    questionEditor();
                                }
                                if(type_id == 5) {
                                    loadRepeter();
                                }
                                jQuery("#question_type").prop("disabled", true)
                            }
                        });
                    }
                });



                jQuery( ".add-question" ).submit(function( event ) {
                    jQuery(".question_subject").prop("disabled", false)
                    jQuery("#question_type").prop("disabled", false)
                });


            });
        </script>
        ';
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


                jQuery(".question_subject").on("change", function(){
                    var cat_id = jQuery(this).val();

                    var topicSel = document.getElementById("question_topic"); 
                    var typeSel = document.getElementById("question_type"); 
                    topicSel.length = 1
                    typeSel.length = 1


                    jQuery.ajax({ 
                        type: "POST", 
                        url: "'.base_url("admin/question/getQuestionOptions").'", 
                        data: { cat_id: cat_id }, 
                        dataType: "json",
                        success: function (data) {

                            var topics = data.topics;
                            var types = data.types;
                            
                            jQuery("#question_topic").change();
                            if(data.topic_success) {
                                for (var topic in topics) {
                                    topicSel.options[topicSel.options.length] = new Option(topics[topic].topic, topics[topic].id);
                                }
                            }

                            jQuery("#question_type").change();
                            if(data.type_success) {
                                for (var type in types) {
                                    typeSel.options[typeSel.options.length] = new Option(types[type].question_type, types[type].id);
                                }
                            }

                            jQuery(".question_subject").prop("disabled", true)
                        }
                    });
                });

                jQuery("#question_type").on("change", function(){
                    if( jQuery(this).val() == 1 || jQuery(this).val() == 2 || jQuery(this).val() == 3 || jQuery(this).val() == 4 || jQuery(this).val() == 5 ) {
                        var type_id = jQuery(this).val();
                        jQuery.ajax({ 
                            type: "POST", 
                            url: "'.base_url("admin/question/getQuestionData").'", 
                            data: { type_id: type_id }, 
                            dataType: "html",
                            success: function (data) {
                                jQuery(".option_data").html(data);
                                if(type_id == 1 || type_id == 2) {
                                    loadRepeter();
                                }
                                if(type_id == 3) {
                                    questionEditor();
                                }
                                if(type_id == 5) {
                                    loadRepeter();
                                }
                                jQuery("#question_type").prop("disabled", true)
                            }
                        });
                    }
                });

                jQuery( ".add-question" ).submit(function( event ) {
                    jQuery(".question_subject").prop("disabled", false)
                    jQuery("#question_type").prop("disabled", false)
                });

            });
        </script>';
        $data['javascripts'][] = base_url().'jsplugins/tinymce/tinymce.min.js';
        $data['javascripts'][] = base_url().'theme/assets/js/jquery.repeater.js';

        $data['subjects'] = getSubjects(1);

		$question_data = [
			'question'   => trim($this->input->post('main_question')),
            'question_type' => $this->input->post('type'),
            'subject' => $this->input->post('subject'),
            'topic' => $this->input->post('topic'),
            'language' => $this->input->post('language'),
            'year' => $this->input->post('year'),
            'difficulty_level' => $this->input->post('difficulty'),
            'right_mark' => $this->input->post('right_mark'),
            'negative_mark' => $this->input->post('negative_mark'),
            'question_time' => $this->input->post('time'),
            'choice' => count($this->input->post('single_choice')),
			'created_at' => date('Y-m-d H:i:s'),
		];

		$this->load->helper('auth');
		$this->load->model('examples/examples_model');
		$this->load->model('examples/validation_callables');
		$this->load->library('form_validation');


		$validation_rules = [
			[
				'field' => 'subject',
				'label' => 'Subject',
				'rules' => 'required',
				'errors' => [
					'required' => 'Subject Required.',
				]
			],
            [
                'field' => 'topic',
                'label' => 'Subject Topic',
                'rules' => 'required',
                'errors' => [
                    'required' => 'Subject Topic Required.',
                ]
            ],
            [
                'field' => 'type',
                'label' => 'Question Type',
                'rules' => 'required',
                'errors' => [
                    'required' => 'Question Type Required.',
                ]
            ],
            [
                'field' => 'language',
                'label' => 'Language',
                'rules' => 'required',
                'errors' => [
                    'required' => 'Language Required.',
                ]
            ],
            [
                'field' => 'year',
                'label' => 'Year',
                'rules' => 'required',
                'errors' => [
                    'required' => 'Year Required.',
                ]
            ],
            [
                'field' => 'difficulty',
                'label' => 'Difficulty',
                'rules' => 'required',
                'errors' => [
                    'required' => 'Difficulty Required.',
                ]
            ]
		];

		$this->form_validation->set_rules( $validation_rules );
        if ($this->form_validation->run() !== FALSE) {
            $this->db->set($question_data)->insert(db_table('question_table'));

            if( $this->db->affected_rows() == 1 ){
                $question_id = $this->db->insert_id();

                $question = trim($this->input->post('main_question'));

                if($this->input->post('single_choice')) {
                    $single_options = $this->config->item('single_option');
                    foreach ($this->input->post('single_choice') as $key => $value) {
                        $option_key = $single_options[$key];
                        $option_val = trim($value['choice_data']);

                        $option_data = ['question_id' => $question_id, 'option_key' => $option_key, 'option_val' => $option_val];
                        $this->db->set($option_data)->insert(db_table('single_options_table'));


                        if($option_key == $this->input->post('validoption')) {
                            if( $this->db->affected_rows() == 1 ){
                                $option_id = $this->db->insert_id();
                                $answer_data = ['question_id' => $question_id, 'option_id' => $option_id];
                                $this->db->set($answer_data)->insert(db_table('single_answer_table'));

                            } 
                        }

                    }
                }
            }
        }

        $page_content = $this->load->view('admin/question/question/question_add', $data, TRUE);

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
		if($this->input->post('type_id') == 4) {
			echo $this->load->view('admin/question/question/ajax/true_false_choice', '', TRUE);
		}
		if($this->input->post('type_id') == 5) {
			echo $this->load->view('admin/question/question/ajax/match_folowing_choice', '', TRUE);
		}
	}


}