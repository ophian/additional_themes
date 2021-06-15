<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => THEME_COLORSET,
        'description'   => THEME_COLORSET_DESC,
        'type'          => 'select',
        'default'       => 'blue',
        'select_values' => array('blue' => 'Blue', 'green' => 'Green', 'orange' => 'Orange', 'red' => 'Red', 'purple' => 'Purple', 'black' => 'Black'),
    ),
    array(
        'var'           => 'copyrightname',
        'name'         => 'Copyright Name',
        'description'   => 'Name to appear in footer next to copyright symbol',
        'type'          => 'string',
        'default'       => 'Your Name',
    )
);

$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, false);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
