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

<div id="container">
    <a id="topofpage"></a>

    <div id="serendipity_banner">
        <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:50:" ..."}</a></h1>
        <h2>{$head_subtitle|default:$blogDescription}</h2>
        <a id="menu"></a>
    </div>

    <div id="nav">
        <ul>
        <li {if $startpage}class="current"{/if}><a href="{$serendipityBaseURL}"><span>{$CONST.BLOG_HOME}</span></a></li>
            {foreach $navlinks AS $navlink}<li><a href="{$navlink.href}" title="{$navlink.title}"><span>{$navlink.title}</span></a></li>{/foreach}
        </ul>
    </div>

    <div id="wrap1">
        <div id="wrap2">

            <div id="topbox">
            <strong>
                <a href="{$serendipityBaseURL}">{$CONST.BLOG_HOME}</a>
                {if ($head_title && empty($entry.title)) || (isset($entry.title) AND $head_title != $entry.title)}
                    {if isset($entry.title)}&raquo; {$category_info.category_name|default:''}{/if}
                {elseif $head_title && isset($entry.title)}
                    {if isset($category_info.category_name)}
                        &raquo; <a href="{$category.category_link}" title="{$category.category_description}">{$category.category_name}</a>
                    {/if}
                    {if $entry.title == $head_title}
                        &raquo; {$entry.title|truncate:40:" ...":true}
                    {/if}
                {elseif $head_subtitle}
                    &raquo; {$head_subtitle}
                {/if}
                {if NOT empty($staticpage_pagetitle) && empty($entry.title)}
                  &raquo; {$staticpage_headline}
                {/if}
            </strong>
            </div>

            <div id="leftside">
            {if $leftSidebarElements < 1 && $rightSidebarElements > 0}
                {serendipity_printSidebar side="right"}
            {else}
                {serendipity_printSidebar side="left"}
            {/if}
            </div>

    {if NOT $is_single_entry AND empty($staticpage_articleformat)}
        {if $leftSidebarElements > 0}
            <div id="rightside">
                {serendipity_printSidebar side="right"}
            </div><a id="main"></a>
            <div id="content">
        {else}
            <div id="contentalt">
        {/if}

                {$CONTENT}
            </div>
        </div>
    {else}

            <div id="contentalt">
                {$CONTENT}
            </div>
        </div>
{/if}

        <div id="footer">Design by <a href="http://andreasviklund.com">Andreas Viklund</a> | {$CONST.POWERED_BY} <a href="https://ophian.github.io/">Serendipity Styx Edition</a> | Ported by <a href="http://www.carlgalloway.com">Carl</a> | <a href="#topofpage">{$CONST.BACK_TO_TOP}</a></div>
    </div>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
