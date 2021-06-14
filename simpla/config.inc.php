<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'pagewidth',
        'name'          => PAGE_WIDTH,
        'type'          => 'string',
        'default'       => '76em',
    ),
	array(
        'var'           => 'contentwidth',
        'name'          => CONTENT_WIDTH,
        'type'          => 'string',
        'default'       => '40em',
    ),
	array(
        'var'           => 'sidebarwidth',
        'name'          => SIDEBAR_WIDTH,
        'type'          => 'string',
        'default'       => '20em',
    ),
    array(
        'var'           => 'sidebarnavtitle',
        'name'          => SIDEBAR_NAVIGATION_TITLE,
        'type'          => 'string',
        'default'       => 'Navigation',
    ),
);

$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
