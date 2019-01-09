{if $is_embedded != true}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
<title>{$head_title|default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
<!--
Serendipity-Template by Vladimir Simovic aka Perun
www.vlad-design.de | www.perun.net
-->
<meta http-equiv="content-type" content="text/html; charset={$head_charset}" />
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

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}

<div id="mainpane">

<div id="banner">
<h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>
<h2><a href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h2>
</div>

<div id="sidebar">

{if $rightSidebarElements > 0}
<div id="serendipityRightSideBar">{serendipity_printSidebar side="right"}</div>
{/if}

{if $leftSidebarElements > 0}
<div id="serendipityLeftSideBar">{serendipity_printSidebar side="left"}</div>
{/if}

</div>

<div id="content"><!--Inhalt-->
{$CONTENT}
</div><!--/Inhalt-->

<div style="clear: both;">&nbsp;</div>

<div class="copyright">Serendipity-Template by <a href="http://www.vlad-design.de">Vladimir Simovic</a> (aka <a href="http://www.perun.net">Perun</a>)</div>

</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
