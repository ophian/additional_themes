{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<!-- Design by DAVID CUMMINS [http://themes.daves.me.uk] -->
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
{if $template_option.colorset == 'cappuccino'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="cappuccino.css"}">
{elseif $template_option.colorset == 'espresso'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="espresso.css"}">
{/if}
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="trackback" type="application/x-www-form-urlencoded" href="{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry_id}">
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
        <div id="serendipity_banner">
            <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:30:" ...":true}</a></h1>
            <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription|truncate:33:"...":true}</a></h2>
        </div>
        <div id="navbar">
            <ul class="menu hack"><li class="active"><a href="{$serendipityBaseURL}">{$CONST.HOMEPAGE}</a><span class="stream"> (this page)</span></li>
            {foreach $navlinks AS $navlink}
                <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
            {/foreach}
            </ul>
        </div>
    </div>
    <div id="mainpane">
        <div id="sidebar">
            {serendipity_printSidebar side="left"}
            {serendipity_printSidebar side="right"}
        </div>
        <div id="content">
            {$CONTENT}
        </div>
    </div>

    <div id="footer">
        <p>
        'Coffee Bar' design by <a href="http://themes.daves.me.uk">David Cummins</a>
         powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a>
        </p>
    </div>

</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
