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

{if $template_option.colorset == 'blue'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="blue.css"}" />
{elseif $template_option.colorset == 'pink'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="pink.css"}" />
{elseif $template_option.colorset == 'maroon'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="maroon.css"}" />
{elseif $template_option.colorset == 'green'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="green.css"}" />
{elseif $template_option.colorset == 'nuclear'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="nuclear.css"}" />
{else}

<!-- ****** Change default Colorset here ****** -->
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="blue.css"}" />
{/if}

<!-- Original Design by Andreas Viklund [http://andreasviklund.com] -->
<!-- Converted to Serendipity by Carl Galloway [http://www.carlgalloway.com] -->
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

<div id="pagetop">
    <div id="header">
        <h1>{$head_title|default:$blogTitle|truncate:50:" ...":true}</h1>
        <h2>{$head_subtitle|default:$blogDescription}</h2>
    </div>
    <div id="navigation">
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
</div>

<div id="mainpane" class="{if $template_option.contentposition === true}contentleft{elseif $template_option.contentposition === false}contentright{/if}">

    <div id="content">
        {$CONTENT}
    </div>

    <div id="sidebar">
        {serendipity_printSidebar side="left"}
        {serendipity_printSidebar side="right"}
    </div>
    <div class="clearingdiv">&nbsp;</div>
</div>

<div id="footer">
    <div class="footerbg">
        <p>Layout by <a href="http://andreasviklund.com">Andreas Viklund</a> | <a href="https://ophian.github.io/">Serendipity Styx Edition</a> template by <a href="http://www.carlgalloway.com/categories/9-Downloads">Carl</a></p>
    </div>
</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
