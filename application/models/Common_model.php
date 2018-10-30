<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Common_model extends MY_Model {

	function insert($table,$data = array()) {
        $this->db->insert($table, $data);// common insert function 
        return $this->db->affected_rows() == 1 ? $this->db->insert_id() : false ;
    }

	function update($table, $condition = array(), $data = array()) {

	
		$this->db->trans_start();
		$this->db->where($condition);
		$this->db->update($table, $data);
		$this->db->trans_complete();

		if ($this->db->trans_status() !== FALSE) {
		    return true;
		}
		return false;
    }
				
}