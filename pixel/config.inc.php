<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'sidebars',
        'name'          => SIDEBAR_TITLE,
        'type'          => 'hidden',
        'value'         => 'top,left,hide,right,bot,',
    ),
    array(
        'var'           => 'showwelcome',
        'name'          => PIX_SHOWWELCOME,
        'type'          => 'boolean',
        'default'       => 'true',
    ),
    array(
        'var'           => 'welcometitle',
        'name'          => PIX_WELCOMETITLE,
        'type'          => 'string',
        'default'       => '',
    ),
    array(
        'var'           => 'welcometext',
        'name'          => PIX_WELCOMETEXT,
        'type'          => 'text',
        'default'       => '',
    ),
    array(
        'var'           => 'myfeedname',
        'name'          => PIX_MYFBID,
        'type'          => 'string',
        'default'       => '',
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

$topSidebarElements = serendipity_plugin_api::count_plugins('top');
$serendipity['smarty']->assignByRef('topSidebarElements', $topSidebarElements);
$botSidebarElements = serendipity_plugin_api::count_plugins('bot');
$serendipity['smarty']->assignByRef('botSidebarElements', $botSidebarElements);
