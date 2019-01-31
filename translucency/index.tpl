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
    <meta name="robots" content="index,follow" />
{else}
    <meta name="robots" content="noindex,follow" />
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}" />
{/if}
{if in_array($view, ['start', 'entries'])}
    <link rel="canonical" href="{$serendipityBaseURL}" />
{/if}
    <link rel="stylesheet" type="text/css" media="screen" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{if $template_option.colorset == 'transred'}
    <style type="text/css" media="all">@import "{serendipity_getFile file="transred.css"}";</style>
{elseif $template_option.colorset == 'transblue'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="transblue.css"}" />
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
<div id="wrapper">

    <div id="searchbar">
        <form id="searchformheader" action="{$serendipityBaseURL}" method="get">
            <input type="hidden" name="serendipity[action]" value="search" />
            <input alt="Quicksearch" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onFocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onBlur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';">
        </form>
    </div>
    <div id="wrap">
        <div id="serendipity_banner">
            <h1 class="title"><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:27:" ...":true}</a></h1>
            <h2 class="subTitle">{if $view == 'plugin'}{$blogDescription}{else}{$head_subtitle|default:$blogDescription}{/if}</h2>
        </div>
        <div id="menu">
            <a href="{$serendipityBaseURL}" id="navHome" title="Posted Recently">{$CONST.HOMEPAGE}</a>
        {foreach $navlinks AS $navlink}
            <a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a>
        {/foreach}
        </div>

        <div id="mainpane">
            <div id="sidebar">
                {serendipity_printSidebar side="left"}
                {serendipity_printSidebar side="right"}
            </div>
            <div id="content">
                {$CONTENT}
            </div>
        </div>
    </div>

    <div id="footer">Design by <a href="http://www.taeglichanders.de">Christian Hoffmann</a> | <span lang="en">Powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a> &amp; the <i>{$template}</i> theme.</span></div>
</div>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
