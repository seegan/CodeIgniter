<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Candidate_model extends MY_Model {

	public function getCandidateData($candidate_id = 0)
	{
		$query = $this->db->query("SELECT u.username, u.email, c.name, c.enrollment_no, c.ref_pass, c.mobile, c.phone, c.address, c.enquiry_from, c.hear_from, c.guardian_name, c.guardian_mobile, c.gender, c.send_mail, c.registration_date, c.birth_date FROM ".$this->db_table('candidate_table')." as c JOIN ".$this->db_table('user_table')." as u ON c.user_id = u.user_id WHERE c.user_id = ${candidate_id} AND u.auth_level = 1");
		return $query->row();
	}

	public function getCandidateBranch($candidate_id = 0)
	{
		$query = $this->db->query("SELECT cbb.branch_id, cbb.batch_id, b.name FROM ".$this->db_table('candidate_branch_batch_table')." as cbb JOIN ".$this->db_table('branch_table')." as b ON cbb.branch_id = b.id WHERE cbb.active = 1 AND cbb.candidate_id = ${candidate_id}");
		return $query->row();
	}

	public function getCandidateBatch($candidate_id = 0)
	{
		$query = $this->db->query("SELECT cbb.branch_id, cbb.batch_id, b.batch_name FROM ".$this->db_table('candidate_branch_batch_table')." as cbb JOIN ".$this->db_table('batch_table')." as b ON cbb.batch_id = b.id WHERE cbb.active = 1 AND cbb.candidate_id = ${candidate_id}");
		return $query->row();
	}
	
}