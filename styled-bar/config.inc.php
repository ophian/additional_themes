<?php

if (IN_serendipity !== true) {
  die ("Don't hack!");
}

$colorset = array(  'blue' => 'blue', 'blue_nogloss' => 'blue_nogloss',
                    'green' => 'green', 'green_nogloss' => 'green_nogloss',
                    'purple' => 'purple', 'purple_nogloss' => 'purple_nogloss',
                    'red' => 'red', 'red_nogloss' => 'red_nogloss',
                    'turquoise' => 'turquoise', 'turquoise_nogloss' => 'turquoise_nogloss',
                    'default' => 'default');
$preview = array();
foreach(array_keys($colorset) AS $p) {
    if ($p != 'default' && false !== strpos($p, '_')) $preview[] = $serendipity['serendipityHTTPPath'] . $serendipity['templatePath'] . $serendipity['template'] . '/' . $p . '/preview.png';
}
$preview[] = $serendipity['serendipityHTTPPath'] . $serendipity['templatePath'] . $serendipity['template'] . '/default/preview.png';

$pfile = '';
if (is_array($preview)) {
    foreach ($preview AS $file) {
        $nfile = str_replace(array($serendipity['serendipityHTTPPath'],'_nogloss'), '', $file);
        $pfile .= '<img src="'.$file.'" alt="'.$nfile.'" title="'.$nfile.'">'."\n";
    }
}

$template_config = array(
    array(
        'var'           => 'colorset',
        'name'          => 'THEME_COLORSET',
        'description'   => 'For colored rss/xml icons, add the colorset pathname (eg. \'purple/xml.gif\' to syndication/categories plugins. Colorset default is picked automatically.',
        'type'          => 'select',
        'default'       => 'default',
        'select_values' => $colorset
    ),
    array(
        'var'           => 'colorsetpreview',
        'name'          => 'colorsetpreview',
        'type'          => 'content',
        'default'       => $pfile,
    ),
);

/* when using a $template_config_array(), even without the global set navigation items, you need to keep this following code */
$top = $serendipity['smarty_vars']['template_option'] ?? '';
$template_config_groups = NULL;
$template_global_config = array('navigation' => false); // false, when not using the global navigation
$template_loaded_config = serendipity_loadThemeOptions($template_config, $top, false);
serendipity_loadGlobalThemeOptions($template_config, $template_loaded_config, $template_global_config);
