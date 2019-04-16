<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

# Template options:
$template_config = array(

    # Let the user choose a colorset:
    array (
        'var'           => 'colorset',
        'name'          => RESY_COLORSET,
        'type'          => 'select',
        'default'       => 'default',
        'select_values' => array(
            # Colorsets:
            'serendipity' => RESY_COLORSET_SERENDIPITY,
            'lime_and_melon_salad' => RESY_COLORSET_LIME_AND_MELON_SALAD,
            'default' => RESY_COLORSET_DEFAULT)
    ),

    # The position of the sidebar can be either left or right:
    array (
        'var'           => 'sidebar_position',
        'name'          => RESY_SIDEBAR_POSITION,
        'type'          => 'select',
        'default'       => 'right',
        'select_values' => array(
            'left' => RESY_LEFT,
            'right' => RESY_RIGHT)
    ),

    array (
        'var'           => 'sidebars',
        'type'          => 'hidden',
        'default'       => 'left,hide,right'
    ),

    # Options which are allowed in the Verekia-template but need refining:
    array (
        'var'           => 'navigation',
        'type'          => 'hidden',
        'default'       => 'false'
    ),

    array (
        'var'           => 'footer',
        'type'          => 'hidden',
        'default'       => 'false'
    )

);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
