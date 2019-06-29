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
<!-- Originally designed by Andreas Viklund [http://andreasviklund.com] -->
<!-- Converted to Serendipity by Carl Galloway [http://www.carlgalloway.com] -->
<!-- Complete snot hacked out of it and all original graphics designed by Rebecca Hemstad [http://www.bexology.com] -->
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

<div id="mainpane">

    <!-- ***** PRIMARY BANNER AREA ***** -->
    <div id="identity">
        <h1>{$head_title|default:$blogTitle|truncate:50:" ...":true}</h1>
        <h2>{$head_subtitle|default:$blogDescription}</h2>
    </div>

    <!-- ***** NAVIGATION AREA ***** -->
    <div id="navigation">
        <div class="nav">
            <ul>
                <li class="selected"><a href="{$serendipityBaseURL}" accesskey="h">{$CONST.HOMEPAGE}</a></li>
                <li><a href="{$template_option.navlink1url}" title="{$template_option.navlink1text}">{$template_option.navlink1text}</a></li>
                <li><a href="{$template_option.navlink2url}" title="{$template_option.navlink2text}">{$template_option.navlink2text}</a></li>
                <li><a href="{$template_option.navlink3url}" title="{$template_option.navlink3text}">{$template_option.navlink3text}</a></li>
                <li><a href="{$serendipityBaseURL}serendipity_admin.php">{$CONST.LOGIN}</a></li>
            </ul>
        </div>

        <div class="quicksearch">
            <form id="searchform" action="{$serendipityBaseURL}" method="get">
                <img src="{$serendipityBaseURL}templates/bex01/img/bexmag.gif" alt="search picture">
                <input type="hidden" name="serendipity[action]" value="search">
                <input alt="Quicksearch" type="text" name="serendipity[searchTerm]" placeholder="{$CONST.QUICKSEARCH}..." value="">
            </form>
        </div>
    </div>

    <!-- ***** CONTENT AREA ***** -->
    <div id="content">
        {$CONTENT}
    </div>

    <!-- ***** RIGHT SIDEBAR AREA ***** -->
    {if $rightSidebarElements > 0 OR $leftSidebarElements > 0}
    <div id="sidebar">
        {serendipity_printSidebar side="left"}
        {serendipity_printSidebar side="right"}
    </div>
    {/if}

    <!-- ***** FOOTER AREA ***** -->
    <div id="footer">
        <p>Design by <a href="http://www.bexology.com">Bex</a> &amp; <a href="http://www.carlgalloway.com">Carl</a></p>
    </div>

</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
