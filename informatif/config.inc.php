<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => 'Color Set',
        'description'   => 'Enter the color set you want to use for this site',
        'type'          => 'select',
        'default'       => 'blue',
        'select_values' => array('original' => 'Original','beige' => 'Beige', 'pink' => 'Pink', 'caramel' => 'Caramel', 'olive' => 'Olive', 'black' => 'Black')
    ),
);

$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
