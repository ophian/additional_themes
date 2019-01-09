{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>
    <title>{$head_title|default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="generator" content="Serendipity v.{$serendipityVersion}" />
{if in_array($view, ['start', 'entries', 'entry', 'feed', 'plugin']) OR NOT empty($staticpage_pagetitle) OR (isset($robots_index) AND $robots_index == 'index')}
    <meta name="robots" content="index,follow" />
{else}
    <meta name="robots" content="noindex,follow" />
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}" />
{/if}
{if ($view == "start")}
    <link rel="canonical" href="{$serendipityBaseURL}" />
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body id="{$template_option.colorset}">
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="serendipity_banner"><a id="topofpage"></a>
    <div id="identity"><h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:60:" ..."}</a></h1>
    <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h2></div>
    <div id="navbar">
        <ul>
        {foreach $navlinks AS $navlink}
            <li><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
        </ul>
    </div>
</div>

<!-- sliding faux columns, part 1 -->
{if $leftSidebarElements > 0 && $rightSidebarElements > 0}
<!-- Case 1: 3 columns -->
<div class="sfc1">
<div class="sfc2">
{/if}
{if $leftSidebarElements > 0 && $rightSidebarElements == 0}
<!-- Case 2: 2 columns, sidebar left -->
<div class="sfc1">
{/if}
{if $leftSidebarElements == 0 && $rightSidebarElements > 0}
<!-- Case 3: 2 columns, sidebar right -->
<div class="sfc2">
{/if}
<!-- we don't need another case for no columns, that'll work anyhow -->
<!-- closed below -->

<!-- MAINPANE -->
<div id="mainpane">

{if $leftSidebarElements > 0 && $rightSidebarElements > 0}
<!-- Case 1: 3 columns -->
<div id="content" class="withboth">{$CONTENT}</div>
<div id="serendipityLeftSideBar" class="leftandright">{serendipity_printSidebar side="left"}</div>
<div id="serendipityRightSideBar">{serendipity_printSidebar side="right"}</div>
{/if}

{if $leftSidebarElements > 0 && $rightSidebarElements == 0}
<!-- Case 2: 2 columns, sidebar left -->
<div id="content" class="withleft">{$CONTENT}</div>
<div id="serendipityLeftSideBar" class="leftonly">{serendipity_printSidebar side="left"}</div>
{/if}

{if $leftSidebarElements == 0 && $rightSidebarElements > 0}
<!-- Case 3: 2 columns, sidebar right -->
<div id="content" class="withright">{$CONTENT}</div>
<div id="serendipityRightSideBar">{serendipity_printSidebar side="right"}</div>
{/if}

{if $leftSidebarElements == 0 && $rightSidebarElements == 0}
<!-- Case 4: 1 column, no sidebars -->
<div id="content" class="nosidebars">{$CONTENT}</div>
{/if}

</div><!-- END MAINPANE -->

<!-- sliding faux columns, part 2 -->
{if $leftSidebarElements > 0 && $rightSidebarElements > 0}
<!-- Case 1: 3 columns -->
</div><!-- closes .sfc2 -->
</div><!-- closes .sfc1 -->
{/if}
{if $leftSidebarElements > 0 && $rightSidebarElements == 0}
<!-- Case 2: 2 columns, sidebar left -->
</div><!-- closes .sfc1 -->
{/if}
{if $leftSidebarElements == 0 && $rightSidebarElements > 0}
<!-- Case 3: 2 columns, sidebar right -->
</div><!-- closes .sfc2 -->
{/if}
<!-- end sfc -->

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
<div id="footer">
<p>{$CONST.POWERED_BY} <a href="http://www.s9y.org">s9y</a> - Design by <a href="http://www.carlgalloway.com">Carl</a> and <a href="http://www.yellowled.de">YellowLed</a></p>
</div>
</body>
</html>
{/if}
