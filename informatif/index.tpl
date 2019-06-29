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
{if $template_option.colorset == 'beige'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="beige.css"}">
{elseif $template_option.colorset == 'pink'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="pink.css"}">
{elseif $template_option.colorset == 'caramel'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="caramel.css"}">
{elseif $template_option.colorset == 'olive'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="olive.css"}">
{elseif $template_option.colorset == 'black'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="black.css"}">
{/if}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="black.css"}">
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
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

<div id="header">
    <div id="logo">
        <h2><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h2>
        <h1><a href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h1>
    </div>
    <div id="menu">
        <ul>
        {foreach $navlinks AS $navlink}
            <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
        </ul>
    </div>
</div>

<div id="mainpane">
    <div id="serendipityLeftSideBar">
        {serendipity_printSidebar side="left"}
    </div>
    <div id="serendipityRightSideBar">
        {serendipity_printSidebar side="right"}
    </div>
    <div id="content">
        {$CONTENT}
    </div>
</div>

<div id="footer">
    <p>
    {$CONST.POWERED_BY} <a href="https://ophian.github.io/">Serendipity Styx Edition</a>.<br />
    Design<a href="http://www.freecsstemplates.org/">:Free CSS Templates</a> ported by <a href="http://katalog-it.de">RL</a>
    </p>
</div>
<script type="text/javascript" src="{serendipity_getFile file="informatif.js"}"></script>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
