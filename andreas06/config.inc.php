<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

/* ATTENT: There is currently NO WAY to preset a themes amount like this
           if using the serendipity_loadGlobalThemeOptions() function,
           which is a need to create the "amounted" navlink items.
           So you can either use this as a dummy, which is overwritten by the
           core preset default amount of (5) or use
           $template_config = array(); to initiate the array variable.
$template_config = array(
    array(
        'var'           => 'amount',
        'name'          => 'Number of navlinks',
        'description'   => 'Enter the number of navlinks you want to use in the navbar.',
        'type'          => 'string',
        'default'       => '4',
    ),
);
*/
$template_config = array();
$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, false);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
