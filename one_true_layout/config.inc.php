<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

// Be nice to the frontend users. They don't need the additional constants and file lookups. Only load them when in Admin mode.
if (isset($serendipity['GET']['adminModule']) AND ($serendipity['GET']['adminModule'] == 'templates' || $serendipity['POST']['adminModule'] != 'templates')) {
    @serendipity_plugin_api::load_language(dirname(__FILE__));
}

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => THEME_COLORSET,
        'description'   => THEME_COLORSET_DESC,
        'type'          => 'select',
        'default'       => 'blue',
        'select_values' => array('default' => 'Default Blue', 'grey' => 'Grey Monotone', 'caramel' => 'Caramel', 'modern' => 'Modern Blue and Green')
    ),
    array(
        'var'           => 'entryfooterposition',
        'name'          => FOOTER_POSITION,
        'description'   => FOOTER_POSITION_DESC,
        'type'          => 'radio',
        'radio'         => array('value' => array('true', 'false'),
                                 'desc'  => array(SMALL_BOX, BELOW_ENTRY)),
        'default'       => 'true',
    ),
    array(
        'var'           => 'amount',
        'name'          => 'Number of navlinks',
        'description'   => 'Enter the number of navlinks you want to use in the navbar.',
        'type'          => 'string',
        'default'       => '5',
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
