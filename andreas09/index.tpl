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
    <link rel="trackback" type="application/x-www-form-urlencoded" href="{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry_id}">
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body id="{$template_option.colorset}">
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

<div id="mainpane">
    <div id="serendipity_banner">
        <h1>{$head_title|default:$blogTitle|truncate:50:" ...":true}</h1>
        <h2>{$head_subtitle|default:$blogDescription}</h2>
    </div>
    <div id="mainmenu">
        <ul>
            <li class="selected"><a href="{$serendipityBaseURL}" accesskey="h">{$CONST.HOMEPAGE}</a></li>
        {foreach $navlinks AS $navlink}
            <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
        </ul>
        <form id="searchform" action="{$serendipityBaseURL}" method="get">
            <input type="hidden" name="serendipity[action]" value="search">
            <input alt="Quicksearch" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onFocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onBlur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';">
        </form>
    </div>

    <div id="wrap">
<!-- ***** CHECK AND SEE HOW MANY COLUMNS ARE NEEDED ***** -->

<!-- /* case scenario to see if we have a left column the content area and the right column */ -->
{if $leftSidebarElements > 0 && $rightSidebarElements > 0}
    <!-- ***** LEFT COLUMN ***** -->
        <div id="leftsideA">
            <div id="serendipityLeftSideBar">
                {serendipity_printSidebar side="left"}
            </div>
        </div>

    <!-- ***** RIGHT COLUMN ***** -->
        <div id="rightsideA">
            <div id="serendipityRightSideBar">
                {serendipity_printSidebar side="right"}
            </div>
        </div>

    <!-- ***** CONTENT AREA ***** -->
        <div id="contentA" class="content">
            {$CONTENT}
        </div>
{/if}


<!-- /* case scenario to see if we have a left column and only the content area */ -->
{if $leftSidebarElements > 0 && $rightSidebarElements == 0}
    <!-- ***** LEFT COLUMN ***** -->
        <div id="leftsideB">
            <div id="serendipityLeftSideBar">
            {serendipity_printSidebar side="left"}
            </div>
        </div>

    <!-- ***** NO RIGHT COLUMN ***** -->

    <!-- ***** CONTENT AREA ***** -->
        <div id="contentB" class="content">
            <div id="contentholder">
                {$CONTENT}
            </div>
        </div>
{/if}


<!-- /* case scenario to see if we have a right column and only the content area */ -->
{if $leftSidebarElements == 0 && $rightSidebarElements > 0}

    <!-- ***** NO LEFT COLUMN ***** -->

    <!-- ***** RIGHT COLUMN ***** -->
        <div id="rightsideC">
            <div id="serendipityRightSideBar">
                {serendipity_printSidebar side="right"}
            </div>
        </div>

    <!-- ***** CONTENT AREA ***** -->
        <div id="contentC" class=content">
            {$CONTENT}
        </div>
{/if}

        <div class="clearingdiv">&nbsp;</div>
    </div>
</div>

<div id="footer">
    &copy; {$template_option.copyrightname} | Design by <a href="http://andreasviklund.com">Andreas Viklund</a> | Serendipity template by <a href="http://www.carlgalloway.com">Carl</a> and <a href="http://www.bexology.com">Bex</a>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}

