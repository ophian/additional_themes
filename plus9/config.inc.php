<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$istok = ' <img src="' . serendipity_getTemplateFile('img/ok.gif', 'serendipityHTTPPath', true). '" alt="" /> '; // forced!
$notok = ' <img src="' . serendipity_getTemplateFile('img/fehler.gif', 'serendipityHTTPPath', true). '" alt="" /> '; // forced!

$installation = 'Template Check:<br>';

if (class_exists('serendipity_event_freetag'))  {
    $inst_ok = $istok . ' <span>OK: serendipity_event_freetag Plugin </span><br>';
} else {
    $inst_ok = $notok . ' <span>MISSING: serendipity_event_freetag Plugin </span><br>';
}
if (class_exists('serendipity_event_entryproperties'))  {
    $inst_ok = $inst_ok . $istok . ' <span>OK: serendipity_event_entryproperties Plugin ';

    $check = serendipity_db_query("SELECT * FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%serendipity_event_entryproperties:%/customfields' AND value LIKE '%MagazineCategoryImage%'");
    if (is_array($check) && isset($check[0]['config'])) {
        $inst_ok = $inst_ok . ' and customfield: "MagazineCategoryImage" exists</span><br>';
    } else {
        $inst_ok = $inst_ok . ', but has no customfield: "MagazineCategoryImage"</span><br>';
    }

} else {
    $inst_ok = $inst_ok . $notok.' <span>MISSING: serendipity_event_entryproperties Plugin </span><br>';
}

if (class_exists('serendipity_event_staticpage'))  {
    $inst_ok = $inst_ok . $istok.' <span>OK: serendipity_plugin_staticpage Plugin </span><br>';
} else {
    $inst_ok = $inst_ok . $notok.' <span>MISSING: serendipity_plugin_staticpage Plugin </span><br>';
}

$template_config = array(
    array(
        'var'           => 'installation_ok',
        'type'          => 'content',
        'default'       => $inst_ok,
    ),
    array(
        'var'           => 'infoxxx1',
        'name'          => 'infoxxx1',
        'type'          => 'custom',
        'custom'        => J_INSTR,
    ),
    array(
        'var'           => 'enablecat',
        'name'          => ENABLE_CAT,
        'type'          => 'boolean',
        'default'       => true,
    ),
    array(
        'var'           => 'enablearch',
        'name'          => ENABLE_ARCH,
        'type'          => 'boolean',
        'default'       => false,
    ),
    array(
        'var'           => 'enablestat',
        'name'          => ENABLE_STAT,
        'type'          => 'boolean',
        'default'       => false,
    ),
    array(
        'var'           => 'statheader',
        'name'          => STAT_HEADER,
        'type'          => 'string',
        'default'       => 'change me',
    ),
    array(
        'var'           => 'enableuser',
        'name'          => ENABLE_USER,
        'type'          => 'boolean',
        'default'       => false,
    ),
    array(
        'var'           => 'enablelog',
        'name'          => ENABLE_LOG,
        'type'          => 'boolean',
        'default'       => true,
    ),
    array(
        'var'           => 'wppddd',
        'name'          => WPP_DDD,
        'type'          => 'boolean',
        'default'       => false,
    ),
    array(
        'var'           => 'addvtext',
        'name'          => ADDVTEXT,
        'type'          => 'text',
        'default'       => 'config google Advertising code in plugin',
    ),
    array(
        'var'           => 'enable_ad',
        'name'          => ENABLE_AD,
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array('Yes', 'No')),
        'default'       => 'false',
    ),
     array(
        'var'           => 'show_pagitop',
        'name'          => SHOW_PAGITOP,
        'type'          => 'boolean',
        'default'       => true,
    ),
	array(
        'var'           => 'show_pagibottom',
        'name'          => SHOW_PAGIBOTTOM,
        'type'          => 'boolean',
        'default'       => true,
    ),
    array(
        'var'           => 'my_addthis_account',
        'name'          => MY_ADDTHIS_ACCOUNT,
        'type'          => 'string',
        'default'       => 'Addthis.com Name',
    ),
    array(
	    'var'           => 'separator1',
	    'type'          => 'separator',
    ),
    array(
	    'var'           => 'separator_head',
        'type'          => 'content',
        'name'          => 'navlinks_group_title',
        'default'       => '<h3>Global tab and plugin drop down navigation settings:</h3>',
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '2',
    ),
    array(
	    'var'           => 'userdrop',
	    'name'          => USER_DROP,
	    'type'          => 'boolean',
	    'default'       => true,
      ),
    array(
        'var'           => 'dropd1',
        'name'          => DROP_D1,
        'type'          => 'string',
        'default'       => '5',
    ),
    array(
	    'var'           => 'dropheader',
	    'name'          => DROP_HEADER,
	    'type'          => 'string',
	    'default'       => 'Info',
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

$droplinks = array();

for ($i = 0; $i < $template_loaded_config['dropd1']; $i++) {
    $droplinks[] = array(
        'title' => @$template_loaded_config['droplink' . $i . 'text'],
        'href'  => @$template_loaded_config['droplink' . $i . 'url']
    );
    $template_config[] = array(
        'var'           => 'droplink' . $i . 'text',
        'name'          => DRNAV_LINK_TEXT . ' #' . $i,
        'type'          => 'string',
        'default'       => 'DropDownLink #' . $i,
        );

    $template_config[] = array(
        'var'           => 'droplink' . $i . 'url',
        'name'          => DRNAV_LINK_URL . ' #' . $i,
        'type'          => 'string',
        'default'       => '#',
    );
}

$serendipity['smarty']->assignByRef('droplinks', $droplinks);
