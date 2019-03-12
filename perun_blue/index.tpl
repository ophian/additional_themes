{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
<!--
Serendipity-Template by Vladimir Simovic aka Perun
www.vlad-design.de | www.perun.net
-->
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
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="print.css"}" media="print">
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

<div id="mainpane">

    <div id="banner">
        <div id="header">
        <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>&nbsp;| <h2><a href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h2></div>
    </div>

    <div id="sidebar">

    {if $rightSidebarElements > 0}
        <div id="serendipityRightSideBar">
            {serendipity_printSidebar side="right"}
        </div>
    {/if}

    {if $leftSidebarElements > 0}
        <div id="serendipityLeftSideBar">
            {serendipity_printSidebar side="left"}
        </div>
    {/if}

    </div>

    <div id="content">
        {$CONTENT}
    </div>

    <div style="clear: both;">&nbsp;</div>

    <div class="copyright">Powered by <a href="https://ophian.github.io/" title="a PHP Weblog/Blog software">Serendipity Styx Edition</a> | Template by <a href="http://www.perun.net" title="Vladimir Simovic aka Perun: www.vlad-design.de and www.perun.net">Perun</a></div>

</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
