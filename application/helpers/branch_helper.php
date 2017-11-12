<?php  
defined('BASEPATH') or exit('No direct script access allowed');

if( ! function_exists('unusedBranchUsers') )
{
	function unusedBranchUsers( )
	{
		$CI =& get_instance();
		return $CI->branch->unusedBranchUsers();
	}
}
