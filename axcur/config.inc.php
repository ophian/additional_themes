<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$istok = ' <span class="icon-ok-circled"></span> ';
$notok = ' <span class="icon-attention-circled"></span> ';

if (class_exists('serendipity_event_entryproperties'))  {
    $inst_ok = $istok . ' <span>OK: serendipity_event_entryproperties Plugin';

    $check = serendipity_db_query("SELECT * FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%serendipity_event_entryproperties:%/customfields' AND value LIKE '%MagazineCategoryImage%'");
    if (is_array($check) && isset($check[0]['config'])) {
        $inst_ok = $inst_ok . ' and customfield: "MagazineCategoryImage" exists</span><br>';
    } else {
        $inst_ok = $inst_ok . ', but has no customfield: "MagazineCategoryImage"</span><br>';
    }

} else {
    $inst_ok = $inst_ok . $notok.' <span>MISSING: serendipity_event_entryproperties Plugin </span><br>';
}

if (is_array($all_cats = serendipity_fetchCategories('all'))) {
    $all_cats = serendipity_walkRecursive($all_cats, 'categoryid', 'parentid', VIEWMODE_THREADED);
    $catsel = array();
    foreach($all_cats AS $cat) {
        $catsel[$cat['categoryid']] = str_repeat('&nbsp;', $cat['depth']) . $cat['category_name'];
    }
}

$template_config = array(
    array(
        'var'           => 'installation_ok',
        'type'          => 'content',
        'default'       => "$inst_ok",
    ),
    array(
        'var'           => 'infoxxx1',
        'name'          => 'infoxxx1',
        'type'          => 'custom',
        'custom'        => IMAGECAT_INSTR,
    ),
    array(
        'var'           => 'enablehmenue',
        'name'          => ENABLECAT_HMENUE,
        'description'   => INFO_RELOAD,
        'type'          => 'boolean',
        'default'       => 'true'
    ),
    array(
        'var'           => 'amount',
        'name'          => NAVLINK_AMOUNT,
        'description'   => INFO_RELOAD,
        'type'          => 'string',
        'default'       => '5',
    )
);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false);/* We don't use the global navigation and do it ourselves later on, since adding an additional field to the array */
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

if (isset($_SESSION['serendipityUseTemplate'])) {
    $template_loaded_config['use_corenav'] = false;
}

$navlinks = array();

/* don't show, if not saved and page additional reloaded */
if (!empty($template_loaded_config['enablehmenue'])) {
    for ($i = 0; $i < $template_loaded_config['amount']; $i++) {
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'navlink_info',
            'type'          => 'content',
            'default'       =>  '<b style="color:#FFFFFF; background-color: #0066FF">'. HORZ_NAV_LINK_TITLE . ' #' . $i .'</b>' ,
            );
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'text',
            'name'          => NAV_LINK_TEXT,
            'type'          => 'string',
            'default'       => 'Link #' . $i,
            );
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'url',
            'name'          => NAV_LINK_URL,
            'type'          => 'string',
            'default'       => '#',
        );
        $template_config[] = array(
            'var'           => 'navlink' . $i . 'dramount',
            'name'          => DROPDOWN_AMOUNT,
            'type'          => 'string',
            'default'       => '0',
            );
        $dropdownentries = array();
        if (isset($template_loaded_config['navlink0dramount'])) {
            for ($k = 0; $k < $template_loaded_config['navlink' . $i . 'dramount']; $k++) {
                $template_config[] = array(
                    'var'           => 'navlink' . $i . 'dropdowentry' . $k . 'text',
                    'name'          => DROPDOWN_TEXT . ' #'. $k,
                    'type'          => 'string',
                    'default'       => 'Link #' . $i . ' dropdowentry #' . $k,
                    );
                $template_config[] = array(
                    'var'           => 'navlink' . $i . 'dropdowentry' . $k . 'url',
                    'name'          => DROPDOWN_URL . ' #'. $k,
                    'type'          => 'string',
                    'default'       => '#',
                    );

                $dropdownentries[] = array(
                    'title'         => $template_loaded_config['navlink' . $i . 'dropdowentry' . $k . 'text'] ?? '',
                    'href'          => $template_loaded_config['navlink' . $i . 'dropdowentry' . $k . 'url'] ?? '',
                    );
            }
            $navlinks[] = array(
                'navlinkinfo'       => $template_loaded_config['navlink' . $i . 'navlink_info'] ?? '',
                'title'             => $template_loaded_config['navlink' . $i . 'text'],
                'href'              => $template_loaded_config['navlink' . $i . 'url'],
                'drop'              => $template_loaded_config['navlink' . $i . 'dramount'],
                'dropdownentries'   => $dropdownentries,
            );
        }
    }
}

$serendipity['smarty']->assignByRef('navlinks', $navlinks);

