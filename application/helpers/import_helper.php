<?php  
defined('BASEPATH') or exit('No direct script access allowed');

if( ! function_exists('createImportDatabase') )
{
	function createImportDatabase($user_id = 0, $file_name = '', $import_type)
	{
		$CI =& get_instance();
		$table = 'xtra_import_files';
		$data = array('user_id' => $user_id, 'import_type' => $import_type, 'file_name' => $file_name);
		return $CI->common->insert($table, $data);
	}

	function getUploadFile($upload_id = 0, $user_id = 0, $level = 1, $active = 0 ) {

		$CI =& get_instance();
        $CI->db->select('xif.file_name, xif.import_data, xif.estimated_count')
          ->from('xtra_import_files AS xif')
          ->where('xif.id', $upload_id)
          ->where('xif.active', $active);
		if($level != 9) {
			$CI->db->where('xif.user_id', $user_id);
		}
   		
   		$query = $CI->db->get(); 
   		return  $query->row();
	}

	function updateCandidateImport($upload_id = 0, $update_data = '' ) {
		$CI =& get_instance();
		$table = 'xtra_import_files';
		$file_data = is_array($update_data) ? serialize($update_data) : serialize(array());
		$count = is_array($update_data) ? count($update_data) : 0;

		$cond = array('id' => $upload_id);
		$data = array('import_data' => $file_data, 'estimated_count' => $count, 'current_status' => 'analyze' );
		return $CI->common->update($table, $cond, $data);
	}
}