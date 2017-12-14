<?php  
defined('BASEPATH') or exit('No direct script access allowed');

if( !function_exists('getSubjects') )
{
	function getSubjects($active = 1)
	{
		$CI =& get_instance();
		return $CI->subject->getSubjects($active);
	}
}
if( !function_exists('getSubjectsArray') )
{
	function getSubjectsArray($active = 1)
	{
		$CI =& get_instance();
		return $CI->subject->getSubjectsArray($active);
	}
}

if( !function_exists('getAllTopicsArray') )
{
	function getAllTopicsArray($active = 1)
	{
		$CI =& get_instance();
		return $CI->subject->getAllTopicsArray($active);
	}
}



if( !function_exists('getTopicsByCategory') )
{
	function getTopicsByCategory($cat_id = 1, $active = 1)
	{
		$CI =& get_instance();

		return $CI->subject->getTopicsByCategory($cat_id, $active);
	}
}


if( !function_exists('getQuestionTypes') )
{
	function getQuestionTypes($active = 1)
	{
		$CI =& get_instance();

		return $CI->subject->getQuestionTypes($active);
	}
}

if( !function_exists('getQuestionTypesByCategory') )
{
	function getQuestionTypesByCategory($cat_id = 1, $active = 1)
	{
		$CI =& get_instance();

		return $CI->subject->getQuestionTypesByCategory($cat_id, $active);
	}
}


if( !function_exists('getSubjectDetailById') )
{
	function getSubjectDetailById($subject_id = 0)
	{
		$CI =& get_instance();
		$data['subject'] = $CI->subject->getSubjectById($subject_id);
		$data['subject_types'] = $CI->subject->getSubjectTypesById($subject_id);

		return $data;
	}
}
