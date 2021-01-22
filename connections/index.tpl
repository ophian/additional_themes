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

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}

<div id="wrap">
    <div id="header">
        <ul id="topnav">
            <li><a href="{$serendipityBaseURL}" id="navHome" title="Posted Recently" accesskey="h">Home |</a></li>
            <li><a href="#" id="navAbout" title="About the Author" accesskey="a">About |</a></li>
            <li><a href="#" id="navArchives" title="Posted Previously" accesskey="r">Archives |</a></li>
            <li><a href="#" id="navLinks" title="Recommended Links" accesskey="l">Links |</a></li>
            <li><a href="#" id="navContact" title="Contact the Author" accesskey="c">Contact </a></li>
        </ul>
        <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>
        <h2>{$head_subtitle|default:$blogDescription}</h2>
    </div>
    <table id="main">
        <tr>
            <td id="content" class="content content_{$view}">
                {$CONTENT}
            </td>
            <td id="sidebar">
                {serendipity_printSidebar side="right"}
                {serendipity_printSidebar side="left"}
            </td>
        </tr>
    </table>
    <p id="footer">
        Design Downloaded from <a href="http://www.vanillamist.com" title="Vanilla Mist">www.vanillamist.com</a> | {$CONST.POWERED_BY} <a href="https://ophian.github.io/">Serendipity Styx Edition</a> by <a href="http://www.carlgalloway.com">Carl Galloway</a>
    </p>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
