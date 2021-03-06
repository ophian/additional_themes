<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

#implement lang files first, then allow
#@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'         => 'Color Set',
        'description'   => 'Enter the color set you want to use for this site',
        'type'          => 'select',
        'default'       => 'sunset',
        'select_values' => array('softened' => 'Softened', 'sunset' => 'Sunset')
    ),
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : null;
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
