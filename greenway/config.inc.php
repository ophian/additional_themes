<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

// Be nice to the frontend users. They don't need the additional constants and file lookups. Only load them when in Admin mode.
if (isset($serendipity['GET']['adminModule']) AND ($serendipity['GET']['adminModule'] == 'templates' || $serendipity['POST']['adminModule'] != 'templates')) {
    @serendipity_plugin_api::load_language(dirname(__FILE__));
}

$template_config = array(
    array(
        'var'           => 'amount',
        'name'          => 'Number of navlinks',
        'description'   => 'Enter the number of navlinks you want to use in the navbar.',
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

$template_config_groups = NULL;

$vars = serendipity_loadThemeOptions($template_config);

$navlinks = array();

for ($i = 0; $i < $vars['amount']; $i++) {
    $navlinks[] = array(
        'title' => $vars['navlink' . $i . 'text'],
        'href'  => $vars['navlink' . $i . 'url'],
        'picture'=>$vars['navlink' . $i . 'bild'],
        'bartext'=>$vars['navlink' . $i . 'bar']
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'text',
        'name'          => NAV_LINK_TEXT . '/' . $i,
        'description'   => NAV_LINK_DESC . '/' .$i,
        'type'          => 'string',
        'default'       => constant('NAV_DEFAULT_' . $i),
    );
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'url',
        'name'          => NAV_LINK_URL . '/' . $i,
        'description'   => NAV_LINK_URL_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => '/',
    );


    $template_config[] = array(
        'var'           => 'navlink' . $i . 'bild',
        'name'          => NAV_LINK_BILD . '/' . $i,
        'description'   => NAV_LINK_BILD_DESC . '/' . $i,
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

if (stristr($_SERVER['HTTP_REFERER'], 'google.') or
    stristr($_SERVER['HTTP_REFERER'], 'yahoo.') ) {
    $_SESSION['from_searchengine'] = true;
}

$serendipity['smarty']->assign('from_searchengine', $_SESSION['from_searchengine']);

$icons = array();

for ($i = 0; $i < $vars['iconsamount']; $i++) {
    $icons[] = array(
        'thehref'  => $vars['icon' . $i . 'theurl'],
        'thepicture'=>$vars['icon' . $i . 'thebild']
    );

    $template_config[] = array(
        'var'           => 'icon' . $i . 'theurl',
        'name'          => ICONS_LINK_URL . '/' . $i,
        'description'   => ICONS_LINK_URL_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => '/',
    );

    $template_config[] = array(
        'var'           => 'icon' . $i . 'thebild',
        'name'          => ICONS_LINK_BILD . '/' . $i,
        'description'   => ICONS_LINK_BILD_DESC . '/' . $i,
        'type'          => 'string',
        'default'       => $i,
    );
}

$serendipity['smarty']->assignByRef('icons', $icons, $icons,$icons);
$serendipity['smarty']->assignByRef('navlinks', $navlinks, $navlinks,$navlinks);
