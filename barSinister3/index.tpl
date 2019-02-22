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

<div id="bigholder">

    <div id="serendipity_banner">
        <div id="barsinister">
            <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:50:' ...'}</a></h1>
            <h2>{$head_subtitle|default:$blogDescription|truncate:50:" ...":true}</h2>
        </div>
    </div>

    <div id="mainpane">
        <div id="content">
            {$CONTENT}
        </div>
{if $leftSidebarElements > 0 OR  $rightSidebarElements > 0}

        <div id="serendipitySideBar">
            {serendipity_printSidebar side="left"}
            {serendipity_printSidebar side="right"}
        
            <div class="serendipitySideBarItem credits">
                <h3 class="serendipitySideBarTitle credits">Credits</h3>
                <div class="serendipitySideBarContent">Design by <a href="http://www.hastalasiesta.org">Martin</a><br />Code by <a href="http://www.carlgalloway.com">Carl</a></div>
            </div>
        </div>
{/if}

    </div>

    <div id="footer">
        <p>&nbsp;</p>
    </div>

</div>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
