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

	        $this->cpage = 1;
	        $this->ppage = isset($params['ppage']) ? $params['ppage'] : 20;
	        $this->subject = isset($params['subject']) ? $params['subject'] : '-';
	        $this->topic = isset($params['topic']) ? $params['topic'] : '-';
	        $this->type = isset($params['type']) ? $params['type'] : '-';
	        $this->language = isset($params['language']) ? $params['language'] : '-';
	        $this->year = isset($params['year']) ? $params['year'] : date('Y');
	        $this->difficulty = isset($params['difficulty']) ? $params['difficulty'] : '-';
	    }
	    else {
	        $this->cpage 		= ($this->CI->input->get('cpage')) ? abs( (int) $this->CI->input->get('cpage') ) : 1;
	        $this->ppage 		= ($this->CI->input->get('ppage')) ? abs( (int) $this->CI->input->get('ppage') ) : 20;
	        $this->subject 		= ($this->CI->input->get('subject')) ? $this->CI->input->get('subject') : '-';
	        $this->topic 		= ($this->CI->input->get('topic')) ?  $this->CI->input->get('topic')  : '-';
	        $this->type 		= ($this->CI->input->get('type')) ? $this->CI->input->get('type')  : '-';
	        $this->language 	= ($this->CI->input->get('language')) ? $this->CI->input->get('language')  : '-';
	        $this->year 		= ($this->CI->input->get('year')) ? $this->CI->input->get('year')  : date('Y');
	        $this->difficulty 	= ($this->CI->input->get('difficulty')) ? $this->CI->input->get('difficulty') : '-';
	    }

	    $this->_args();
	}



	public function _args()
	{
	    $this->args['arg']['ppage'] = $this->ppage;
	}

	public function question_list_pagination($args) {

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







	private function listCondition() {

	    $condition = '';
	    if($this->subject != '-') {
	    	$condition .= " AND q.subject = ".$this->subject;
	    	$this->args['arg']['subject'] = $this->subject;
	    }
	    if($this->topic != '-') {
	    	$condition .= " AND q.topic = ".$this->topic;
	    	$this->args['arg']['topic'] = $this->topic;
	    }
	    if($this->type != '-') {
	    	$condition .= " AND q.question_type = ".$this->type;
	    	$this->args['arg']['type'] = $this->type;
	    }
	    if($this->language != '-') {
	    	$condition .= " AND q.language = ".$this->language;
	    	$this->args['arg']['language'] = $this->language;
	    }
	    if($this->year != '-') {
	    	$condition .= " AND q.year = ".$this->year;
	    	$this->args['arg']['year'] = $this->year;
	    }
	    if($this->difficulty != '-') {
	    	$condition .= " AND q.difficulty_level = ".$this->difficulty;
	    	$this->args['arg']['difficulty'] = $this->difficulty;
	    }

	    return $condition;
	} 

	function createPaginationHtml() {
		$config['base_url'] = $this->paginate_link;
		$config['total_rows'] = $this->total_rows;
		$config['per_page'] = $this->ppage;
		$config['query_string_segment'] = 'cpage';
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

		$config['attributes'] = array('class' => 'page-link');


		$this->CI->pagination->initialize($config);
		return $this->CI->pagination->create_links();
	}

	function add_query_arg( $arg = array(), $url = '' ) {
		$parsed = http_build_query($arg, '', '&');
		$url = $url.'?'.$parsed;
		return $url;
	}



}