{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
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
    <link rel="stylesheet" type="text/css" media="screen" href="{$head_link_stylesheet}">
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
<script type="text/javascript" src="{serendipity_getFile file="nifty2.js"}"></script>
{if $template_option.colorset == 'softened'}
    <style type="text/css" media="all">@import "{serendipity_getFile file="softened.css"}";</style>
    <script type="text/javascript">
    window.onload=function(){ldelim}
    if (!NiftyCheck())
            return;
        Rounded("#content blockquote" , "#f0f0f0" , "#fefade", 20 ,20, 0, 1, 0, 1);
    {rdelim}
    </script>
{elseif $template_option.colorset == 'sunset'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="sunset.css"}">
    <script type="text/javascript">
    window.onload=function(){ldelim}
    if (!NiftyCheck())
            return;
        Rounded("#content blockquote" , "#f0f0f0" , "#D3F9FF", 20 ,20, 0, 1, 0, 1);
    {rdelim}
    </script>
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
<div id="wrap">
    <div id="serendipity_banner">
        <h1 class="title"><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>
        <h2 class="subTitle">{$head_subtitle|default:$blogDescription}</h2>
    </div>
    <div id="menu">
        <a href="{$serendipityBaseURL}" id="navHome" title="Posted Recently" accesskey="h" class="active">{$CONST.HOMEPAGE}</a>
    {foreach $navlinks AS $navlink}
        <a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a>
    {/foreach}
    </div>

    <div id="mainpane">
        <div id="sidebar">
            {serendipity_printSidebar side="right"}
            {serendipity_printSidebar side="left"}
        </div>
        <div id="content">
            {$CONTENT}
            <p id="footer">Design by <a href="http://www.FullAhead.org" title="FullAhead.org">FullAhead</a> and <a href="http://threetree.net/" title="ThreeTree.net">ThreeTree</a><br />Converted to <a href="https://ophian.github.io/">s9y</a> by <a href="http://www.carlgalloway.com">Carl Galloway</a></p>
        </div>
    </div>
</div>
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}