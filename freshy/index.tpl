{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
{if in_array($view, ['start', 'entries', 'entry', 'feed', 'plugin']) OR NOT empty($staticpage_pagetitle) OR (isset($robots_index) AND $robots_index == 'index')}
    <meta name="robots" content="index,follow">
{else}
    <meta name="robots" content="noindex,follow">
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if ($view == "start")}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
{if $leftSidebarElements > 0 AND $rightSidebarElements > 0}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style_1024.css"}">
{/if}
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
    <style type="text/css">
{if isset($template_option.freshyheader) AND $template_option.freshyheader != '' AND $template_option.freshyheader != 'custom'}

        #title_image {
            background-image:url("{$template_option.freshyheader}") !important;
        }
{elseif isset($template_option.freshyheader) AND $template_option.freshyheader == 'custom' AND $template_option.custom_freshyheader != ''}

        #title_image {
            background-image:url("{$template_option.custom_freshyheader}") !important;
        }
{/if}

{if $template_option.navbg != 'green'}
        .menu li.current_page_item a { color:#fff !important; }
        .menu li a { background-image:url("{serendipity_getFile file="images/menu/menu_triple_"|cat:$template_option.navbg|cat:".gif"}"); }
        .menu li a.first_menu { background-image:url("{serendipity_getFile file="images/menu/menu_start_triple_"|cat:$template_option.navbg|cat:".gif"}"); }
        .menu li a.last_menu,
        .menu li a.last_menu_off { background-image:url("{serendipity_getFile file="images/menu/menu_end_triple_"|cat:$template_option.navbg|cat:".gif"}"); }
{/if}

    </style>
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}

<div id="page">

    <!-- header -->
    <div id="header">
        <div id="title">
            <h1><a href="{$serendipityBaseURL}"><span>{$head_title|default:$blogTitle}</span></a></h1>
            <div class="description">
                <small>{$head_subtitle|default:$blogDescription}</small>
            </div>
        </div><div id="title_image"></div>
    </div>

<div id="frame">
    <ul class="menu">
        <li class="{if $startpage}current_{/if}page_item">
            <a class="first_menu" href="{$serendipityBaseURL}">{$template_option.homelinklabel}</a>
        </li>
{foreach $navlinks AS $navlink}
    {if NOT ($navlink.href == '#' OR $navlink.href == '')}
        <li class="{if $currpage == $navlink.href}current_{/if}page_item"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
    {/if}
    {if $navlink@last}
        <li class="last_menu"><a href="#" class="last_menu_off last_menu end"></a></li>
    {/if}
{/foreach}
    {if isset($template_option.navlinkurllast)}

        <li class="{if $currpage == $template_option.navlinkurllast}current_page_item {/if}last_menu"><a href="{$template_option.navlinkurllast}" class="{if $currpage == $template_option.navlinkurllast}last_menu_off {/if}last_menu" title="{$template_option.navlinklabellast}">{$template_option.navlinklabellast}</a></li>
    {/if}
    </ul>
    <hr style="display:none"/>
    <div id="content" class="{if $leftSidebarElements == 0 AND $rightSidebarElements == 0}content {/if}content_{$view}">
        {$CONTENT}
    </div>
{if $leftSidebarElements > 0 AND $rightSidebarElements > 0}
    <div class="leftsidebar">
        {serendipity_printSidebar side="left"}
    </div>

    <div class="rightsidebar">
        {serendipity_printSidebar side="right"}
    </div>
{else}
{if $rightSidebarElements > 0}
    <div id="sidebar">
        <div>
            {serendipity_printSidebar side="right"}
        </div>
    </div>
{elseif $leftSidebarElements > 0}
    <div id="sidebar">
        <div>
            {serendipity_printSidebar side="left"}
        </div>
    </div>
{/if}
{/if}

{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
<br style="clear:both">

</div><!-- frame -->

<div id="footer">
    <small class="footer_content">
        <a href="http://www.jide.fr">Design by jide</a> |
        <a href="http://abdussamad.com" title="serendipity templates">Serendipity templates</a>
    </small>
</div>

</div><!-- page-->
{if $is_embedded != true}
</body>
</html>
{/if}
