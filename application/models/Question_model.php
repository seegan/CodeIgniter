<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Question_model extends MY_Model {

	public function getQuestion($question_id = 0) {

		$query = $this->db->query("SELECT q.* FROM ".$this->db_table('question_table')." as q WHERE q.id=${question_id}");
		return $query->row_array();
	}

	public function getQuestions($questions, $get = 'none') {

		$query = $this->db->query("SELECT q.id as question_id, q.* FROM xtra_question as q WHERE q.id IN ($questions) AND q.active = 1");
		return $query->result_array();
	}

	public function getOptions($questions = 0) {
		$query = $this->db->query("SELECT so.option_id, so.question_id, so.option_key, so.option_val FROM xtra_single_options as so WHERE so.question_id IN ($questions) AND so.active = 1");
		return $query->result_array();
	}

	public function getAnswers($questions = 0) {
		$query = $this->db->query("SELECT sa.question_id, sa.option_id FROM xtra_single_answer as sa WHERE sa.question_id IN ($questions)");
		return $query->result_array();
	}

}