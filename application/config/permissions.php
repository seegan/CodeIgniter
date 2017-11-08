<?php
/**
 * @package        permissions.php
 * @subpackage     MyApp
 * @author         Anirudh K. Mahant
 * @created        09/05/2016 - 9:30 PM
 * @license        Creative Commons 3.0 Attribution
 * @licenseurl    https://creativecommons.org/licenses/by/3.0/us/
 * @desc           User Permissions Configuration
 * @link           https://www.ravendevelopers.com
 */

// TABLE TAKES REFRENCES FROM authentication.php IN community_auth CONFIG FILE
$config['user_role_permissions'] = array(
  'admin' => array(
    'dashboard'     => array('index'),
    'plugins'       => array('index', 'config'),
    'user'         => array('index', 'add', 'edit', 'delete'),
    'role'          => array('index', 'add', 'edit', 'delete'),
  ),
  'student' => array(
    'dashboard'        => array('index'),
    'customer'         => array('index', 'add', 'edit', 'remove'),
    'orders'           => array('index', 'add'), // Removed 'edit', 'remove' actions
    'myauth'           => array('login', 'logout', 'recover', 'recovery_verification'),
  )
);


$config['user_role_access'] = array( 
  
    'lots' => array(
      'name' => 'Products',
      'data' => array(
        'add_lot' => 'Add Stock',
        'lot_list' => 'Lot List', 
      ),
      'permission' => array(
        'add_lot' => true,
        'lot_list' => true, 
      ),
    ),
    'stocks' => array(
      'name' => 'Stocks',
      'data' => array(
        'add_stock' => 'Add Stock',
        'stock_list' => 'Stock List', 
      ),
      'permission' => array(
        'add_stock' => true,
        'stock_list' => true, 
      ),      
    ),
    'customers' => array(
      'name' => 'Customers',
      'data' => array(
        'add_customer' => 'Add Customer',
        'customer_list' => 'Customer List', 
      ),
      'permission' => array(
        'add_customer' => true,
        'customer_list' => true, 
      ),      
    ),
    'billing' => array(
      'name' => 'Sales & Billing',
      'data' => array(
        'add_billing' => 'Purchase & Sales', 
        'billing_list' => 'Billing List', 
      ),
      'permission' => array(
        'add_billing' => true,
        'billing_list' => true, 
      ),      
    ),
    'admin_user' => array(
      'name' => 'Admin Users',
      'data' => array(
        'add_admin' => 'Add New Admin', 
        'admin_list' => 'Admin List',
      ),
      'permission' => array(
        'add_admin' => true,
        'admin_list' => true, 
      ),      
    ),
    'roles' => array(
      'name' => 'Admin Roles',
      'data' => array(
        'add_roles' => 'Add New Role', 
        'role_list' => 'Role List', 
      ),
      'permission' => array(
        'add_roles' => true,
        'role_list' => true, 
      ),      

    )
  );



/*      $capabilities_order = array();
      foreach ($src_capabilities as $cap_key => $cap_value) {

        if(is_array($cap_value)) {
          foreach ($cap_value['data'] as $sub_key => $sub_value) {
            $capabilities_order[$sub_key] = $sub_value;
          }
        } else {
          $capabilities_order[$cap_key] = $cap_value;
        }
        
      }

      $data['capabilities_order'] = $capabilities_order;

*/



/*$src_capabilities = array( 
  
    'lots' => array(
      'name' => 'Products',
      'data' => array(
        'add_lot' => 'Add Stock',
        'lot_list' => 'Lot List', 
      ),
      'permission' => array(
        'add_lot' => (is_super_admin()) ? 'manage_options' : 'add_lot',
        'lot_list' => (is_super_admin()) ? 'manage_options' : 'lot_list', 
      ),
    ),
    'stocks' => array(
      'name' => 'Stocks',
      'data' => array(
        'add_stock' => 'Add Stock',
        'stock_list' => 'Stock List', 
      ),
      'permission' => array(
        'add_stock' => (is_super_admin()) ? 'manage_options' : 'add_stock',
        'stock_list' => (is_super_admin()) ? 'manage_options' : 'stock_list', 
      ),      
    ),
    'customers' => array(
      'name' => 'Customers',
      'data' => array(
        'add_customer' => 'Add Customer',
        'customer_list' => 'Customer List', 
      ),
      'permission' => array(
        'add_customer' => (is_super_admin()) ? 'manage_options' : 'add_customer',
        'customer_list' => (is_super_admin()) ? 'manage_options' : 'customer_list', 
      ),      
    ),
    'billing' => array(
      'name' => 'Sales & Billing',
      'data' => array(
        'add_billing' => 'Purchase & Sales', 
        'billing_list' => 'Billing List', 
      ),
      'permission' => array(
        'add_billing' => (is_super_admin()) ? 'manage_options' : 'add_billing',
        'billing_list' => (is_super_admin()) ? 'manage_options' : 'billing_list', 
      ),      
    ),
    'admin_user' => array(
      'name' => 'Admin Users',
      'data' => array(
        'add_admin' => 'Add New Admin', 
        'admin_list' => 'Admin List',
      ),
      'permission' => array(
        'add_admin' => (is_super_admin()) ? 'manage_options' : 'add_admin',
        'admin_list' => (is_super_admin()) ? 'manage_options' : 'admin_list', 
      ),      
    ),
    'roles' => array(
      'name' => 'Admin Roles',
      'data' => array(
        'add_roles' => 'Add New Role', 
        'role_list' => 'Role List', 
      ),
      'permission' => array(
        'add_roles' => (is_super_admin()) ? 'manage_options' : 'add_roles',
        'role_list' => (is_super_admin()) ? 'manage_options' : 'role_list', 
      ),      

    )
  );

var_dump($src_capabilities);*/

/*$config['user_menu_permissions'] = array(
  'admin' => array(
    'dashboard'     => array('index'),
    'plugins'       => array('index', 'config'),
    'users'         => array('index', 'add', 'edit', 'delete'),
    'role'          => array('index', 'add', 'edit', 'delete'),
  ),
  'student' => array(
    'dashboard'        => array('index'),
    'customer'         => array('index', 'add', 'edit', 'remove'),
    'orders'           => array('index', 'add'), // Removed 'edit', 'remove' actions
    'myauth'           => array('login', 'logout', 'recover', 'recovery_verification'),
  )
);*/