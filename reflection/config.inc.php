<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
    array(
        'var'           => 'colorset',
        'name       '   => THEME_COLORSET,
        'type'          => 'select',
        'default'       => 'default',
        'select_values' => array('default' => THEME_YELLOW, 'aqua' => THEME_AQUA)
    ),
    array(
        'var'           => 'navlink1text',
        'name'          => NAVLINK1_TEXT_TITLE,
        'description'   => NAVLINK1_TEXT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK1_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'navlink1url',
        'name'          => NAVLINK1_URL_TITLE,
        'description'   => NAVLINK1_URL_DESC,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'navlink1alt',
        'name'          => NAVLINK1_ALT_TITLE,
        'description'   => NAVLINK1_ALT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK2_ALT_DEFAULT,
    ),
    array(
        'var'           => 'navlink2text',
        'name'          => NAVLINK2_TEXT_TITLE,
        'description'   => NAVLINK2_TEXT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK2_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'navlink2url',
        'name'          => NAVLINK2_URL_TITLE,
        'description'   => NAVLINK2_URL_DESC,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'navlink2alt',
        'name'          => NAVLINK2_ALT_TITLE,
        'description'   => NAVLINK2_ALT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK2_ALT_DEFAULT,
    ),
    array(
        'var'           => 'navlink3text',
        'name'         => NAVLINK3_TEXT_TITLE,
        'description'   => NAVLINK3_TEXT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK3_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'navlink3url',
        'name'         => NAVLINK3_URL_TITLE,
        'description'   => NAVLINK3_URL_DESC,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'navlink3alt',
        'name'          => NAVLINK3_ALT_TITLE,
        'description'   => NAVLINK3_ALT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK3_ALT_DEFAULT,
    ),
    array(
        'var'           => 'navlink4text',
        'name'          => NAVLINK4_TEXT_TITLE,
        'description'   => NAVLINK4_TEXT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK4_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'navlink4url',
        'name'         => NAVLINK4_URL_TITLE,
        'description'   => NAVLINK4_URL_DESC,
        'type'          => 'string',
        'default'       => '#',
    ),
    array(
        'var'           => 'navlink4alt',
        'name'          => NAVLINK4_ALT_TITLE,
        'description'   => NAVLINK4_ALT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK4_ALT_DEFAULT,
    ),
);

$template_config_groups = NULL;
