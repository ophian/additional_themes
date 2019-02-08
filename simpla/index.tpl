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

<div id="wrap" style="width: {$template_option.pagewidth};">
    <div id="header">
        <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
        <p class="description">{$blogDescription}</p>
    </div> <!-- header -->

    <div id="content" style="width: {$template_option.contentwidth};">
    {$CONTENT}
    </div> <!-- content -->

    <div id="sidebar" style="width: {$template_option.sidebarwidth};">

        {if NOT empty($template_option.sidebarnavtitle)}

        <h3 class="serendipitySideBarTitle">{$template_option.sidebarnavtitle}</h3>

        <ul class="plainList">
        {foreach $navlinks AS $navlink}
            <li><a href="{$navlink.href}">{$navlink.title}</a></li>
        {/foreach}
        </ul>

        {/if}

        {if $leftSidebarElements > 0} {serendipity_printSidebar side="left"} {/if}
        {if $rightSidebarElements > 0} {serendipity_printSidebar side="right"} {/if}

    </div> <!-- sidebar -->
</div> <!-- wrap -->

<div id="footer">
    {$blogTitle} is proudly using the <a href="http://ifelse.co.uk/simpla">Simpla theme</a> originally designed by <a href="http://ifelse.co.uk">Phu</a>. Powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a>. Ported by <a href="http://www.kunze-media.com">Kunze Media</a>
</div> <!-- footer -->

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}