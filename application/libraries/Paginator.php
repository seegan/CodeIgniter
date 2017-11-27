<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Community Auth - Authentication Library
 *
 * Community Auth is an open source authentication application for CodeIgniter 3
 *
 * @package     Community Auth
 * @author      Robert B Gottier
 * @copyright   Copyright (c) 2011 - 2017, Robert B Gottier. (http://brianswebdesign.com/)
 * @license     BSD - http://www.opensource.org/licenses/BSD-3-Clause
 * @link        http://community-auth.com
 */

class Paginator
{
	/**
	 * Class constructor
	 */

	public $cpage;
	public $ppage;
	public $params = FALSE;

	public $per_page;
	public $total_rows;
	public $paginate_link;


	public function __construct()
	{

		$this->CI =& get_instance();
		$this->CI->load->library('pagination');

	    if( $this->CI->input->method(TRUE) == 'POST') {
	    	$params = array();
			parse_str($this->CI->input->post('data'), $params);
			$this->params = $params;

	        $this->cpage = isset($params['cpage']) ? $params['cpage'] : 1;
	        $this->question = isset($params['question']) ? $params['question'] : '';
	        $this->subject = isset($params['subject']) ? $params['subject'] : '0';
	        $this->topic = isset($params['topic']) ? $params['topic'] : '0';
	        $this->type = isset($params['type']) ? $params['type'] : '0';
	        $this->language = isset($params['language']) ? $params['language'] : '-';
	        $this->year = isset($params['year']) ? $params['year'] : '0';
	        $this->difficulty = isset($params['difficulty']) ? $params['difficulty'] : '0';
	        $this->subject_name = isset($params['subject_name']) ? $params['subject_name'] : '';
	        $this->topic_name = isset($params['topic_name']) ? $params['topic_name'] : '';
	        $this->category_name = isset($params['category_name']) ? $params['category_name'] : '';
	    }
	    else {
	        $this->cpage 		= ($this->CI->input->get('cpage')) ? abs( (int) $this->CI->input->get('cpage') ) : 1;
	        $this->question 	= ($this->CI->input->get('question')) ? $this->CI->input->get('question') : '';
	        $this->subject 		= ($this->CI->input->get('subject')) ? $this->CI->input->get('subject') : '0';
	        $this->topic 		= ($this->CI->input->get('topic')) ?  $this->CI->input->get('topic')  : '0';
	        $this->type 		= ($this->CI->input->get('type')) ? $this->CI->input->get('type')  : '0';
	        $this->language 	= ($this->CI->input->get('language')) ? $this->CI->input->get('language')  : '-';
	        $this->year 		= ($this->CI->input->get('year')) ? $this->CI->input->get('year')  : '0';
	        $this->difficulty 	= ($this->CI->input->get('difficulty')) ? $this->CI->input->get('difficulty') : '0';
	        $this->subject_name 	= ($this->CI->input->get('subject_name')) ? $this->CI->input->get('subject_name') : '';
	        $this->topic_name 	= ($this->CI->input->get('topic_name')) ? $this->CI->input->get('topic_name') : '';
	        $this->category_name 	= ($this->CI->input->get('category_name')) ? $this->CI->input->get('category_name') : '';
	    }
	}



	public function _args()
	{
		if( $this->CI->input->method(TRUE) == 'POST') {
			$this->ppage 	= isset($this->params['ppage']) ? $this->params['ppage'] : $this->ppage;
		} else {
	    	$this->ppage 	= ($this->CI->input->get('ppage')) ? abs( (int) $this->CI->input->get('ppage') ) : $this->ppage;
		}
	    $this->args['arg']['ppage'] = $this->ppage;
	}

	public function question_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT q.id, q.question, s.subject, st.topic, q.question_type, q.language, q.year, q.difficulty_level, q.right_mark, q.negative_mark, q.question_time FROM xtra_question as q, xtra_subject as s, xtra_subject_topic as st  WHERE q.subject = s.id AND q.topic = st.id  ANd q.active = 1 ${condition}";

		$total_query        = "SELECT COUNT(1) as tot FROM (${query}) AS combined_table";

		$count_query = $this->CI->db->query($total_query);
		$row_count = $count_query->row();
  
		$this->total_rows = isset($row_count) ? $row_count->tot : 0;
		$data['total']  = $this->total_rows;

	    $offset             = ( $this->cpage * $this->ppage ) - $this->ppage;

	    $result_query = $query . " ORDER BY ${args['orderby_field']} ${args['order_by']} LIMIT ${offset}, ".$this->ppage;
		$result_data = $this->CI->db->query($result_query);	 
		$data['result'] = $result_data->result();   

	    $totalPage         	= ceil($data['total'] / $this->ppage);
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/question') );
		$data['pagination'] = $this->createPaginationHtml();

		$data['start_count'] = ($this->ppage * ($this->cpage - 1));
	    $end_count = $data['start_count'] + count($data['result']);
	    
	    if( $end_count == 0) {
	    	$start_count = 0;
	    } else {
	    	$start_count = $data['start_count'] + 1;
	    }
	    $data['status_txt'] = "<div class='' role='status' aria-live='polite'>Showing ".$start_count." to ".$end_count." of ".$this->total_rows." entries</div>";


	    return $data;
	}

	public function subject_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT * FROM `xtra_subject` WHERE `active`=1 ${condition}";

		$total_query        = "SELECT COUNT(1) as tot FROM (${query}) AS combined_table";

		$count_query = $this->CI->db->query($total_query);
		$row_count = $count_query->row();
  
		$this->total_rows = isset($row_count) ? $row_count->tot : 0;
		$data['total']  = $this->total_rows;

	    $offset             = ( $this->cpage * $this->ppage ) - $this->ppage;

	    $result_query = $query . " ORDER BY ${args['orderby_field']} ${args['order_by']} LIMIT ${offset}, ".$this->ppage;
		$result_data = $this->CI->db->query($result_query);	 
		$data['result'] = $result_data->result();   

	    $totalPage         	= ceil($data['total'] / $this->ppage);
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/subject') );
		$data['pagination'] = $this->createPaginationHtml();

		$data['start_count'] = ($this->ppage * ($this->cpage - 1));
	    $end_count = $data['start_count'] + count($data['result']);
	    
	    if( $end_count == 0) {
	    	$start_count = 0;
	    } else {
	    	$start_count = $data['start_count'] + 1;
	    }
	    $data['status_txt'] = "<div class='' role='status' aria-live='polite'>Showing ".$start_count." to ".$end_count." of ".$this->total_rows." entries</div>";


	    return $data;
	}

	public function topic_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT topic.`topic`,topic.`created_at`,subject.id,subject.subject,topic.active FROM `xtra_subject_topic` as topic left join xtra_subject as subject on subject.id = topic.`subject_id` WHERE topic.`active`=1 ${condition}";

		$total_query        = "SELECT COUNT(1) as tot FROM (${query}) AS combined_table";

		$count_query = $this->CI->db->query($total_query);
		$row_count = $count_query->row();
  
		$this->total_rows = isset($row_count) ? $row_count->tot : 0;
		$data['total']  = $this->total_rows;

	    $offset             = ( $this->cpage * $this->ppage ) - $this->ppage;

	    $result_query = $query . " ORDER BY ${args['orderby_field']} ${args['order_by']} LIMIT ${offset}, ".$this->ppage;
		$result_data = $this->CI->db->query($result_query);	 
		$data['result'] = $result_data->result();   

	    $totalPage         	= ceil($data['total'] / $this->ppage);
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/subject/topic') );
		$data['pagination'] = $this->createPaginationHtml();

		$data['start_count'] = ($this->ppage * ($this->cpage - 1));
	    $end_count = $data['start_count'] + count($data['result']);
	    
	    if( $end_count == 0) {
	    	$start_count = 0;
	    } else {
	    	$start_count = $data['start_count'] + 1;
	    }
	    $data['status_txt'] = "<div class='' role='status' aria-live='polite'>Showing ".$start_count." to ".$end_count." of ".$this->total_rows." entries</div>";


	    return $data;
	}
	public function category_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT * FROM `xtra_category` WHERE `active`=1 ${condition}";

		$total_query        = "SELECT COUNT(1) as tot FROM (${query}) AS combined_table";

		$count_query = $this->CI->db->query($total_query);
		$row_count = $count_query->row();
  
		$this->total_rows = isset($row_count) ? $row_count->tot : 0;
		$data['total']  = $this->total_rows;

	    $offset             = ( $this->cpage * $this->ppage ) - $this->ppage;

	    $result_query = $query . " ORDER BY ${args['orderby_field']} ${args['order_by']} LIMIT ${offset}, ".$this->ppage;
		$result_data = $this->CI->db->query($result_query);	 
		$data['result'] = $result_data->result();   

	    $totalPage         	= ceil($data['total'] / $this->ppage);
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/subject/topic') );
		$data['pagination'] = $this->createPaginationHtml();

		$data['start_count'] = ($this->ppage * ($this->cpage - 1));
	    $end_count = $data['start_count'] + count($data['result']);
	    
	    if( $end_count == 0) {
	    	$start_count = 0;
	    } else {
	    	$start_count = $data['start_count'] + 1;
	    }
	    $data['status_txt'] = "<div class='' role='status' aria-live='polite'>Showing ".$start_count." to ".$end_count." of ".$this->total_rows." entries</div>";


	    return $data;
	}


	public function candidate_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT * FROM `xtra_category` WHERE `active`=1 ${condition}";

		$total_query        = "SELECT COUNT(1) as tot FROM (${query}) AS combined_table";

		$count_query = $this->CI->db->query($total_query);
		$row_count = $count_query->row();
  
		$this->total_rows = isset($row_count) ? $row_count->tot : 0;
		$data['total']  = $this->total_rows;

	    $offset             = ( $this->cpage * $this->ppage ) - $this->ppage;

	    $result_query = $query . " ORDER BY ${args['orderby_field']} ${args['order_by']} LIMIT ${offset}, ".$this->ppage;
		$result_data = $this->CI->db->query($result_query);	 
		$data['result'] = $result_data->result();   

	    $totalPage         	= ceil($data['total'] / $this->ppage);
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/subject/topic') );
		$data['pagination'] = $this->createPaginationHtml();

		$data['start_count'] = ($this->ppage * ($this->cpage - 1));
	    $end_count = $data['start_count'] + count($data['result']);
	    
	    if( $end_count == 0) {
	    	$start_count = 0;
	    } else {
	    	$start_count = $data['start_count'] + 1;
	    }
	    $data['status_txt'] = "<div class='' role='status' aria-live='polite'>Showing ".$start_count." to ".$end_count." of ".$this->total_rows." entries</div>";


	    return $data;
	}






















	private function listCondition() {

	    $condition = '';

	    //Question
	    if($this->question != '') {
	    	$condition .= " AND q.question LIKE '%".$this->question."%'";
	    	$this->args['arg']['question'] = $this->question;
	    }
	    if($this->subject != '0') {
	    	$condition .= " AND q.subject = ".$this->subject;
	    	$this->args['arg']['subject'] = $this->subject;
	    }
	    if($this->topic != '0') {
	    	$condition .= " AND q.topic = ".$this->topic;
	    	$this->args['arg']['topic'] = $this->topic;
	    }
	    if($this->type != '0') {
	    	$condition .= " AND q.question_type = ".$this->type;
	    	$this->args['arg']['type'] = $this->type;
	    }
	    if($this->language != '-') {
	    	$condition .= " AND q.language = '".$this->language."'";
	    	$this->args['arg']['language'] = $this->language;
	    }
	    if($this->year != '0') {
	    	$condition .= " AND q.year = ".$this->year;
	    	$this->args['arg']['year'] = $this->year;
	    }
	    if($this->difficulty != '0') {
	    	$condition .= " AND q.difficulty_level = ".$this->difficulty;
	    	$this->args['arg']['difficulty'] = $this->difficulty;
	    }
	    if($this->subject_name != ''){
	    	$condition .= " AND subject LIKE  '%".$this->subject_name."%'";
	    	$this->args['arg']['subject_name'] = $this->subject_name;
	    }
	     if($this->topic_name != ''){
	    	$condition .= " AND topic LIKE  '%".$this->topic_name."%'";
	    	$this->args['arg']['topic_name'] = $this->topic_name;
	    }

	      if($this->category_name != ''){
	    	$condition .= " AND category LIKE  '%".$this->category_name."%'";
	    	$this->args['arg']['category'] = $this->category_name;
	    }
	    return $condition;
	} 

	function createPaginationHtml() {
		$config['base_url'] = $this->paginate_link;
		$config['total_rows'] = $this->total_rows;
		$config['per_page'] = $this->ppage;
		$config['query_string_segment'] = 'cpage';
		$config['curr_page'] = $this->cpage;
		$config['page_query_string'] = TRUE;
		$config['use_page_numbers'] = TRUE;


		$config['next_link'] = 'Next <span aria-hidden="true">&rsaquo;</span>';
		$config['prev_link'] = '<span aria-hidden="true">&lsaquo;</span> Prev';
		$config['first_link'] = '<span aria-hidden="true">«</span> First';		
		$config['last_link'] = 'Last <span aria-hidden="true">»</span>';

		$config['next_tag_open'] = '<li class="pagination">';
		$config['next_tag_close'] = '</li>';
		$config['prev_tag_open'] = '<li class="pagination">';
		$config['prev_tag_close'] = '</li>';


		$config['full_tag_open'] = '<ul class="pagination">';
		$config['full_tag_close'] = '</ul>';
		$config['first_tag_open'] = '<li class="page-item">';
		$config['first_tag_close'] = '</li>';
		$config['last_tag_open'] = '<li class="page-item">';
		$config['last_tag_close'] = '</li>';
		
		$config['num_tag_open'] = '<li class="page-item">';
		$config['num_tag_close'] = '</li>';

		$config['cur_tag_open'] = '<li class="page-item disabled"><a class="page-link">';
		$config['cur_tag_close'] = '</a></li>';

		$config['attributes'] = array('class' => 'questions page-link');


		$this->CI->pagination->initialize($config);
		return $this->CI->pagination->create_links();
	}

	function add_query_arg( $arg = array(), $url = '' ) {
		$parsed = http_build_query($arg, '', '&');
		$url = $url.'?'.$parsed;
		return $url;
	}



}