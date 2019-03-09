<?php

if (IN_serendipity !== true) { die ("Don't hack!"); }

@serendipity_plugin_api::load_language(dirname(__FILE__));

$serendipity['smarty']->assign(array('currpage'  => "http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'],
                                     'currpage2' => $_SERVER['REQUEST_URI']));

$istok = ' <img src="' . serendipity_getTemplateFile('img/ok.gif', 'serendipityHTTPPath', true). '" alt="" /> '; // forced!
$notok = ' <img src="' . serendipity_getTemplateFile('img/fehler.gif', 'serendipityHTTPPath', true). '" alt="" /> '; // forced!

$sbmtarget      = array ('self Window', 'new Window', 'new Window with nofollow');
$menupsition   = array('side-bar-top', 'side-bar-bottom', 'feature-bar-top', 'feature-bar-bottom', 'news-bar-top', 'news-bar-bottom', 'news-bar-middle', 'footer-l', 'footer-m', 'footer-r', 'footer-b', 'disable');
$installation   = 'Template Check:<br>';
$bannerposition = array( 'top1', 'top2', 'bottom1', 'bottom2', 'disable');
$leftsidebarpos = array('footer-l', 'footer-m', 'footer-r', 'footer-b', 'disable');

if (class_exists('serendipity_event_freetag'))  {
    $inst_ok = $istok . ' <span>OK: serendipity_event_freetag Plugin </span><br>';
} else {
    $inst_ok = $notok . ' <span>MISSING: serendipity_event_freetag Plugin </span><br>';
}
if (class_exists('serendipity_event_entryproperties'))  {
    $inst_ok = $inst_ok . $istok . ' <span>OK: serendipity_event_entryproperties Plugin';

    $check = serendipity_db_query("SELECT * FROM {$serendipity['dbPrefix']}config WHERE name LIKE '%serendipity_event_entryproperties:%/customfields' AND value LIKE '%MagazineCategoryImage%'");
    if (is_array($check) && isset($check[0]['config'])) {
        $inst_ok = $inst_ok . ' and customfield: "MagazineCategoryImage" exists</span><br>';
    } else {
        $inst_ok = $inst_ok . ', but has no customfield: "MagazineCategoryImage"</span><br>';
    }

} else {
    $inst_ok = $inst_ok . $notok.' <span>MISSING: serendipity_event_entryproperties Plugin </span><br>';
}

if (class_exists('serendipity_event_staticpage'))  {
    $inst_ok = $inst_ok . $istok.' <span>OK: serendipity_plugin_staticpage Plugin </span><br>';
} else {
    $inst_ok = $inst_ok . $notok.' <span>MISSING: serendipity_plugin_staticpage Plugin </span><br>';
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
        'var'          => 'sidebars',
        'name'         => SIDEBAR_TITLE,
        'type'         => 'string',
        'default'      => 'left,hide,right,top'
    ),
    array(
        'var'          => 'installation_ok',
        'type'         => 'content',
        'default'      => "$inst_ok",
    ),
    array(
       'var'           => 'infoxxx1',
       'name'          => 'infoxxx1',
       'type'          => 'custom',
       'custom'        => IMAGECAT_INSTR,
    ),
    array(
       'var'           => 'magazinemode',
       'name'          => MAGAZINE_MODE,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'enablehmenu',
       'name'          => ENABLECAT_HMENUE,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'enabletopsidebar',
       'name'          => ENABLE_TOPSIDEBAR,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'enablefooter',
       'name'          => ENABLE_FOOTER,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'sidebarpos',
       'name'          => LEFTSIDEBAR_POS,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $leftsidebarpos,
    ),
    array(
       'var'           => 'infoxtab',
       'name'          => 'infoxtab',
       'type'          => 'custom',
       'custom'        => INFO_TAB,
    ),
    array(
       'var'           => 'enabletaba',
       'name'          => ENABLECAT_TABA,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
     array(
       'var'           => 'tabx1',
       'name'          => MIMBO_TAB_X1,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
       'var'           => 'enabletabx1',
       'name'          => ENABLE_TABX1,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'tabx2',
       'name'          => MIMBO_TAB_X2,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
       'var'           => 'enabletabx2',
       'name'          => ENABLE_TABX2,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'tabx3',
       'name'          => MIMBO_TAB_X3,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
       'var'           => 'enabletabx3',
       'name'          => ENABLE_TABX3,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'enablesticky',
       'name'          => ENABLE_STICKY,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'stickyheader',
       'name'          => SICKY_HEADER,
       'type'          => 'string',
       'default'       => 'Sticky',
    ),
    array(
       'var'           => 'infoxlead',
       'name'          => 'infoxlead',
       'type'          => 'custom',
       'custom'        => INFO_LEAD,
    ),
    array(
       'var'           => 'enablecatlead',
       'name'          => ENABLECAT_LEAD,
       'type'          => 'boolean',
       'default'       => 'true'
    ),
    array(
       'var'           => 'catlead',
       'name'          => MIMBO_CAT_LEAD,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
       'var'           => 'infoxrol',
       'name'          => 'infoxrol',
       'type'          => 'custom',
       'custom'        => INFO_ROL,
    ),
    array(
       'var'           => 'enablecatrol',
       'name'          => ENABLECAT_ROL,
       'type'          => 'boolean',
       'default'       => 'false'
    ),
    array(
       'var'           => 'catrolheader',
       'name'          => CATROL_HEADER,
       'type'          => 'string',
       'default'       => 'NEWS: ',
    ),
    array(
       'var'           => 'catrol',
       'name'          => MIMBO_CAT_ROL,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
       'var'           => 'infoxfeat',
       'name'          => 'infoxfeat',
       'type'          => 'custom',
       'custom'        => INFO_FEAT,
    ),
    array(
       'var'           => 'catfeat',
       'name'          => MIMBO_CAT_FEAT,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
       'var'           => 'featamount',
       'name'          => FEAT_AMOUNT,
       'type'          => 'string',
       'default'       => '0',
    ),
    array(
       'var'           => 'infoxnews',
       'name'          => 'infoxnews',
       'type'          => 'custom',
       'custom'        => INFO_NEWS,
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
       'var'           => 'catx4',
       'name'          => MIMBO_CAT_X4,
       'type'          => 'select',
       'default'       => '',
       'select_values' => $catsel,
    ),
    array(
        'var'          => 'infohm',
        'name'         => 'infohm',
        'type'         => 'custom',
        'custom'       => INFO_HMENUE,
    ),
    array(
         'var'         => 'amount',
         'name'        => NAVLINK_AMOUNT,
         'type'        => 'string',
         'default'     => '0',
    ),
    array(
        'var'          => 'infotkm',
        'name'         => 'infotkm',
        'type'         => 'custom',
        'custom'       => INFO_TABNUGAMOUNT,
    ),
    array(
         'var'         => 'nugamount',
         'name'        => TABNUG_AMOUNT,
         'type'        => 'string',
         'default'     => '0',
    ),
    array(
        'var'          => 'infotcba',
        'name'         => 'infocba',
        'type'         => 'custom',
        'custom'       => INFO_CBA_AMOUNT,
    ),
    array(
        'var'          => 'catbanneramount',
        'name'         => CATBANNER_AMOUNT,
        'type'         => 'string',
        'default'      => '1',
    ),
    array(
        'var'          => 'infosbm',
        'name'         => 'infosbm',
        'type'         => 'custom',
        'custom'       => INFO_SBARMENUESAMOUNT,
    ),
    array(
        'var'          => 'sidebbarmenusamount',
        'name'         => SBMENUES_AMOUNT,
         'type'        => 'string',
        'default'      => '0',
    )

);

$top = isset($serendipity['smarty_vars']['template_option']) ? $serendipity['smarty_vars']['template_option'] : '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false);
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, true);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);

$sbmenu1 = array();
for ($i = 0; $i < $template_loaded_config['sidebbarmenusamount']; $i++) {
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'sbmenu_info',
        'type'          => 'content',
        'default'       => '<b><p style="color:#FFFFFF; background-color: red">'. SBMENUE_TITLE . ' #' . $i .'</p></b>' ,
        );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'text',
        'name'          => SBHEADER_TEXT,
        'type'          => 'string',
        'default'       => 'Menu #' . $i,
        );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'url',
        'name'          => SBHEADER_URL,
        'type'          => 'string',
        'default'       => '#',
    );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'target',
        'name'          => SB_TARGET,
        'type'          => 'select',
        'select_values' => $sbmtarget,
    );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'sitenav1_amount',
        'name'          => SIDEBARMENUE_AMOUNT,
        'type'          => 'string',
        'default'       => '0',
        );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'position',
        'name'          => SB_POSITION,
        'type'          => 'select',
        'select_values' => $menupsition,
    );
    $menupoints = array();
    for ($s = 0; $s < $template_loaded_config['menu1' . $i . 'sitenav1_amount']; $s++) {
        $template_config[] = array(
        'var'           => 'menu1' . $i . 'menupoint' . $s . 'text',
        'name'          => SIDEBARMENUE_TEXT . ' #'. $s,
        'type'          => 'string',
        'default'       => 'Menu #' . $s.' link #' . $i ,
            );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'menupoint' . $s . 'url',
        'name'          => SIDEBARMENUE_URL . ' #'. $s,
        'type'          => 'string',
        'default'       => '#',
            );
    $template_config[] = array(
        'var'           => 'menu1' . $i . 'menupoint' . $s . 'target',
        'name'          => SB_TARGET . ' #'. $s,
        'type'          => 'select',
        'select_values' => $sbmtarget,
            );
    $menupoints[] = array(
        'title'         => $template_loaded_config['menu1' . $i . 'menupoint' . $s . 'text'],
        'href'          => $template_loaded_config['menu1' . $i . 'menupoint' . $s . 'url'],
        'target'        => $template_loaded_config['menu1' . $i . 'menupoint' . $s . 'target'],
            );
    }
    $sbmenu1[] = array(
        'sbmenu_info'  => $template_loaded_config['menu1' . $i . 'sbmenu_info'],
        'title'        => $template_loaded_config['menu1' . $i . 'text'],
        'href'         => $template_loaded_config['menu1' . $i . 'url'],
        'target'       => $template_loaded_config['menu1' . $i . 'target'],
        'position'     => $template_loaded_config['menu1' . $i . 'position'],
        'menupoints'   => $menupoints,
    );
}
$serendipity['smarty']->assignByRef('sbmenu1', $sbmenu1);

$nug1 = array();
for ($i = 0; $i < $template_loaded_config['nugamount']; $i++) {
    $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'tabnug_info',
        'type'          => 'content',
        'default'       => '<p style="color:#FFFFFF; background-color: orange"><b>'. TABNUG_TITLE . ' #' . $i .'</b></p>' ,
        );

    $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'nugname',
        'name'          => NUGWIN_NAME,
        'type'          => 'string',
        'default'       => 'Nug'.$i,
        );
    $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'tabnug1_amount',
        'name'          => SIDEBARMENUE_AMOUNT,
        'type'          => 'string',
        'default'       => '0',
        );
    $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'position',
        'name'          => TABNUG_POSITION,
        'type'          => 'select',
        'select_values' => $menupsition,
        );
    $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'tabnug1_height',
        'name'          => TABNUG_HEIGHT,
        'type'          => 'string',
        'default'       => '100',
       );
    $tabs = array();
    for ($s = 0; $s < $template_loaded_config['tabnug1' . $i . 'tabnug1_amount']; $s++) {
        $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'tabpoint' . $s . 'text',
        'name'          => TABHEADER . ' #'. $s,
        'type'          => 'string',
        'default'       => 'Tab #' . $s ,
            );

    $template_config[] = array(
        'var'           => 'tabnug1' . $i . 'tabpoint' . $s . 'tabtext',
        'name'          => TABTEXT . ' #'. $s,
        'type'          => 'text',
        'select_values' => '',
            );
    $tabs[] = array(
        'title'     => $template_loaded_config['tabnug1' . $i . 'tabpoint' . $s . 'text'],
        'tabstext'  => $template_loaded_config['tabnug1' . $i . 'tabpoint' . $s . 'tabtext'],

            );
    }
    $nug1[] = array(
        'tabnug_info'   => $template_loaded_config['tabnug1' . $i . 'tabnug_info'],
        'nugname'       => $template_loaded_config['tabnug1' . $i . 'nugname'],
        'position'      => $template_loaded_config['tabnug1' . $i . 'position'],
        'tabs'          => $tabs,
        'tabnug1amount' => $template_loaded_config['tabnug1' . $i . 'tabnug1_amount'],
        'tabwinheight'  => $template_loaded_config['tabnug1' . $i . 'tabnug1_height'],

    );
}
$serendipity['smarty']->assignByRef('nug1', $nug1);

$navlinks = array();
for ($i = 0; $i < $template_loaded_config['amount']; $i++) {
    $template_config[] = array(
        'var'           => 'navlink' . $i . 'navlink_info',
        'type'          => 'content',
        'default'       =>  '<b><p style="color:#FFFFFF; background-color: #0066FF">'. HORZ_NAV_LINK_TITLE . ' #' . $i .'</p></b>' ,
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
            'var'       => 'navlink' . $i . 'dropdowentry' . $k . 'text',
            'name'      => DROPDOWN_TEXT . ' #'. $k,
            'type'      => 'string',
            'default'   => 'Link #' . $i . ' dropdowentry #' . $k,
            );
        $template_config[] = array(
            'var'       => 'navlink' . $i . 'dropdowentry' . $k . 'url',
            'name'      => DROPDOWN_URL . ' #'. $k,
            'type'      => 'string',
            'default'   => '#',
            );

        $dropdownentries[] = array(
            'title'     => $template_loaded_config['navlink' . $i . 'dropdowentry' . $k . 'text'],
            'href'      => $template_loaded_config['navlink' . $i . 'dropdowentry' . $k . 'url'],
            );
      }
      $navlinks[] = array(
        'navlinkinfo'     => $template_loaded_config['navlink' . $i . 'navlink_info'],
        'title'           => $template_loaded_config['navlink' . $i . 'text'],
        'href'            => $template_loaded_config['navlink' . $i . 'url'],
        'drop'            => $template_loaded_config['navlink' . $i . 'dramount'],
        'dropdownentries' => $dropdownentries,
      );
    }
}
$serendipity['smarty']->assignByRef('navlinks', $navlinks);

$catlinks = array();

for ($i = 0; $i < $template_loaded_config['amount']; $i++) {

    $template_config[] = array(
        'var'           => 'catlink' . $i . 'catlink_info',
        'type'          => 'content',
        'default'       =>  '<b><p style="color:#FFFFFF; background-color: olive">'. CAT_IMAGE_TITLE . ' #' . $i .'</p></b>' ,
        );
    $template_config[] = array(
        'var'           => 'catlink' . $i . 'text',
        'name'          => NAV_LINK_TEXT . ' #' . $i,
        'type'          => 'text',
        'default'       => 'description #' . $i,
        );
    $template_config[] = array(
        'var'           => 'catlink' . $i . 'url',
        'name'          => NAV_LINK_URL . ' #' . $i,
        'type'          => 'media',
        'default'       => serendipity_getTemplateFile('header.png'),
        );
    $template_config[] = array(
        'var'           => 'catlink'. $i . 'catselect',
        'name'          => IMAGE_TO_CAT,
        'type'          => 'select',
        'default'       => 'nix',
        'select_values' => $catsel,
        );
    $template_config[] = array(
        'var'           => 'catlink' . $i . 'position',
        'name'          => CATBANNER_POSITION,
        'type'          => 'select',
        'select_values' => $bannerposition,
        );
    if (isset($template_loaded_config['catlink0text'])) {
      $catlinks[] = array(
        'title'       => $template_loaded_config['catlink' . $i . 'text'],
        'catlinkinfo' => $template_loaded_config['navlink' . $i . 'catlink_info'],
        'image'       => $template_loaded_config['catlink' . $i . 'url'],
        'catt'        => $template_loaded_config['catlink' . $i . 'catselect'],
        'position'    => $template_loaded_config['catlink' . $i . 'position'],

      );
    }
}

$serendipity['smarty']->assignByRef('catlinks', $catlinks);

$serendipity['smarty']->assign('tabx1_cat', isset($catsel[$template_loaded_config['tabx1']]) ? $catsel[$template_loaded_config['tabx1']] : array());
$serendipity['smarty']->assign('tabx2_cat', isset($catsel[$template_loaded_config['tabx2']]) ? $catsel[$template_loaded_config['tabx2']] : array());
$serendipity['smarty']->assign('tabx3_cat', isset($catsel[$template_loaded_config['tabx3']]) ? $catsel[$template_loaded_config['tabx3']] : array());
