<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

if (is_array($all_cats = serendipity_fetchCategories('all'))) {
    $all_cats = serendipity_walkRecursive($all_cats, 'categoryid', 'parentid', VIEWMODE_THREADED);
    $catsel = array();
    foreach($all_cats AS $cat) {
        $catsel[$cat['categoryid']] = str_repeat('&nbsp;', $cat['depth']) . $cat['category_name'];
    }
}

$template_config = array(
    array(
      'var'           => 'infoxxx1',
      'name'          => 'infoxxx1',
      'type'          => 'custom',
      'custom'        => MIMBO_INSTR,
    ),
    array(
      'var'           => 'catlead',
      'name'          => MIMBO_CAT_LEAD,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catfeat',
      'name'          => MIMBO_CAT_FEAT,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catx1',
      'name'          => MIMBO_CAT_X1,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catx2',
      'name'          => MIMBO_CAT_X2,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
      'var'           => 'catx3',
      'name'          => MIMBO_CAT_X3,
      'type'          => 'select',
      'default'       => '',
      'select_values' => $catsel,
    ),
    array(
        'var'         => 'amount',
        'name'        => NAVLINK_AMOUNT,
        'type'        => 'string',
        'default'     => '5',
    )
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => true);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);
#print_r($template_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}
