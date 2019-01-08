<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$template_config = array(
    array(
        'var'           => 'layout',
        'name'          => I3_LAYOUT,
        'type'          => 'select',
        'default'       => 'sbs',
        'select_values' => array('sbs' => 'S-B-S',
                                 'bss' => 'B-S-S',
                                 'ssb' => 'S-S-B')
    ),
    array(
        'var'           => 'infoxxx',
        'name'          => 'infoxxx',
        'type'          => 'custom',
        'custom'        => I3_DBX_INSTR,
    ),
    array(
        'var'           => 'dbx',
        'name'          => I3_DBX,
        'type'          => 'boolean',
        'default'       => 'false'
    ),
    array(
        'var'           => 'meta',
        'name'          => I3_META,
        'type'          => 'boolean',
        'default'       => 'true'
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '5',
    )
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
