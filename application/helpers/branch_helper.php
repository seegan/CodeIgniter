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

if( ! function_exists('getAdminBranch') )
{
	function getAdminBranch()
	{
		$CI =& get_instance();
		return $CI->branch->getAdminBranch();
	}
}

if( ! function_exists('getAdminBranchArray') )
{
	function getAdminBranchArray()
	{
		$CI =& get_instance();
		return $CI->branch->getAdminBranchArray();
	}
}



if( ! function_exists('getAllBatchs') )
{
	function getAllBatchs()
	{
		$CI =& get_instance();
		return $CI->branch->getAllBatchs();
	}
}



if( ! function_exists('getSubjectByBranch') )
{
	function getSubjectByBranch($branch_id = 0)
	{
		$CI =& get_instance();
		return $CI->branch->getSubjectByBranch($branch_id);
	}
}

if( ! function_exists('getBatchByBranch') )
{
	function getBatchByBranch($branch_id = 0)
	{
		$CI =& get_instance();
		return $CI->branch->getBatchByBranch($branch_id);
	}
}



