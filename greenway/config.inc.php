<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

/* ATTENT: There is currently NO WAY to preset a themes amount like this since it will be overwritten by the
           core preset default amount of (5). This also applies for both NAV_LINK_URL and NAV_LINK_TEXT constants.
*/
$template_config = array(
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'type'          => 'string',
        'default'       => '4',
    ),
    array(
        'var'           => 'guests',
        'name'          => 'Text for Google guest ',
        'description'   => 'This Text will shown in advertising box if visitors comes from Google. IF empty nothing will shown',
        'type'          => 'string',
        'default'       => 'You are coming from Google ',
    ),
    array(
        'var'           => 'iconsamount',
        'name'          => 'Number of icons',
        'description'   => 'Enter the number of iconlinks you want to use in right top.',
        'type'          => 'string',
        'default'       => '3',
    ),

);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}

$vars = serendipity_loadThemeOptions($template_config);

$navlinks = array();

for ($i = 0; $i < $vars['amount']; $i++) {
    $navlinks[] = array(
        'title'   => $vars['navlink' . $i . 'text'],
        'href'    => $vars['navlink' . $i . 'url'],
        'picture' => $vars['navlink' . $i . 'img'] ?? '',
        'bartext' => $vars['navlink' . $i . 'bar'] ?? ''
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'text',
        'name'          => NAV_LINK_TEXT . '/' . $i,
        'description'   => NAV_LINK_DESC . '/' .$i,
        'type'          => 'string',
        'default'       => 'dummy',
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'url',
        'name'          => NAV_LINK_URL . '/' . $i,
        'description'   => NAV_LINK_URL_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => '/',
    );


    $template_config[] = array(
        'var'           => 'navlink' . $i . 'img',
        'name'          => NAV_LINK_IMG . '/' . $i,
        'description'   => NAV_LINK_IMG_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => '9'.$i,
    );

    $template_config[] = array(
        'var'           => 'navlink' . $i . 'bar',
        'name'          => NAV_LINK_BAR . '/' . $i,
        'description'   => NAV_LINK_BAR_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => 'Text for Link - '. $i,
    );

    $serendipity['smarty']->assignByRef('navlinks', $navlinks);
}

if (isset($_SERVER['HTTP_REFERER']) && (stristr($_SERVER['HTTP_REFERER'], 'google.') ||
    stristr($_SERVER['HTTP_REFERER'], 'yahoo.')) ) {
    $_SESSION['from_searchengine'] = true;
}

$serendipity['smarty']->assign('from_searchengine', ($_SESSION['from_searchengine'] ?? null));

$icons = array();

for ($i = 0; $i < $vars['iconsamount']; $i++) {
    $icons[] = array(
        'thehref'    => $vars['icon' . $i . 'theurl'] ?? '',
        'thepicture' => $vars['icon' . $i . 'theimg'] ?? ''
    );

    $template_config[] = array(
        'var'           => 'icon' . $i . 'theurl',
        'name'          => ICONS_LINK_URL . '/' . $i,
        'description'   => ICONS_LINK_URL_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => '/',
    );

    $template_config[] = array(
        'var'           => 'icon' . $i . 'theimg',
        'name'          => ICONS_LINK_IMG . '/' . $i,
        'description'   => ICONS_LINK_IMG_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => $i,
    );
}

$serendipity['smarty']->assignByRef('icons', $icons);
$serendipity['smarty']->assignByRef('navlinks', $navlinks);
