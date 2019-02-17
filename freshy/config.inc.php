<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

@serendipity_plugin_api::load_language(dirname(__FILE__));

include(dirname(__FILE__) . '/functions.custom_imgsel.inc.php');

$imgsrc = array();
$headerdir = dirname(__FILE__) . '/images/headers/';
$handle = @opendir($headerdir);
$header_img_dir = 'images/headers/';

if(!$handle) {
    $imgsrc[serendipity_getTemplateFile($header_img_dir . 'Cards.jpg')] = 'Cards.jpg';
    $imgsrc[serendipity_getTemplateFile($header_img_dir . 'Birds.jpg')] = 'Birds.jpg';
} else {
    while (false !== ($imgfile = readdir($handle))) {
        if ($imgfile != '.' && $imgfile != '..') {
            $fullpath = serendipity_getTemplateFile($header_img_dir.$imgfile);
            $imgsrc[$fullpath] = $imgfile;
        }
    }
}

$freshy_header_text = array(
            'var'           => 'freshyheader',
            'heading'       => FRESHY_HEADER_TITLE,
            'description'   => FRESHY_HEADER_DESCRIPTION
);

$freshy_header_option = array(
            'type'      => 'select',
            'predef'    => array(),
            'custom'    => FRESHY_CUSTOM_HEADER
);

foreach($imgsrc AS $path => $filename) {
    $temp_arr = array('val' => $path, 'description' => $filename, 'preview' => true);
    $freshy_header_option['predef'][] = $temp_arr;
}
$freshy_header_html  = custom_output_script();
$freshy_header_html .= custom_imgsel($freshy_header_text,$freshy_header_option);

$template_config = array(
    array(
        'var'           => 'freshyheader_html',
        'type'          => 'content',
        'default'       => $freshy_header_html
        ),
    array(
        'var'           => 'sep1',
        'type'          => 'separator',
        'default'       => ''
        ),
    array(
        'var'           => 'navbg',
        'name'          => FRESHY_NAVBG_TITLE,
        'description'   => FRESHY_NAVBG_DESCRIPTION,
        'type'          => 'select',
        'select_values' => array('green'        =>FRESHY_NAVBG_GREEN,
                                 'blue'         =>FRESHY_NAVBG_BLUE,
                                 'purple'       =>FRESHY_NAVBG_PURPLE,
                                 'orange'       =>FRESHY_NAVBG_ORANGE,
                                 'red'          =>FRESHY_NAVBG_RED,
                                 'gray'         =>FRESHY_NAVBG_GRAY,
                                 'lightblue'    =>FRESHY_NAVBG_LIGHT_BLUE
                                ),
        'default'       => 'green'
        ),
    array('var'         => 'homelinklabel',
         'name'          => FRESHY_NAVLINK_TITLE.' 1',
        'description'   => FRESHY_HOMELINK_DESCRIPTION,
        'type'          => 'string',
        'default'       => 'Home'
        ),
    array(
        'var' => 'use_corenav',
        'name' => FRESHY_USE_CORENAV,
        'type' => 'boolean',
        'default' => false
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
