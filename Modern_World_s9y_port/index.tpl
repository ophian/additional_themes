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
{if $view == 'entry'}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if in_array($view, ['start', 'entries'])}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
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

<div id="content">
    <div class="right">
        <div id="message">{$blogDescription}</div>
        <div id="navigation">
        <!--    <a href="#">Home</a>
            <a href="#">Modern world</a>
             <a href="#">Behind the idea</a>
             <a href="#">Join the movement</a>
             <a href="#">Contact</a> -->
            &nbsp;
        </div>
            {$CONTENT}
            {$raw_data}
    </div>
    <div class="left">
        <div id="logo">
            <h2><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h2>
            <p><a href="{$serendipityBaseURL}">{$head_subtitle}</a></p>
        </div>
        <div id="sidebar">
            {if $rightSidebarElements > 0}
                {serendipity_printSidebar side="right"}
            {/if}
                {if $leftSidebarElements > 0}
                {serendipity_printSidebar side="left"}
            {/if}
        </div>
    </div>
    <div id="footer">
        <p>&copy; Copyright 2006, nerdwg.org<, design by <a href="mailto:luka@solucija.com">Luka Cvrk</a>, port for s9y by nerdwg.org</p>
    </div>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
