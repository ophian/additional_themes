<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => 'Color Set',
        'description'   => 'Enter the color set you want to use for this site',
        'type'          => 'select',
        'default'       => 'transred',
        'select_values' => array('transred' => 'Translucency red', 'transblue' => 'Translucency blue')
    )
);

$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, false);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
