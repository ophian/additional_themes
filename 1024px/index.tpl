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
    <!-- Ported to Serendipity by Carl Galloway [http://www.carlgalloway.com] -->
{if $template_option.colorset == 'red'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="red.css"}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
<div id="wrap">

    <div id="pagetop">
        <p id="toplinks">Skip to: <a href="#content">Content</a> | <a href="#sidebar">Navigation</a> | <a href="#footer">Footer</a></p>
        <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:40:' ...'}</a></h1>
        <p id="slogan">{$head_subtitle|default:$blogDescription}</p>
    </div>

    <div id="{if $template_option.contentposition == 'true'}content{elseif $template_option.contentposition == 'false'}contentalt{/if}">
        {$CONTENT}
    </div>

    <div id="sidebar">
        {serendipity_printSidebar side="right"}
        {serendipity_printSidebar side="left"}
    </div>

    <div id="footer">
        <p>&copy; {$template_option.sitename} | {foreach $navlinks AS $navlink}<a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a> | {/foreach}<a href="#pagetop">Back to top</a><br>
            Design by <a href="http://andreasviklund.com/">Andreas Viklund</a> | Serendipity Styx Template by <a href="http://www.carlgalloway.com">Carl</a>
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