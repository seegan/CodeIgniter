<?php  
defined('BASEPATH') or exit('No direct script access allowed');

if( ! function_exists('getQuestion') )
{
	function getQuestion($question_id = 0)
	{
		$CI =& get_instance();
		return $CI->question->getQuestion($question_id);
	}
}



if( ! function_exists('combainQuestionOptionAnswers') )
{
	function combainQuestionOptionAnswers($question_ids = 0)
	{
		$CI =& get_instance();
		$questions = $CI->question->getQuestions($question_ids, 'none');
		$answers = $CI->question->getAnswers($question_ids);
		$options = $CI->question->getOptions($question_ids);

		$answer_gruped = array();
		foreach ($answers as $item) {
		  // copy item to grouped
		  $answer_gruped[$item['question_id']] = $item;
		}
		$question_gruped = array();
		foreach ($questions as $item) {
		  	//copy item to grouped
			$item['answer_option'] = $answer_gruped[$item['question_id']]['option_id'];
		  	$question_gruped[$item['question_id']] = $item;

		  	$question_gruped[$item['question_id']]['options'] = $options;
		}
		return $question_gruped;
	}
}


if( ! function_exists('combainQuestionOptionAnswersMultiple') )
{
	function combainQuestionOptionAnswersMultiple($question_ids = 0)
	{
		$CI =& get_instance();
		$questions = $CI->question->getQuestions($question_ids, 'none');
		$answers = $CI->question->getAnswers($question_ids);
		$options = $CI->question->getOptions($question_ids);

		$answer_gruped = array();
		foreach ($answers as $item) {
		  // copy item to grouped
		  $answer_gruped[$item['question_id']][] = $item;
		}
		$question_gruped = array();
		foreach ($questions as $item) {
		  	//copy item to grouped
			$item['answer_option'] = $answer_gruped[$item['question_id']];
		  	$question_gruped[$item['question_id']] = $item;

		  	$question_gruped[$item['question_id']]['options'] = $options;
		}
		return $question_gruped;
	}
}
