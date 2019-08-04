{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
{if in_array($view, ['start', 'entries', 'entry', 'feed', 'plugin']) OR NOT empty($staticpage_pagetitle) OR (isset($robots_index) AND $robots_index == 'index')}
    <meta name="robots" content="index,follow">
{else}
    <meta name="robots" content="noindex,follow">
{/if}
{if $view == 'entry' AND isset($entry)}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if in_array($view, ['start', 'entries'])}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}

<div id="wrapper">
    <div id="header">
        <div class="template_head_image"><img src="{serendipity_getFile file="img/banner-top.jpg"}" alt="{$blogTitle}" border="0"></div>
        <div class="template_banner_title">
            <h1><a class="homelink1" href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
            <p class="description">{$head_subtitle|default:$blogDescription}</p>
        </div>
    </div>
    <div id="navcontainer">
        <ul id="navlist">
            <li id="active"><a href="#">button #1</a></li>
            <li><a href="#">button #1</a></li>
            <li><a href="#">button #1</a></li>
            <li><a href="#">button #1</a></li>
            <li><a href="#">button #1</a></li>
        </ul>
    </div>

    <div id="mainpane">
        <div id="content" class="content content_{$view}">
            {$CONTENT}
        </div>

        <div id="serendipityLeftSideBar">
            {if $leftSidebarElements > 0}
                {serendipity_printSidebar side="left"}
            {/if}
            {if $rightSidebarElements > 0}
                {serendipity_printSidebar side="right"}
            {/if}
        </div>
    </div>

    <div id="footer" class="template_banner_bottom">
        <div class="template_banner_bottom_left">{$CONST.POWERED_BY} <a href="https://ophian.github.io/">Serendipity Styx Edition</a> {$blogTitle}<br>Template by: <a href="http://costa.kofeina.net/">CoSTa</a></div>
        <div class="template_banner_bottom_right"><a href="{$serendipityBaseURL}">{$blogTitle}</a></div>
    </div>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
