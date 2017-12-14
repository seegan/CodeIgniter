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
	            return $key;
	        }
	    }
	    return false;
	} 
}

if( ! function_exists('checkCandidateBranchBatch') ) {
	function checkCandidateBranchBatch($branchs, $batchs, $branch, $batch) {
		$branch_search_key = is_numeric($branch) ? 'id' : 'name';
		$batch_search_key = is_numeric($batch) ? 'id' : 'batch_name';
		$branch_avail = array_search($branch, array_column($branchs, $branch_search_key ));

		if($branch_avail !== false) {
		    $data['branch_id'] = $branchs[$branch_avail]['id'];
		    $data['batch_id'] = 0;

		    $branch_search_key = is_numeric($branch) ? 'branch_id' : 'branch_name';
		    $batch_avail = searchInsideArray($batchs, $branch_search_key, $batch_search_key, $branch, $batch);

		    if($batch_avail !== false) {
		        $data['branch_id'] = $batchs[$batch_avail]['branch_id'];
		        $data['batch_id'] = $batchs[$batch_avail]['id'];

		    }
		    return $data;
		}

		return false;
	}
}


if( ! function_exists('checkQuestionSubjectTopic') ) {
	function checkQuestionSubjectTopic($subjects, $topics, $subject, $topic) {
        $data['subject_id'] = 0;
        $data['topic_id'] = 0;

        $subject_search_key = is_numeric($subject) ? 'id' : 'subject';
        $topic_search_key = is_numeric($topic) ? 'id' : 'topic';
        $subject_avail = array_search($subject, array_column($subjects, $subject_search_key ));

        if($subject_avail !== false) {
            $data['subject_id'] = $subjects[$subject_avail]['id'];
            $data['topic_id'] = 0;

            $subject_search_key = is_numeric($subject) ? 'subject_id' : 'subject';
            $topic_avail = searchInsideArray($topics, $subject_search_key, $topic_search_key, $subject, $topic);

            if($topic_avail !== false) {
                $data['subject_id'] = $topics[$topic_avail]['subject_id'];
                $data['topic_id'] = $topics[$topic_avail]['id'];
            }
        }

        return $data;
    }
}


if( ! function_exists('formOptionArray') ) {
	function singleChoiceOptionArray($options = array(), $answer = 0, $option_keys = array()) {

		$ans_arr = explode(',', $answer);
		if($options && is_array($options)) {
			$option_arr = array();
			foreach ($options as $option_key => $option_value) {

				if($option_value != '') {
					$key = ($option_key - 1);
					$option_arr[$option_key]['option'] = $option_value;
					$option_arr[$option_key]['option_key'] = $option_keys[$key];
					$option_arr[$option_key]['answer'] = false;
					if(in_array($option_key, $ans_arr)) {
						$option_arr[$option_key]['answer'] = true;
					}
				}
			}
			return $option_arr;
		}

		return false;
	}
}
