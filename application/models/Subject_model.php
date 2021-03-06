<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Subject_model extends MY_Model {

	public function getSubjects($active = 1)
	{
		if($active == 'all') {
			$query = $this->db->query("SELECT s.id, s.subject, s.description FROM ".$this->db_table('subject_table')." as s");
		} else {
			$query = $this->db->query("SELECT s.id, s.subject, s.description FROM ".$this->db_table('subject_table')." as s WHERE s.active = ".$active);
		}

		return $query->result();
	}

	public function getSubjectsArray($active = 1)
	{
		if($active == 'all') {
			$query = $this->db->query("SELECT s.id, s.subject, s.description FROM ".$this->db_table('subject_table')." as s");
		} else {
			$query = $this->db->query("SELECT s.id, s.subject, s.description FROM ".$this->db_table('subject_table')." as s WHERE s.active = ".$active);
		}

		return $query->result_array();
	}

	public function getAllTopicsArray($active = 1)
	{
		if($active == 'all') {
			$query = $this->db->query("SELECT st.id, st.topic, st.subject_id, s.subject, st.description FROM ".$this->db_table('subject_topic_table')." as st JOIN ".$this->db_table('subject_table')." as s ON s.id = st.subject_id");
		} else {
			$query = $this->db->query("SELECT st.id, st.topic, st.subject_id, s.subject, st.description FROM ".$this->db_table('subject_topic_table')." as st JOIN ".$this->db_table('subject_table')." as s ON s.id = st.subject_id WHERE s.active = ".$active." AND st.active = ".$active);
		}
		return $query->result_array();
	}

	public function getTopicsByCategory( $cat_id = 0, $active = 1) {
		if($active == 'all') {
			$query = $this->db->query("SELECT st.id, st.topic, st.description FROM ".$this->db_table('subject_table')." as s JOIN ".$this->db_table('subject_topic_table')." as st ON s.id = st.subject_id WHERE st.subject_id = ".$cat_id." AND st.active = 1");
		} else {
			$query = $this->db->query("SELECT st.id, st.topic, st.description FROM ".$this->db_table('subject_table')." as s JOIN ".$this->db_table('subject_topic_table')." as st ON s.id = st.subject_id WHERE st.subject_id = ".$cat_id." AND st.active = 1 AND s.active =".$active);
		}

		return $query->result();
	}

	public function getQuestionTypes($active = 1) {
		if($active == 'all') {
			$query = $this->db->query("SELECT qt.id, qt.question_type FROM ".$this->db_table('question_type_table')." as qt");
		} else {
			$query = $this->db->query("SELECT qt.id, qt.question_type FROM ".$this->db_table('question_type_table')." as qt WHERE qt.active = ".$active);
		}

		return $query->result();
	}


	public function getQuestionTypesByCategory( $cat_id = 0, $active = 1) {
		if($active == 'all') {
			$query = $this->db->query("SELECT qt.id, qt.question_type  FROM (SELECT sq.type_id FROM ".$this->db_table('subject_table')." as s JOIN ".$this->db_table('subject_question_type_table')." as sq ON s.id = sq.subject_id WHERE sq.subject_id = ".$cat_id." AND sq.active = 1 GROUP BY sq.type_id) as t LEFT JOIN xtra_question_type as qt ON qt.id = t.type_id WHERE qt.active = 1");
		} else {
			$query = $this->db->query("SELECT qt.id, qt.question_type  FROM (SELECT sq.type_id FROM ".$this->db_table('subject_table')." as s JOIN ".$this->db_table('subject_question_type_table')." as sq ON s.id = sq.subject_id WHERE sq.subject_id = ".$cat_id." AND sq.active = 1 AND s.active =".$active." GROUP BY sq.type_id) as t LEFT JOIN xtra_question_type as qt ON qt.id = t.type_id WHERE qt.active = 1");
		}

		return $query->result();
	}



	public function getSubjectById( $subject_id = 0, $active = 1) {
		if($active == 'all') {
			$query = $this->db->query("SELECT s.id, s.subject, s.description FROM  xtra_subject as s WHERE s.id = ${subject_id}");
		} else {
			$query = $this->db->query("SELECT s.id, s.subject, s.description FROM  xtra_subject as s WHERE s.id = ${subject_id} AND s.active = ${active}");
		}
		return $query->row();
	}


	public function getSubjectTypesById( $subject_id = 0, $active = 1) {
		if($active == 'all') {
			$query = $this->db->query("SELECT sqt.type_id FROM  xtra_subject_question_type as sqt WHERE sqt.subject_id = ${subject_id}");
		} else {
			$query = $this->db->query("SELECT sqt.type_id FROM  xtra_subject_question_type as sqt WHERE sqt.subject_id = ${subject_id} AND sqt.active = ${active}");
		}
		return $query->result_array();
	}


	public function getSubjectNameById( $subject_id = 0) {
		$query = $this->db->query("SELECT s.subject FROM  xtra_subject as s WHERE s.id = ${subject_id}");
		return $query->row();
	}
	public function getTopicNameById( $topic_id = 0) {
		$query = $this->db->query("SELECT st.topic FROM  xtra_subject_topic as st WHERE st.id = ${topic_id}");
		return $query->row();
	}




}