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

<div id="container" class="clearfix">

    <div id="header" onclick="location.href='{$serendipityBaseURL}';" style="cursor: pointer;">
        <div id="logo">
          <h1 id="sitename">{$head_title|default:$blogTitle}</h1>
          <h2 id="subtitle">{$head_subtitle|default:$blogDescription}</h2>
        </div>
    </div>
    <div id="search">
     <div id="tabs6">
      <ul>
        <li><a href="{$serendipityBaseURL}" title="Link 1"><span>Home</span></a></li>
        <li><a href="#" title="Link 2"><span>Photos</span></a></li>
        <li><a href="#" title="Link 3"><span>Musics</span></a></li>
        <li><a href="#" title="Link 4"><span>Downloads</span></a></li>
        <li><a href="#" title="Link 5"><span>About</span></a></li>
        <li><a href="#" title="Link 5"><span>Contact</span></a></li>
      </ul>
     </div>
    </div>

    <div id="content" class="clearfix">
        <div id="main">
            {$CONTENT}
        </div>

        <div id="sidebar">
            <div id="search-results"></div>
            {if $rightSidebarElements > 0}
            <div class="sidebar-node">
                {serendipity_printSidebar side="right"}
                {serendipity_printSidebar side="left"}
            </div>
            {/if}
        </div>
        <br clear="all" />
        <div id="footer">
            <ul>
                <li> |  <a href="#">Home</a> | </li><li> <a href="#">SiteMap</a> | </li>
                <li><a href="http://www.piotrpolak.com">Design by Piotr Polak</a> | <a href="mailto:ahmetusal@gmail.com">Ported by Ahmet Usal</a> |</li>
            </ul>
        </div>
    </div>

</div>

{* <script type="text/javascript" src="{serendipity_getFile file="j/nicetitle.js"}"></script> *}
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
