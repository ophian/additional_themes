<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'abouttitle',
		'name'          => ABOUT_TITLE,
        'description'   => ABOUT_TITLE_DESC,
        'type'          => 'string',
        'default'       => 'About',
    ),
    array(
        'var'           => 'about',
		'name'          => ABOUT_TEXT,
        'description'   => ABOUT_TEXT_DESC,
        'type'          => 'string',
        'default'       => ABOUT_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'about_text_toggle',
		'name'          => ABOUT_BOX,
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
    )
);

$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
