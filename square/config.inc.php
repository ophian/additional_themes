<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$template_config = array(
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
        'var'           => 'navlink3text',
        'name'          => NAVLINK3_TEXT_TITLE,
        'description'   => NAVLINK3_TEXT_DESC,
        'type'          => 'string',
        'default'       => NAVLINK3_TEXT_DEFAULT,
    ),
    array(
        'var'           => 'navlink3url',
        'name'          => NAVLINK3_URL_TITLE,
        'description'   => NAVLINK3_URL_DESC,
        'type'          => 'string',
        'default'       => '#',
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
        'name'          => NAVLINK4_URL_TITLE,
        'description'   => NAVLINK4_URL_DESC,
        'type'          => 'string',
        'default'       => '#',
    ),
    /* amount scoped 'local' or 'single' does need array('navigation' => false) like further down to pass by the global navigation sets and use
    the "new" backend_templates_globalthemeoptions $template_config $supported hook to re-invent these local only navlink sets into the $template_loaded_config
    setting $supported['navigation'] to false, eg.
    $supported = array('navigation' => false); // false, when NOT using the global navigation but use a local one
    serendipity_plugin_api::hook_event('backend_templates_globalthemeoptions', $template_config, $supported);
    */
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '4',
        'scope'         => 'local',
    )
);
/* PLEASE NOTE: These predefined navlink items are not the recommended way for modern Serendipity dynamic (global) navlinks.
                They are an old, more statically alike approach to build navigation items.
                If tweaking the amount you have to remove them manually and their usage as navlink items in the index.tpl file. */

/* when using a $template_config_array(), even without the global set navigation items, you need to keep this following code */
$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false); // false, when not using the global navigation
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top); // Add additional third parameter ", true" to support boolean defaults, if have
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);
