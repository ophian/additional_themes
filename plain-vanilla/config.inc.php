<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

#$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
#                                     'currpage2' => $_SERVER['REQUEST_URI']));

#$template_config = array();

#$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
#$template_global_config = array('navigation' => false);
#$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
#serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);
