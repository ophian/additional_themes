<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => 'Color Set',
        'description'   => 'Enter the color set you want to use for this site',
        'type'          => 'select',
        'default'       => 'blue',
        'select_values' => array('blue' => 'Blue', 'pink' => 'Pink', 'maroon' => 'Maroon', 'green' => 'Green', 'nuclear' => 'Nuclear')
    ),
    array(
        'var'           => 'contentposition',
        'name'          => 'Sidebar Position',
        'description'   => 'Sidebar left or right',
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc' => array('Left', 'Right')),
        'default'       => 'true',
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
