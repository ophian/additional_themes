<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

//@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'abouttitle',
        'name'          => 'About Title Text',
        'description'   => 'Enter the about box header text',
        'type'          => 'string',
        'default'       => 'About Me',
    ),
    array(
        'var'           => 'about',
        'name'          => 'abouttext',
        'description'   => 'About me text',
        'type'          => 'string',
        'default'       => 'Hi, This box is about me, and is edited from within the theme configurator. The link could point to a static page.',
    ),
    array(
        'var'           => 'aboutpageurl',
        'name'          => 'About page URL',
        'description'   => 'Enter the URL of your about page eg \'http://www.somesite.url\'',
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
