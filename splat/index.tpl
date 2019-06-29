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
    <script type="text/javascript">
        REPLACEMENT_DTR_BASEPATH = '{$serendipityHTTPPath}{$templatePath}{$template}/dtr';
    </script>
    <script type="text/javascript" src="{serendipity_getFile file="dtr/replacement.js"}"></script>

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

<div id="splat">
    <div class="spacer">&nbsp;</div>
    <div id="header">
        <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:30:"...":true}</a></h1>
        <h2 class="head"><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h2>
    </div>
    <div id="mainpane">
        <div id="serendipityLeftSideBar">
            <ul id="navigation">
                <li><a href="{$serendipityBaseURL}">Home</a></li>
                <!--  Do not change the links below -->
                <li><a href="{$template_option.navlink1url}" title="{$template_option.navlink1text}">{$template_option.navlink1text}</a></li>
                <li><a href="{$template_option.navlink2url}" title="{$template_option.navlink2text}">{$template_option.navlink2text}</a></li>
                <li><a href="{$template_option.navlink3url}" title="{$template_option.navlink3text}">{$template_option.navlink3text}</a></li>
                <li><a href="{$template_option.navlink4url}" title="{$template_option.navlink4text}">{$template_option.navlink4text}</a></li>
            </ul>
        </div>
        <div id="content">
            {$CONTENT}
        </div>
        {if $rightSidebarElements > 0}
        <div id="serendipityRightSideBar">
            {serendipity_printSidebar side="right"}
        {/if}
            {serendipity_printSidebar side="left"}
        </div>
    </div>

    <div class="spacer">&nbsp;</div>
</div>

<div id="footer">
    <p>SPLAT! by <a href="http://themes.daves.me.uk">David Cummins</a> powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a></p>
</div>

<script src="{serendipity_getFile file="splat.js"}"></script>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
