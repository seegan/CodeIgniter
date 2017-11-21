<?php  
defined('BASEPATH') or exit('No direct script access allowed');

if( ! function_exists('getYearList') )
{
	function getYearList( $selected_year = '' )
	{
		$CI =& get_instance();
		$year_list = $CI->config->item('years');
		$current_year = date('Y');
		$year_end = ($current_year + 3);

		foreach ($year_list as $key => $year) {
			$years[$key]['year'] = $year;
			$years[$key]['selected'] = false;
			if($year == $selected_year) {
				$years[$key]['selected'] = true;
			}
			if($year == $year_end) {
				break;
			}
		}

		return $years;
	}
}


if( ! function_exists('getLanguageList') )
{
	function getLanguageList( $selected_language = '' )
	{
		$CI =& get_instance();
		$language_list = $CI->config->item('languages');

		foreach ($language_list as $key => $language) {
			$languages[$key]['language'] = $language;
			$languages[$key]['selected'] = false;
			if($key == $selected_language) {
				$languages[$key]['selected'] = true;
			}
		}

		return $languages;
	}
}

if( ! function_exists('getDifficultyList') )
{
	function getDifficultyList( $selected_diff = '' )
	{
		$CI =& get_instance();
		$difficulty_list = $CI->config->item('difficulty');

		foreach ($difficulty_list as $key => $difficulty) {
			$difficulties[$key]['difficulty'] = $difficulty;
			$difficulties[$key]['selected'] = false;
			if($key == $selected_diff) {
				$difficulties[$key]['selected'] = true;
			}
		}

		return $difficulties;
	}
}
