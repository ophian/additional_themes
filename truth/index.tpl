{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
{*    <title> Spiritual Enlightenment Truth Realization Non-Duality Blog By Edward Traversa</title> *}
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
    <meta name="author" content="Edward Traversa for Spiritual Enlightenment">
    <meta name="keywords" content="Spiritual Enlightenment, Spiritual Blog, Spiritual, Truth Realization, enlightenment, cosmic consciousness, illumanition, God, Awakening, Being, Ultimate Truth, Buddha, Becoming, Eddie Traversa">
    <meta name="description" content="Spiritual Enlightenment, Spiritual Blog, Non-Duality, Spiritual, Spiritual Awakening, Spiritual Development, Enlightenment, illumanition, consciousness, God Realization  by Eddie Traversa">
    <meta name="Copyright"  content="Copyright (c) 2005 Edward Traversa">
    <meta name="revisit-after" content="3 Days">
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
    <link rel="Shortcut Icon" href="favicon.ico" type="image/x-icon" title="spiritual enlightenment icon">
    {if $entry_id}
    <link rel="trackback" type="application/x-www-form-urlencoded" href="{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry_id}">
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
    {/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
<!--
Truth Template v.1 provided by Eddie Traversa 2005
  please leave note this intact.
  email:etraversa@dhtmlnirvana.com
  url: http://www.truthrealization.com/
  url: http://www.dhtmlnirvana.com/
   -->
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="serendipity_banner">
    <h1><a class="homelink1" href="{$serendipityBaseURL}" title="Spiritual Enlightenment" >Spiritual Enlightenment:Truth Realization</a></h1>
    <h2><a class="homelink2" href="{$serendipityBaseURL}" title="Truth Realization">Wake Up! You Already Are That:::</a></h2>
    <div id="urlLYR" class="urllogo">
    :::www.truthrealization.com:::
    </div>
</div>

<div id="mainpane">
{if $leftSidebarElements > 0}

        <div id="serendipityLeftSideBar">
            {serendipity_printSidebar side="left"}
        </div>
{/if}

        <div id="content">
            {$CONTENT}
        </div>
{if $rightSidebarElements > 0}

        <div id="serendipityRightSideBar">
            {serendipity_printSidebar side="right"}
        </div>
{/if}
</div>

{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
