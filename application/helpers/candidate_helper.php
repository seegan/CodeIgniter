<?php  
defined('BASEPATH') or exit('No direct script access allowed');


if( ! function_exists('getCandidateData') )
{
	function getCandidateData($candidate_id = 0)
	{
		$CI =& get_instance();
		return $CI->candidate->getCandidateData($candidate_id);
	}
}

if( ! function_exists('getCandidateBranch') )
{
	function getCandidateBranch($candidate_id = 0)
	{
		$CI =& get_instance();
		return $CI->candidate->getCandidateBranch($candidate_id);
	}
}

if( ! function_exists('getCandidateBatch') )
{
	function getCandidateBatch($candidate_id = 0)
	{
		$CI =& get_instance();
		return $CI->candidate->getCandidateBatch($candidate_id);
	}
}

