<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Branch_model extends MY_Model {

	public function unusedBranchUsers()
	{

		$query = $this->db->query("SELECT u.user_id, u.username FROM ".$this->db_table('user_table')." as u LEFT JOIN  ".$this->db_table('branch_user_table')." as bu ON u.user_id = bu.user_id WHERE u.auth_level = 4 AND u.banned = '0' AND bu.user_id IS NULL");
		return $query->result();

		// Selected user table data
/*		$selected_columns = [
			'u.username',
			'u.email',
			'u.auth_level',
			'u.user_id',
			'u.banned'
		];
		$this->db->select( $selected_columns )
			->from( $this->db_table('user_table') . ' u' )
			->join( $this->db_table('branch_user_table') . ' bu', 'u.user_id = bu.user_id' )
			->where( 'u.auth_level', 4 )
			->where( 'u.banned', 0 );

		// If the session ID was NOT regenerated, the session IDs should match
		if( is_null( $this->session->regenerated_session_id ) )
		{
			$this->db->where( 's.id', $this->session->session_id );
		}

		// If it was regenerated, we can only compare the old session ID for this request
		else
		{
			$this->db->where( 's.id', $this->session->pre_regenerated_session_id );
		}

		$this->db->limit(1);
		$query = $this->db->get();

		if( $query->num_rows() == 1 )
		{
			$row = $query->row_array();

			// ACL is added
			$acl = $this->add_acl_to_auth_data( $row['user_id'] );

			return (object) array_merge( $row, $acl );
		}

		return FALSE;*/

	}


	function getAdminBranch() {
		$query = $this->db->query("SELECT b.id, b.name FROM ".$this->db_table('branch_table')." as b WHERE b.active = 1 AND b.baned = 0");
		return $query->result();
	}

	function getSubjectByBranch($branch_id = 0) {
		$query = $this->db->query("SELECT s.id, s.subject FROM ".$this->db_table('branch_subject_table')." as bs JOIN ".$this->db_table('subject_table')." as s ON bs.subject_id = s.id WHERE s.active = 1 AND bs.branch_id = ".$branch_id);
		return $query->result();
	}

	function getBatchByBranch($branch_id = 0) {
		$query = $this->db->query("SELECT b.id, b.branch_id, b.batch_name FROM ".$this->db_table('batch_table')." as b WHERE b.active = 1 AND b.branch_id = ".$branch_id);
		return $query->result();
	}




}