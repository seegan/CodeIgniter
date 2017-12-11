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

	        $this->cpage 			= isset($params['cpage']) ? $params['cpage'] : 1;
	        $this->question 		= isset($params['question']) ? $params['question'] : '';
	        $this->subject 			= isset($params['subject']) ? $params['subject'] : '0';
	        $this->topic 			= isset($params['topic']) ? $params['topic'] : '0';
	        $this->type 			= isset($params['type']) ? $params['type'] : '0';
	        $this->language 		= isset($params['language']) ? $params['language'] : '-';
	        $this->year 			= isset($params['year']) ? $params['year'] : '0';
	        $this->difficulty 		= isset($params['difficulty']) ? $params['difficulty'] : '0';
	        $this->subject_name 	= isset($params['subject_name']) ? $params['subject_name'] : '';
	        $this->topic_name 		= isset($params['topic_name']) ? $params['topic_name'] : '';
	        $this->category_name 	= isset($params['category_name']) ? $params['category_name'] : '';
	        $this->branch_name 		= isset($params['branch_name']) ? $params['branch_name'] : '';
	        $this->batch_name 		= isset($params['batch_name']) ? $params['batch_name'] : '';
	        $this->phone_mobile 	= isset($params['phone_mobile']) ? $params['phone_mobile'] : '';
			$this->contact_person 	= isset($params['contact_person']) ? $params['contact_person'] : '';

	        $this->branch_id		= isset($params['branch_id']) ? $params['branch_id'] : '0';
	        $this->batch_id			= isset($params['batch_id']) ? $params['batch_id'] : '0';
	        $this->user_name 		= isset($params['user_name']) ? $params['user_name'] : '';
	        $this->contact_no 		= isset($params['contact_no']) ? $params['contact_no'] : '';
	        $this->user_email 		= isset($params['user_email']) ? $params['user_email'] : '';
	        $this->gender 			= isset($params['gender']) ? $params['gender'] : '0';
	        $this->candidate_year   = isset($params['candidate_year']) ? $params['candidate_year'] : '0';

	        $this->exam_name   		= isset($params['exam_name']) ? $params['exam_name'] : '';
	        
	    }
	    else {
	        $this->cpage 				= ($this->CI->input->get('cpage')) ? abs( (int) $this->CI->input->get('cpage') ) : 1;
	        $this->question 			= ($this->CI->input->get('question')) ? $this->CI->input->get('question') : '';
	        $this->subject 				= ($this->CI->input->get('subject')) ? $this->CI->input->get('subject') : '0';
	        $this->topic 				= ($this->CI->input->get('topic')) ?  $this->CI->input->get('topic')  : '0';
	        $this->type 				= ($this->CI->input->get('type')) ? $this->CI->input->get('type')  : '0';
	        $this->language 			= ($this->CI->input->get('language')) ? $this->CI->input->get('language')  : '-';
	        $this->year 				= ($this->CI->input->get('year')) ? $this->CI->input->get('year')  : '0';
	        $this->difficulty 			= ($this->CI->input->get('difficulty')) ? $this->CI->input->get('difficulty') : '0';
	        $this->subject_name 		= ($this->CI->input->get('subject_name')) ? $this->CI->input->get('subject_name') : '';
	        $this->topic_name 			= ($this->CI->input->get('topic_name')) ? $this->CI->input->get('topic_name') : '';
	        $this->category_name 		= ($this->CI->input->get('category_name')) ? $this->CI->input->get('category_name') : '';
	        $this->branch_name 			= ($this->CI->input->get('branch_name')) ? $this->CI->input->get('branch_name') : '';
	        $this->batch_name 			= ($this->CI->input->get('batch_name')) ? $this->CI->input->get('batch_name') : '';
	        $this->phone_mobile 		= ($this->CI->input->get('phone_mobile')) ? $this->CI->input->get('phone_mobile') : '';
	        $this->contact_person 		= ($this->CI->input->get('contact_person')) ? $this->CI->input->get('contact_person') : '';

	        $this->branch_id			= ($this->CI->input->get('branch_id')) ? $this->CI->input->get('branch_id') : '0';
	        $this->batch_id				= ($this->CI->input->get('batch_id')) ? $this->CI->input->get('batch_id') : '0';
	        $this->user_name 			= ($this->CI->input->get('user_name')) ? $this->CI->input->get('user_name') : '';
	        $this->contact_no 			= ($this->CI->input->get('contact_no')) ? $this->CI->input->get('contact_no') : '';
	        $this->user_email 			= ($this->CI->input->get('user_email')) ? $this->CI->input->get('user_email') : '';
	        $this->gender 				= ($this->CI->input->get('gender')) ? $this->CI->input->get('gender') : '0';
	        $this->candidate_year		= ($this->CI->input->get('candidate_year')) ? $this->CI->input->get('candidate_year') : '0';

	        $this->exam_name   			= ($this->CI->input->get('exam_name')) ? $this->CI->input->get('exam_name') : '';
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



	public function candidate_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT c.user_id, u.username, c.name, c.enrollment_no, c.mobile, c.address, c.gender, c.send_mail, c.registration_date, cbb.branch_id, cbb.batch_id, u.last_login, u.banned FROM xtra_candidate as c JOIN users as u ON  u.user_id = c.user_id LEFT JOIN xtra_candidate_branch_batch as cbb ON c.user_id = cbb.candidate_id WHERE 1 = 1 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/candidate') );
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

		$query = "SELECT * FROM xtra_subject as s WHERE s.active=1 ${condition}";

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

		$query = "SELECT st.topic, st.created_at, s.id, s.subject, st.active FROM xtra_subject_topic as st left join xtra_subject as s on s.id = st.subject_id WHERE st.active = 1 ${condition}";

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

		$query = "SELECT * FROM xtra_category as c WHERE c.active = 1 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/question/category') );
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

	public function branch_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT `name`,`address`,`country`,`state`,`city`,`phone`,`contact_person`,`mobile`,`created_at` FROM xtra_branch as b WHERE baned = 0 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/branch') );
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

	public function batch_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT batch.`batch_name`,branch.name,batch.created_at FROM `xtra_batch` as batch left join xtra_branch as branch on batch.`branch_id`=branch.id WHERE batch.`active` =1 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/branch/batch') );
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



	public function user_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT user_id,email,username,created_at FROM users WHERE auth_level = 4 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/branch/user') );
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



	public function exam_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT e.id, e.exam_name, e.exam_duration, e.total_questions, e.total_marks, e.description, e.created_at FROM xtra_exam as e WHERE 1 = 1 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/branch/user') );
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


	public function schedule_list_pagination($args) {

		$this->_args();
		$condition = $this->listCondition();

		$query = "SELECT * FROM ( SELECT es.id, es.exam_id, es.schedule_name, es.description, es.start_date, es.end_date, es.result_date, es.offered_as, es.offer_cost, es.result_as, es.schedule_to, es.created_at, ( CASE WHEN es.active = 0 THEN 'deactivated' WHEN es.start_date >= NOW() THEN 'upcomming' WHEN es.start_date <= NOW() AND es.end_date >= NOW() THEN 'processing' ELSE 'expired' END ) as schedule_status, ( CASE WHEN es.active = 0 THEN 3 WHEN es.start_date >= NOW() THEN 2 WHEN es.start_date <= NOW() AND es.end_date >= NOW() THEN 1 ELSE 4 END ) as status_order FROM xtra_exam_schedule as es ) as se WHERE 1=1 ${condition}";

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
		$this->paginate_link = $this->add_query_arg( $this->args['arg'], base_url('admin/branch/user') );
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
	    	$condition .= " AND s.subject LIKE  '%".$this->subject_name."%'";
	    	$this->args['arg']['subject_name'] = $this->subject_name;
	    }
	    if($this->topic_name != ''){
	    	$condition .= " AND t.topic LIKE  '%".$this->topic_name."%'";
	    	$this->args['arg']['topic_name'] = $this->topic_name;
	    }
	    if($this->category_name != ''){
	    	$condition .= " AND category LIKE  '%".$this->category_name."%'";
	    	$this->args['arg']['category_name'] = $this->category_name;
	    }
	    if($this->branch_name != ''){
	    	$condition .= " AND name LIKE  '%".$this->branch_name."%'";
	    	$this->args['arg']['branch_name'] = $this->branch_name;
	    }
	    if($this->batch_name != ''){
	    	$condition .= " AND batch_name LIKE  '%".$this->batch_name."%'";
	    	$this->args['arg']['batch_name'] = $this->batch_name;
	    }
	    if($this->phone_mobile != ''){
	    	$condition .= " AND (phone LIKE  '%".$this->phone_mobile."%' OR mobile LIKE '%".$this->phone_mobile."%')";
	    	$this->args['arg']['phone_mobile'] = $this->phone_mobile;
	    }
	    if($this->contact_person != ''){
	    	$condition .= " AND contact_person LIKE  '%".$this->contact_person."%'";
	    	$this->args['arg']['contact_person'] = $this->contact_person;
	    }


	    if($this->branch_id != '0'){
	    	$condition .= " AND cbb.branch_id =  ".$this->branch_id;
	    	$this->args['arg']['branch_name'] = $this->branch_id;
	    }
	    if($this->batch_id != '0'){
	    	$condition .= " AND cbb.batch_id IN (".$this->batch_id.")";
	    	$this->args['arg']['batch_id'] = $this->batch_id;
	    }	    
	    if($this->contact_no != ''){
	    	$condition .= " AND (phone LIKE  '%".$this->contact_no."%' OR mobile LIKE '%".$this->contact_no."%')";
	    	$this->args['arg']['contact_no'] = $this->contact_no;
	    }
	    if($this->user_name != ''){
	    	$condition .= " AND username LIKE  '%".$this->user_name."%'";
	    	$this->args['arg']['user_name'] = $this->user_name;
	    }
	    if($this->user_email != ''){
	    	$condition .= " AND email LIKE  '%".$this->user_email."%'";
	    	$this->args['arg']['user_email'] = $this->user_email;
	    }
	    if($this->gender != '0'){
	    	$condition .= " AND c.gender =  '".$this->gender."'";
	    	$this->args['arg']['gender'] = $this->gender;
	    }
	    if($this->candidate_year != '0') {
	    	$condition .= " AND Year(c.registration_date) =  '".$this->candidate_year."'";
	    	$this->args['arg']['candidate_year'] = $this->candidate_year;
	    }


	    if($this->exam_name != '') {
	    	$condition .= " AND e.exam_name LIKE  '%".$this->exam_name."%'";
	    	$this->args['arg']['exam_name'] = $this->exam_name;
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