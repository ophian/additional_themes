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

<div id="serendipity_banner">
    <a id="linkhome"   href="{$serendipityBaseURL}" title="Home"></a>
<!-- ADDITIONAL LINKS: UNCOMMENT TO ACTIVATE
    <a id="linkphotos" href="{$serendipityBaseURL}index.php?serendipity[subpage]=gallery" title="Photos"></a>
    <a id="linkvideos" href="{$serendipityBaseURL}pages/videos.html" title="Videos"></a>
    <a id="linkabout"  href="{$serendipityBaseURL}pages/about.html" title="About"></a>
-->
    <br style="clear: both">
</div>

<div id="wrap">
    <div id="mainpane">
        <div id="content">
            {$CONTENT}
        </div>
        <div id="serendipityRightSideBar">
            {serendipity_printSidebar side="right"}
            {serendipity_printSidebar side="left"}
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
