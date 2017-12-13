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


if( ! function_exists('in_array_r') )
{
	function in_array_r($needle, $haystack, $strict = false) {
	    foreach ($haystack as $item) {
	        if (($strict ? $item === $needle : $item == $needle) || (is_array($item) && in_array_r($needle, $item, $strict))) {
	            return true;
	        }
	    }

	    return false;
	}
}



if( ! function_exists('join_date_time') )
{
	function join_date_time($date = '12 Dec 2017', $time= '00:00 AM') {
		$date_time = $date.' '.$time;
		return $date_time;
	}
}

if( ! function_exists('man_to_machine_date') )
{
	function man_to_machine_date($date_time) {
		return date("Y-m-d H:i:s", strtotime($date_time));
	}
}

if( ! function_exists('machine_to_man_date') )
{
	function machine_to_man_date($date_time) {
		return date("d M Y", strtotime($date_time));
	}
}


if( ! function_exists('searchInsideArray') ) {
	function searchInsideArray ($arr, $key1, $key2, $val1, $val2) {
	    $r = array();
	    foreach ($arr as $key => $test) {
	        if ( strtolower($test[$key1]) == strtolower($val1) && strtolower($test[$key2]) == strtolower($val2) ) {
	            return true;
	        }
	    }
	    return false;
	} 
}
