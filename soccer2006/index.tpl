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

<div id="bg">
  <div id="wrap">
    <div id="identity">
        <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:50:" ...":true}</a></h1>
        <div class="description">{$head_subtitle|default:$blogDescription}</div>
        <div id="navbar">
            <ul>
                <li><a href="{$serendipityBaseURL}">{$CONST.HOMEPAGE}</a></li>
            {foreach $navlinks AS $navlink}
                <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
            {/foreach}
            </ul>
        </div>
    </div>
    <div id="mainpane">
        <div id="content">
            {$CONTENT}
        </div>

        <div id="sidebar">
            {serendipity_printSidebar side="left"}
            {serendipity_printSidebar side="right"}
        </div>

        <div id="footer">
            <p>Theme designed for <a href="https://ophian.github.io/">Serendipity Styx Edition</a> by <a href="http://www.carlgalloway.com">Carl</a> - Photo by <a href="mailto:firey_photographics@yahoo.com">Adam Klepsteen</a></p>
        </div>
    </div>
  </div>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
