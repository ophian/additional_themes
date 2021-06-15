<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

@define('DATE_FORMAT_CEEJAY01_TITLE', '%B %e. %Y');
@define('DATE_FORMAT_CEEJAY01_FOOTER', '%A, %B %e. %Y @ %H:%M');

$template_config = array(
    array(
        'var'           => 'about',
        'name'          => 'abouttext',
        'description'   => 'About me text, maximum 60 characters',
        'type'          => 'string',
        'default'       => 'Hi, Welcome to my site, please bookmark me, and feel free to comment on my posts',
    ),
    array(
        'var'           => 'aboutpageurl',
        'name'          => 'About page URL',
        'description'   => 'Enter the URL of your about page eg \'http://www.somesite.url\'',
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'copyrightname',
        'name'          => 'CopyrightName',
        'description'   => 'Name to appear in footer next to copyright symbol',
        'type'          => 'string',
        'default'       => 'Your Business Name',
    ),
    array(
        'var'           => 'impressum',
        'name'          => 'Impressum Text',
        'description'   => 'Footer link, could be used for Impressum or disclaimer',
        'type'          => 'string',
        'default'       => 'Impressum',
    ),
    array(
        'var'           => 'impressumurl',
        'name'          => 'Impressum URL',
        'description'   => 'Enter the footer link URL eg \'http://www.somesite.url\'',
        'type'          => 'string',
        'default'       => '#',
    ),
);

$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, false);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
