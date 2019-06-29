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

    <div id="nav">
        <div id="hover">
            <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:50:" ...":true}</a></h1>
        </div>
        <ul>
        {foreach $navlinks AS $navlink}
            <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
        </ul>
    </div>
    <div id="primary_container">
        <div id="content_container">
            <div id="main_identity">
                <h2 class="header"><a href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h2>
            </div>
            <div id="content">
            {$CONTENT}
            </div>
            <div id="footer">
                <p>Layout by <a href="http://www.sixshootermedia.com/Pretty_as_a_Picture/templates/">Ricky Wilson</a> | Serendipity Template by <a href="http://www.carlgalloway.com">Carl Galloway</a> | <a href="{$serendipityBaseURL}serendipity_admin.php">{$CONST.LOGIN}</a></p>
            </div>
        </div>

        <div id="aboutbox_container">
            <div id="aboutbox_title"><h2 class="header">{$template_option.abouttitle}</h2></div>
            <div id="aboutbox_content"><p>{$template_option.about}<br><a href="{$template_option.aboutpageurl}">Read More</a></p></div>
        </div>
        {serendipity_printSidebar side="right"}
        {serendipity_printSidebar side="left"}
    </div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
