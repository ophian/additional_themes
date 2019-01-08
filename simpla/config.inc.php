<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'PAGE_BREITE',
        'name'          => 'Page breite (76em)',
        'type'          => 'string',
        'default'       => '76em',
    ),
	array(
        'var'           => 'CONTENT_BREITE',
        'name'          => 'Content breite (40em)',
        'type'          => 'string',
        'default'       => '40em',
    ),
	array(
        'var'           => 'SIDEBAR_BREITE',
        'name'          => 'Sidebar breite (20em)',
        'type'          => 'string',
        'default'       => '20em',
    ),
    array(
        'var'           => 'SIDEBAR_NAVIGATION_TITLE',
        'name'          => 'Titel Sidebar Navigation (zum Ausschalten der Navigation leer lassen)',
        'type'          => 'string',
        'default'       => 'Navigation',
    ),
    array(
        'var'           => 'amount',
        'name'          => 'Navigation',
        'type'          => 'string',
        'default'       => '4',
    ),
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
