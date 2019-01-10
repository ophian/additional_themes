<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

// Be nice to the frontend users. They don't need the additional constants
// and file lookups. Only load them when in Admin mode.
if (defined('IN_serendipity_admin')) {
    @serendipity_plugin_api::load_language(dirname(__FILE__));
}

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'abouttitle',
        'name'          => 'abouttitle',
		'name'          => ABOUT_TITLE,
        'description'   => ABOUT_TITLE_DESC,
        'type'          => 'string',
        'default'       => 'About',
    ),
    array(
        'var'           => 'about',
        'name'          => 'about_text',
		'name'          => ABOUT_TEXT,
        'description'   => ABOUT_TEXT_DESC,
        'type'          => 'string',
        'default'       => ABOUT_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'about_text_toggle',
        'description'   => USE_ABOUT_TEXT_DESC,
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array(AT_POS, AT_NEG)),
        'default'       => 'false'
    ),
    array(
        'var'           => 'aboutpageurl',
        'name'          => 'About page URL',
        'description'   => ABOUT_URL,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVNUM,
        'description'   => NAVNUMDESC,
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
