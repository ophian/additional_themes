<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$footerposition= array("left-column", "middle-column", "right-column", "disable");

$istok = ' <span class="icon-ok-circled"></span> ';
$notok = ' <span class="icon-attention-circled"></span> ';

if (class_exists('serendipity_event_entryproperties'))  {
    $inst_ok = $istok . ' <span>OK: serendipity_event_entryproperties Plugin';

    $check = serendipity_db_query("SELECT * FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%serendipity_event_entryproperties:%/customfields' AND value LIKE '%MagazineCategoryImage%'");
    if (is_array($check) && isset($check[0]['config'])) {
        $inst_ok = $inst_ok . ' and customfield: "MagazineCategoryImage" exists</span><br>';
    } else {
        $inst_ok = $inst_ok . ', but has no customfield: "MagazineCategoryImage"</span><br>';
    }

} else {
    $inst_ok = $inst_ok . $notok.' <span>MISSING: serendipity_event_entryproperties Plugin </span><br>';
}

if (is_array($all_cats = serendipity_fetchCategories('all'))) {
    $all_cats = serendipity_walkRecursive($all_cats, 'categoryid', 'parentid', VIEWMODE_THREADED);
    $catsel = array();
    foreach($all_cats AS $cat) {
        $catsel[$cat['categoryid']] = str_repeat('&nbsp;', $cat['depth']) . $cat['category_name'];
    }
}

$template_config = array(
    array(
      'var'           => 'infoxkur',
      'name'          => 'infoxkur',
      'type'          => 'custom',
      'custom'        => $notok . INFO_XKUR,
    ),
    array(
		'var' 			=> 'sidebars',
		'name' 			=> SIDEBAR_TITLE,
		'type' 			=> 'string',
		'default'		=> 'left,hide,right,top'
	),
     array(
        'var'           => 'backgroundc',
        'name'          => BACKGROUNDC,
        'type'          => 'string',
        'default'       => '#f1f6fb',
    ),
    array(
        'var'           => 'enablehmenue',
        'name'          => ENABLECAT_HMENUE,
        'description'   => INFO_RELOAD,
        'type'          => 'boolean',
        'default'       => 'true'
    ),
    array(
        'var'          => 'installation_ok',
        'type'         => 'content',
        'default'      => "$inst_ok",
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'description'   => INFO_RELOAD,
        'type'          => 'string',
        'default'       => '5',
    ),
    array(
        'var'           => 'infofoot',
        'name'          => 'infofoot',
        'type'          => 'custom',
        'custom'        => INFO_FOOTER,
    ),
    array(
        'var'           => 'enablefooterl',
        'name'          => ENABLE_FOOTER_L,
        'type'          => 'boolean',
        'default'       => 'true'
    ),
    array(
        'var'           => 'enablefooterm',
        'name'          => ENABLE_FOOTER_M,
        'type'          => 'boolean',
        'default'       => 'true'
    ),
    array(
        'var'           => 'enablefooterr',
        'name'          => ENABLE_FOOTER_R,
        'type'          => 'boolean',
        'default'       => 'true'
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
        'var'           => 'footerpos',
        'name'          => FOOTERPOS,
        'type'          => 'select',
        'default'       => '',
        'select_values' => $footerposition,
    )
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false);/* We don't use the global navigation and do it ourselves later on, since adding an additional field to the array */
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}

$navlinks = array();

$sbmenue1 = array();
if (isset($template_loaded_config['sidebbarmenuesamount'])) {
    for ($i = 0; $i < $template_loaded_config['sidebbarmenuesamount']; $i++) {
        $template_config[] = array(
            'var'           => 'menue1' . $i . 'sbmenue_info',
            'type'          => 'content',
            'default'       => '<b style="color:#FFFFFF; background-color: red">'. SBMENUE_TITLE . ' #' . $i .'</b>' ,
            );
        $template_config[] = array(
            'var'           => 'menue1' . $i . 'text',
            'name'          => SBHEADER_TEXT,
            'type'          => 'string',
            'default'       => 'Menue #' . $i,
            );
        $template_config[] = array(
            'var'           => 'menue1' . $i . 'url',
            'name'          => SBHEADER_URL,
            'type'          => 'string',
            'default'       => '#',
        );
        $template_config[] = array(
            'var'           => 'menue1' . $i . 'target',
            'name'          => SB_TARGET,
            'type'          => 'select',
            'select_values' => $sbmtarget,
        );
        $template_config[] = array(
            'var'           => 'menue1' . $i . 'sitenav1_amount',
            'name'          => SIDEBARMENUE_AMOUNT,
            'type'          => 'string',
            'default'       => '0',
            );
        $template_config[] = array(
            'var'           => 'menue1' . $i . 'position',
            'name'          => SB_POSITION,
            'type'          => 'select',
            'select_values' => $menuepsition,
        );
        $menuepoints = array();
        if (isset($template_loaded_config['menue10sitenav1_amount'])) {
            for ($s = 0; $s < $template_loaded_config['menue1' . $i . 'sitenav1_amount']; $s++) {
                $template_config[] = array(
                'var'           => 'menue1' . $i . 'menuepoint' . $s . 'text',
                'name'          => SIDEBARMENUE_TEXT . ' #'. $s,
                'type'          => 'string',
                'default'       => 'Menue #' . $s.' link #' . $i ,
                    );
            $template_config[] = array(
                'var'           => 'menue1' . $i . 'menuepoint' . $s . 'url',
                'name'          => SIDEBARMENUE_URL . ' #'. $s,
                'type'          => 'string',
                'default'       => '#',
                    );
            $template_config[] = array(
                'var'           => 'menue1' . $i . 'menuepoint' . $s . 'target',
                'name'          => SB_TARGET . ' #'. $s,
                'type'          => 'select',
                'select_values' => $sbmtarget,
                    );
            $menuepoints[] = array(
                'title'     => $template_loaded_config['menue1' . $i . 'menuepoint' . $s . 'text'],
                'href'      => $template_loaded_config['menue1' . $i . 'menuepoint' . $s . 'url'],
                'target'    => $template_loaded_config['menue1' . $i . 'menuepoint' . $s . 'target'],
                    );
            }
            $sbmenue1[] = array(
                'sbmenue_info'  => $template_loaded_config['menue1' . $i . 'sbmenue_info'] ?? '',
                'title'         => $template_loaded_config['menue1' . $i . 'text'],
                'href'          => $template_loaded_config['menue1' . $i . 'url'],
                'target'        => $template_loaded_config['menue1' . $i . 'target'],
                'position'      => $template_loaded_config['menue1' . $i . 'position'],
                'menuepoints'   => $menuepoints,
            );
        }
    }
}
$serendipity['smarty']->assignByRef('sbmenue1', $sbmenue1);

/* don't show, if not saved and page additional reloaded */
if (!empty($template_loaded_config['enablehmenue'])) {
    for ($i = 0; $i < $template_loaded_config['amount']; $i++) {
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'navlink_info',
            'type'          => 'content',
            'default'       =>  '<b style="color:#FFFFFF; background-color: #0066FF">'. HORZ_NAV_LINK_TITLE . ' #' . $i .'</b>' ,
            );
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'text',
            'name'          => NAV_LINK_TEXT,
            'type'          => 'string',
            'default'       => 'Link #' . $i,
            );
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'url',
            'name'          => NAV_LINK_URL,
            'type'          => 'string',
            'default'       => '#',
        );
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'dramount',
            'name'          => DROPDOWN_AMOUNT,
            'type'          => 'string',
            'default'       => '0',
            );
        $dropdownentries = array();
        if (isset($template_loaded_config['navlink0dramount'])) {
            for ($k = 0; $k < $template_loaded_config['navlink' . $i . 'dramount']; $k++) {
                $template_config[] = array(
                    'var'           => 'navlink' . $i . 'dropdowentry' . $k . 'text',
                    'name'          => DROPDOWN_TEXT . ' #'. $k,
                    'type'          => 'string',
                    'default'       => 'Link #' . $i . ' dropdowentry #' . $k,
                    );
                $template_config[] = array(
                    'var'           => 'navlink' . $i . 'dropdowentry' . $k . 'url',
                    'name'          => DROPDOWN_URL . ' #'. $k,
                    'type'          => 'string',
                    'default'       => '#',
                    );

                $dropdownentries[] = array(
                    'title'     	=> $template_loaded_config['navlink' . $i . 'dropdowentry' . $k . 'text'],
                    'href'      	=> $template_loaded_config['navlink' . $i . 'dropdowentry' . $k . 'url'],
                    );
            }
            $navlinks[] = array(
                'navlinkinfo' 	    => $template_loaded_config['navlink' . $i . 'navlink_info'] ?? '',
                'title'         	=> $template_loaded_config['navlink' . $i . 'text'],
                'href'           	=> $template_loaded_config['navlink' . $i . 'url'],
                'drop'           	=> $template_loaded_config['navlink' . $i . 'dramount'],
                'dropdownentries'   => $dropdownentries,
            );
        }
    }
}
$serendipity['smarty']->assignByRef('navlinks', $navlinks);

$serendipity['smarty']->assign('tab1_cat', str_replace('&nbsp;', '', trim($catsel[$template_loaded_config['catx1']])) ?? null);
$serendipity['smarty']->assign('tab2_cat', str_replace('&nbsp;', '', trim($catsel[$template_loaded_config['catx2']])) ?? null);
$serendipity['smarty']->assign('tab3_cat', str_replace('&nbsp;', '', trim($catsel[$template_loaded_config['catx3']])) ?? null);

// CODE EXAMPLE:  How to save custom field variables within the serendipity "Edit/Create Entry" backend.
//                Any custom variables can later be queried inside the .tpl files through
//                  {if $entry.properties.special_switch == 'true'}...{/if}
// NOTE THAT THE PROPERTY IS ADDED *WITHOUT* the ep_ prefix! EP_ only comes from entryproperties.

// Helper function to get the variable content of a variable (TRUE/FALSE)
function helper_get_value($special_key, &$eventData) {
    global $serendipity;
    $value = (isset($eventData['properties'][$special_key]) && serendipity_db_bool($eventData['properties'][$special_key]))
            || (isset($serendipity['POST']['properties'][$special_key]) && serendipity_db_bool($serendipity['POST']['properties'][$special_key]))
            ? true
            : false;

    return $value;
}

// Helper function to store form values into the serendipity database, so that they will be retrieved later.
function helper_store($special_key, $special_val, &$eventData) {
    global $serendipity;

    $q = "DELETE FROM {$serendipity['dbPrefix']}entryproperties WHERE entryid = " . (int)$eventData['id'] . " AND property = '" . serendipity_db_escape_string($special_key) . "'";
    serendipity_db_query($q);

    if (!empty($special_val)) {
        $q = "INSERT INTO {$serendipity['dbPrefix']}entryproperties (entryid, property, value) VALUES (" . (int)$eventData['id'] . ", '" . serendipity_db_escape_string($special_key) . "', '" . serendipity_db_escape_string($special_val) . "')";
        serendipity_db_query($q);
    }
}

function serendipity_plugin_api_pre_event_hook($event, &$bag, &$eventData, &$addData) {
    global $serendipity;

    // Check what Event is coming in, only react to those we want.
    switch($event) {

        // Displaying the backend entry section
        case 'backend_display':
            // INFO: The whole 'entryproperties' injection is easiest to store any data you want. The entryproperties plugin
            // should actually not even be required to do this, as serendipity loads all properties regardless of the installed plugin

            // The name of the variable
            $special_key = 'special_switch';
            $special_key2 = 'special_switch2';
            // Check what our special key is set to (checks both POST data as well as the actual data)
            $is_special = helper_get_value($special_key, $eventData);
            $is_special2 = helper_get_value($special_key2, $eventData);

            // This is the actual HTML output on the backend screen.
            // echo '<pre>' . print_r($eventData, true) . '</pre>';
            echo' <fieldset id="edit_entry_xkurtheme" class="entryproperties_disablesidebars">
                        <span class="wrap_legend"><legend>Disable xkur-theme sidebars</legend></span>';
            echo "Disable left sidebar? ";

            echo '<input type="radio" name="serendipity[properties][' . $special_key2 . ']" value="true" ' . ($is_special2 ? 'checked="checked"' : '') . ' id="' . $special_key2 . '_true">';
            echo '  <label for="' . $special_key2 . '_true">' . YES . '</label> ';

            echo '<input type="radio" name="serendipity[properties][' . $special_key2 . ']" value="false" ' . (!$is_special2 ? 'checked="checked"' : '')  . ' id="' . $special_key2 . '_false">';
            echo '  <label for="' . $special_key2 . '_false">' . NO . '</label> ';

            echo "<br><br> Disable right sidebar? ";

            echo '<input type="radio" name="serendipity[properties][' . $special_key . ']" value="true" ' . ($is_special ? 'checked="checked"' : '') . ' id="' . $special_key . '_true">';
            echo '  <label for="' . $special_key . '_true">' . YES . '</label> ';

            echo '<input type="radio" name="serendipity[properties][' . $special_key . ']" value="false" ' . (!$is_special ? 'checked="checked"' : '')  . ' id="' . $special_key . '_false">';
            echo '  <label for="' . $special_key . '_false">' . NO . '</label> ';

            echo "</fieldset>\n";
            break;

        // To store the value of our entryproperties
        case 'backend_publish':
        case 'backend_save':

            // Call the helper function with all custom variables here.
            helper_store('special_switch', $serendipity['POST']['properties']['special_switch'], $eventData);
            helper_store('special_switch2', $serendipity['POST']['properties']['special_switch2'], $eventData);

            break;
    }

}

?>