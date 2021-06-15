<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => 'Colorset',
        'description'   => 'Select colorset option',
        'type'          => 'select',
        'default'       => 'blue',
        'select_values' => array('default' => 'Blue', 'red' => 'Red')
    ),
    array(
        'var'           => 'contentposition',
        'name'          => 'Sidebar Position',
        'description'   => 'Sidebar left or right',
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
					             'desc' => array('Left', 'Right')),
        'default'       => 'true',
    ),
    array(
        'var'           => 'sitename',
        'name'          => 'Your Business Name',
        'description'   => 'Enter the year and business name',
        'type'          => 'string',
        'default'       => '2006 Your Business Name',
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
