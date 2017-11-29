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

if( ! function_exists('getEligibleBatchsFromExam') )
{
	function getEligibleBatchsFromExam($exam_id = 0)
	{
		$CI =& get_instance();
		$serialized_questions = $CI->exam->getQuestionsFromExam($exam_id);
		$question_data = unserialize($serialized_questions->questions);
		if( is_array($question_data) && count($question_data) > 0 ) {
			$question_ids = implode(",", array_keys($question_data));
			$subjects = $CI->exam->getSubjectsFromQuestions($question_ids);
			if($subjects && is_array($subjects) && count($subjects) > 0) {

				$subject_arr = [];
				foreach ($subjects as $s_value) {
					$subject_arr[] = $s_value->subject;
				}

				$subject_count = count($subject_arr);
				$subjects_str = implode(",", $subject_arr);

				$batchs = $CI->exam->getBatchBasedSubject($subjects_str, $subject_count);
				return $batchs;
			}
		}

		return false;
	}
}


