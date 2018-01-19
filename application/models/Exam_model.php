<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Exam_model extends MY_Model {

	public function getExamById($exam_id = '')
	{
		$query = $this->db->query("SELECT e.* FROM ".$this->db_table('exam_table')." as e WHERE e.id = ${exam_id}");
		return $query->row_array();
	}

	public function getExamByName($name = '')
	{
		$query = $this->db->query("SELECT e.id, e.exam_name, e.exam_duration, e.total_questions, e.total_marks FROM ".$this->db_table('exam_table')." as e WHERE e.active = 1 AND e.exam_name LIKE '${name}%'");
		return $query->result();
	}

	public function getQuestionsFromExam($exam_id = 0) {
		$query = $this->db->query("SELECT eq.questions FROM ".$this->db_table('exam_questions_table')." as eq WHERE eq.active = 1 AND eq.exam_id = ${exam_id} LIMIT 1");
		return $query->row();
	}

	public function getCandidatesFromSchedule($schedule_id = 0) {
		$query = $this->db->query("SELECT sc.candidates FROM ".$this->db_table('exam_schedule_candidate_table')." as sc WHERE sc.active = 1 AND sc.schedule_id = ${schedule_id} LIMIT 1");
		return $query->row();
	}


	public function getExamQuestionsFromQuestionIds($question_ids = 0) {
		$query = $this->db->query("SELECT q.question, q.question_type, q.subject, q.topic, q.language, 	q.year, q.difficulty_level, q.right_mark, q.negative_mark, q.question_time, q.choice FROM ".$this->db_table('question_table')." as q WHERE q.active = 1 AND q.id IN (${question_ids})");
		return $query->result();
	}


	public function getSubjectsFromQuestions($question_ids = 0) {
		$query = $this->db->query("SELECT q.subject FROM ".$this->db_table('question_table')." as q WHERE q.active = 1 AND q.id IN (${question_ids}) GROUP BY q.subject");
		return $query->result();
	}

	public function getBatchBasedSubject($subject_ids = 0, $subject_count) {
		$query = $this->db->query("SELECT bs.batch_id, b.branch_id, b.batch_name FROM ".$this->db_table('batch_subject_table')." as bs JOIN  ".$this->db_table('batch_table')." as b ON bs.batch_id = b.id WHERE bs.subject_id IN (${subject_ids}) AND b.active = 1 GROUP BY bs.batch_id HAVING COUNT(bs.subject_id) = ${subject_count}");

		return $query->result();
	}


	public function getScheduleById($schedule_id = 0)
	{
		$query = $this->db->query("SELECT es.* FROM ".$this->db_table('exam_schedule_table')." as es WHERE es.id = ${schedule_id}");
		return $query->row_array();
	}

	public function getScheduleBatchs($schedule_id = 0)
	{
		$query = $this->db->query("SELECT sb.* FROM ".$this->db_table('exam_schedule_batch_table')." as sb WHERE sb.schedule_id = ${schedule_id}");
		return $query->result_array();
	}


	public function getInstructionById($instruction_id = '')
	{
		$query = $this->db->query("SELECT i.* FROM ".$this->db_table('instruction_table')." as i WHERE i.id = ${instruction_id}");
		return $query->row_array();
	}
/**/

}