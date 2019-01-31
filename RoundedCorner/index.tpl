{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<!--
RoundedCorner  serendipity theme by Abdussamad Abdurrazzaq

http://abdussamad.com

 -->
<head>
    <meta charset="{$head_charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
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
<div id="mainpane" class="{if $rightSidebarElements <= 0 AND $leftSidebarElements <= 0}no-{elseif $rightSidebarElements > 0 AND $leftSidebarElements > 0}sidebars{else}sidebar{/if}">

    <div id="banner_lc">
    <div id="banner_rc">
    <div id="banner_tc">
    <div id="banner_bc">
    <div id="banner_bl">
    <div id="banner_br">
    <div id="banner_tl">
    <div id="banner_tr">
    <div id="serendipity_banner">
        <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>
        <h2><a class="homelink2" href="{$serendipityBaseURL}">{if $view == 'plugin'}{$blogDescription}{else}{$head_subtitle|default:$blogDescription}{/if}</a></h2>
    </div>
    <div id="top_nav">
        <a href="{$serendipityBaseURL}">Home</a>
        <a href="{$serendipityBaseURL}categories/foo">Foo</a>
        <a href="{$serendipityBaseURL}categories/bar">Bar</a>
        <a href="{$serendipityBaseURL}categories/dev">Development</a>
    </div>
    </div></div></div></div></div></div></div></div>

{if $rightSidebarElements > 0 AND $leftSidebarElements <= 0}
        <div id="content" class="content_right_only_position">
{elseif $rightSidebarElements > 0 AND $leftSidebarElements > 0}
        <div id="content" class="content_middle_position">
{elseif $rightSidebarElements <= 0 AND $leftSidebarElements > 0}
        <div id="content" class="content_left_only_position">
{else}
        <div>
{/if}
            <div id="content_lc">
            <div id="content_rc">
            <div id="content_tc">
            <div id="content_bc">
            <div id="content_bl">
            <div id="content_br">
            <div id="content_tl">
            <div id="content_tr">
                <div id="content_inside">
                    {$CONTENT}
                </div>
            </div></div></div></div></div></div></div></div>
        </div>

{if $leftSidebarElements > 0}

    <div class="left_sidebar_container">
        <div id="sidebar_lc">
        <div id="sidebar_rc">
        <div id="sidebar_tc">
        <div id="sidebar_bc">
        <div id="sidebar_bl">
        <div id="sidebar_br">
        <div id="sidebar_tl">
        <div id="sidebar_tr">
            <div id="serendipityLeftSideBar">
                {serendipity_printSidebar side="left"}
            </div>
        </div></div></div></div></div></div></div></div>
    </div>
{/if}
{if $rightSidebarElements > 0}
    <div class="right_sidebar_container">
        <div id="sidebar_lc">
        <div id="sidebar_rc">
        <div id="sidebar_tc">
        <div id="sidebar_bc">
        <div id="sidebar_bl">
        <div id="sidebar_br">
        <div id="sidebar_tl">
        <div id="sidebar_tr">
            <div id="serendipityRightSideBar">
                {serendipity_printSidebar side="right"}
            </div>
        </div>
        </div></div></div></div></div></div></div></div>

{/if}

    <div class="serendipity_entryFooter">
        This website theme by <a href="http://abdussamad.com">Abdussamad Abdurrazzaq</a>. Powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a>
    </div>

</div>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
