<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Exam_model extends MY_Model {

	public function getExamByName($name = '')
	{
		$query = $this->db->query("SELECT e.id, e.exam_name, e.exam_duration, e.total_questions, e.total_marks FROM ".$this->db_table('exam_table')." as e WHERE e.active = 1 AND e.exam_name LIKE '${name}%'");
		return $query->result();
	}


	public function getQuestionsFromExam($exam_id = 0) {
		$query = $this->db->query("SELECT eq.questions FROM ".$this->db_table('exam_questions_table')." as eq WHERE eq.active = 1 AND eq.exam_id = ${exam_id} LIMIT 1");
		return $query->row();
	}

	public function getExamQuestionsFromQuestionIds($question_ids = 0) {
		$query = $this->db->query("SELECT q.question, q.question_type, q.subject, q.topic, q.language, 	q.year, q.difficulty_level, q.right_mark, q.negative_mark, q.question_time, q.choice FROM ".$this->db_table('question_table')." as q WHERE q.active = 1 AND q.id IN (${question_ids})");
		return $query->result();
	}

	public function getQuestionAccessBranchs($question_ids = 0) {
		$query = $this->db->query("SELECT q.subject FROM ".$this->db_table('question_table')." as q WHERE q.active = 1 AND q.id IN (${question_ids}) GROUP BY q.subject");
		return $query->result();
	}


}