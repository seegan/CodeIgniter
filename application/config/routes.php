<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

$route[LOGIN_PAGE] = 'admin/auth/login';

$route['admin/branch'] = 'admin/branch/branch/index';
$route['admin/branch/add'] = 'admin/branch/branch/add';
$route['admin/branch/getBranchSubjects'] = 'admin/branch/branch/getBranchSubjects';

$route['admin/subject'] = 'admin/subject/subject/index';
$route['admin/subject/add'] = 'admin/subject/subject/add';
$route['admin/subject/update/(:num)'] = 'admin/subject/subject/update/$1';

$route['admin/question'] = 'admin/question/question/index';
$route['admin/question/add'] = 'admin/question/question/add';

$route['admin/question/getQuestionOptions'] = 'admin/question/question/getQuestionOptions';
$route['admin/question/getQuestionData'] = 'admin/question/question/getQuestionData';

$route['admin/candidate'] = 'admin/candidate/candidate/index';
$route['admin/candidate/add'] = 'admin/candidate/candidate/add';

$route['admin/exam'] = 'admin/exam/exam/index';
$route['admin/exam/add'] = 'admin/exam/exam/add';