<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

if (is_array($all_cats = serendipity_fetchCategories('all'))) {
    $all_cats = serendipity_walkRecursive($all_cats, 'categoryid', 'parentid', VIEWMODE_THREADED);
    $catsel = array();
    foreach($all_cats AS $cat) {
        $catsel[$cat['categoryid']] = str_repeat('&nbsp;', $cat['depth']) . $cat['category_name'];
    }
}

$template_config = array(
    array(
        'var'         => 'sidebars',
        'name'        => SIDEBAR_TITLE,
        'type'        => 'string',
        'default'     => 'left,hide,right,left2'
    ),
    array(
        'var'         => 'newspapermode',
        'name'        => NEWSPAPER_MODE,
        'type'        => 'boolean',
        'default'     => 'true',
    ),
    array(
      'var'           => 'catx1',
      'name'          => MIMBO_CAT_X1,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catx2',
      'name'          => MIMBO_CAT_X2,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catx3',
      'name'          => MIMBO_CAT_X3,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catlead',
      'name'          => MIMBO_CAT_LEAD,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
        'var'         => 'amount',
        'name'        => NAVLINK_AMOUNT,
        'type'        => 'string',
        'default'     => '5',
    ),
    array(
        'var'         => 'enableslogan',
        'name'        => ENABLE_SLOGAN,
        'type'        => 'boolean',
        'default'     => 'true',
    ),
    array(
        'var'         => 'footerslogan',
        'name'        => FOOTER_SLOGAN,
        'type'        => 'string',
        'default'     => 'This is my Slogan for every page in the footer',
    )
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}

// CODE EXAMPLE:  How to save custom field variables within the serendipity "Edit/Create Entry" backend.
//                Any custom variables can later be queried inside the .tpl files through
//                  {if $entry.properties.special_switch == 'true'}...{/if}
// NOTE THAT THE PROPERTY IS ADDED *WITHOUT* the ep_ prefix! EP_ only comes from entryproperties.

// Helper function to get the variable content of a variable (TRUE/FALSE)
function sga_helper_get_value($special_key, &$eventData) {
    global $serendipity;
    $value = (isset($eventData['properties'][$special_key]) && serendipity_db_bool($eventData['properties'][$special_key]))
            || (isset($serendipity['POST']['properties'][$special_key]) && serendipity_db_bool($serendipity['POST']['properties'][$special_key]))
            ? true
            : false;

    return $value;
}

// Helper function to store form values into the serendipity database, so that they will be retrieved later.
function sga_helper_store($special_key, $special_val, &$eventData) {
    global $serendipity;

    $q = "DELETE FROM {$serendipity['dbPrefix']}entryproperties WHERE entryid = " . (int)$eventData['id'] . " AND property = '" . serendipity_db_escape_string($special_key) . "'";
    serendipity_db_query($q);

    if (!empty($special_val)) {
        $q = "INSERT INTO {$serendipity['dbPrefix']}entryproperties (entryid, property, value) VALUES (" . (int)$eventData['id'] . ", '" . serendipity_db_escape_string($special_key) . "', '" . serendipity_db_escape_string($special_val) . "')";
        serendipity_db_query($q);
    }
}

if (!function_exists('serendipity_plugin_api_pre_event_hook')) {
  function serendipity_plugin_api_pre_event_hook($event, &$bag, &$eventData, &$addData) {
    global $serendipity;

    // Check what Event is coming in, only react to those we want.
    switch($event) {

        // Displaying the backend entry section
        case 'backend_display':
            // INFO: The whole 'entryproperties' injection is easiest to store any data you want. The entryproperties plugin
            // should actually not even be required to do this, as serendipity loads all properties regardless of the installed plugin

            // The name of the variable
            $special_key  = 'special_switch';
            $special_key2 = 'special_switch2';
            $special_key3 = 'special_switch3';
            // Check what our special key is set to (checks both POST data as well as the actual data)
            $is_special  = sga_helper_get_value($special_key, $eventData);
            $is_special2 = sga_helper_get_value($special_key2, $eventData);
            $is_special3 = sga_helper_get_value($special_key3, $eventData);
            // This is the actual HTML output on the backend screen.
            // echo '<pre>' . print_r($eventData, true) . '</pre>';
            echo '<fieldset id="edit_entry_sagittariustheme" class="entryproperties_disablesidebars">
                        <span class="wrap_legend"><legend>Disable Sagittarius-theme sidebars</legend></span>';
            echo "Disable the footer sidebar (LEFT and LEFT2 Sidebar) ? ";

            echo '<input type="radio" name="serendipity[properties][' . $special_key2 . ']" value="true" ' . ($is_special2 ? 'checked="checked"' : '') . ' id="' . $special_key2 . '_true">';
            echo '  <label for="' . $special_key2 . '_true">' . YES . '</label> ';

            echo '<input type="radio" name="serendipity[properties][' . $special_key2 . ']" value="false" ' . (!$is_special2 ? 'checked="checked"' : '')  . ' id="' . $special_key2 . '_false">';
            echo '  <label for="' . $special_key2 . '_false">' . NO . '</label> ';

            echo "<br><br> Disable right sidebar?  ";

            echo '<input type="radio" name="serendipity[properties][' . $special_key . ']" value="true" ' . ($is_special ? 'checked="checked"' : '') . ' id="' . $special_key . '_true">';
            echo '  <label for="' . $special_key . '_true">' . YES . '</label> ';

            echo '<input type="radio" name="serendipity[properties][' . $special_key . ']" value="false" ' . (!$is_special ? 'checked="checked"' : '')  . ' id="' . $special_key . '_false">';
            echo '  <label for="' . $special_key . '_false">' . NO . '</label> ';

            echo "<br><br> Disable any text if comments are not allowed in entry-footer?  ";

            echo '<input type="radio" name="serendipity[properties][' . $special_key3 . ']" value="true" ' . ($is_special3 ? 'checked="checked"' : '') . ' id="' . $special_key3 . '_true">';
            echo '  <label for="' . $special_key . '_true">' . YES . '</label> ';

            echo '<input type="radio" name="serendipity[properties][' . $special_key3 . ']" value="false" ' . (!$is_special3 ? 'checked="checked"' : '')  . ' id="' . $special_key3 . '_false">';
            echo '  <label for="' . $special_key3 . '_false">' . NO . '</label> ';

            echo "</fieldset>\n";
            break;

        // To store the value of our entryproperties
        case 'backend_publish':
        case 'backend_save':

            // Call the helper function with all custom variables here.
            sga_helper_store('special_switch', $serendipity['POST']['properties']['special_switch'], $eventData);
            sga_helper_store('special_switch2', $serendipity['POST']['properties']['special_switch2'], $eventData);
            sga_helper_store('special_switch3', $serendipity['POST']['properties']['special_switch3'], $eventData);

            break;
    }

  }
}

