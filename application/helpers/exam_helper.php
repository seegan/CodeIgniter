<?php  
defined('BASEPATH') or exit('No direct script access allowed');

if( ! function_exists('getExamByName') )
{
	function getExamByName($exam_name = '')
	{
		$CI =& get_instance();
		return $CI->exam->getExamByName($exam_name);
	}
}

if( ! function_exists('getSubjectsFromExam') )
{
	function getSubjectsFromExam($exam_id = 0)
	{
		$CI =& get_instance();
		$serialized_questions = $CI->exam->getQuestionsFromExam($exam_id);
		$question_data = unserialize($serialized_questions->questions);
		if( is_array($question_data) && count($question_data) > 0 ) {
			$question_ids = implode(",", array_keys($question_data));
			$questions = $CI->exam->getQuestionAccessBranchs($question_ids);
			return $questions;
		}

		return false;
	}
}


