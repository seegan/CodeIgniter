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

		$question_data = ($serialized_questions) ? json_decode($serialized_questions->questions, true) : false;
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

if( ! function_exists('getExamById') )
{
	function getExamById($exam_id = 0)
	{
		$CI =& get_instance();
		return $CI->exam->getExamById($exam_id);
	}
}



if( ! function_exists('getExamQuestions') )
{
	function getExamQuestions($exam_id = 0)
	{
		$CI =& get_instance();
		$datas = $CI->exam->getQuestionsFromExam($exam_id);

		if($datas && isset($datas->questions) ) {
			$data['exam_questions'] = json_decode($datas->questions, true);
			if(is_array($data['exam_questions'])) {
				$question_ids = implode(',', array_keys($data['exam_questions']));
				$question_ids = ($question_ids) ? $question_ids : 0;
				$data['questions'] = $CI->exam->getExamQuestions($exam_id);

				return $data;	
			}
		}
		return false;
	}
}




/*if( ! function_exists('getExamQuestions') )
{
	function getExamQuestions($exam_id = 0)
	{
		$CI =& get_instance();
		$datas = $CI->exam->getQuestionsFromExam($exam_id);

		if($datas && isset($datas->questions) ) {
			$data['exam_questions'] = json_decode($datas->questions, true);
			if(is_array($data['exam_questions'])) {
				$question_ids = implode(',', array_keys($data['exam_questions']));
				$question_ids = ($question_ids) ? $question_ids : 0;
				$data['questions'] = $CI->question->getQuestions($question_ids);
				echo "<pre>";
				var_dump($data['questions']); die();
				return $data;	
			}
		}
		return false;
	}
}*/


if( ! function_exists('getScheduleCandidates') )
{
	function getScheduleCandidates($schedule_id = 0)
	{
		$CI =& get_instance();
		$data = $CI->exam->getCandidatesFromSchedule($schedule_id);
		if($data && isset($data->candidates) ) {
			$schedule_candidates = json_decode($data->candidates, true);
			if(is_array($schedule_candidates)) {
				$candidate_ids = implode(',', array_keys($schedule_candidates));
				$candidate_ids = ($candidate_ids) ? $candidate_ids : 0;
				$candidates = $CI->candidate->getCandidates($candidate_ids);
				return $candidates;	
			}
		}
		return false;
	}
}


if( ! function_exists('getScheduleById') )
{
	function getScheduleById($schedule_id = 0)
	{
		$CI =& get_instance();
		return $CI->exam->getScheduleById($schedule_id);
	}
}

if( ! function_exists('getScheduleBatchs') )
{
	function getScheduleBatchs($schedule_id = 0)
	{
		$CI =& get_instance();
		return $CI->exam->getScheduleBatchs($schedule_id);
	}
}


if( ! function_exists('getInstructionById') )
{
	function getInstructionById($instruction_id = 0)
	{
		$CI =& get_instance();
		return $CI->exam->getInstructionById($instruction_id);
	}
}

