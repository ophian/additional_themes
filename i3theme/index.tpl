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
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="all">
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="print.css"}" media="print">
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="s9y-print.css"}" media="print">
{if $template_option.dbx == 'false'}
<!-- Sidebar docking boxes (dbx) by Brothercake - http://www.brothercake.com/ -->
    <script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/dbx.js"></script>
    <script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/dbx-key.js"></script>
{/if}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="dbx.css"}" media="screen, projection">
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="trackback" type="application/x-www-form-urlencoded" href="{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry_id}">
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="page">
    <div id="wrapper">
        <div id="header">
            <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>
            <div class="description">{if $view == 'plugin'}{$blogDescription}{else}{$head_subtitle|default:$blogDescription}{/if}</div>

            <form method="get" id="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}">
            <div>
                <input type="hidden" name="serendipity[action]" value="search">
                <input type="text" id="s" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onfocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';">
                <input id="searchsubmit" type="submit" value="{$CONST.QUICKSEARCH}" name="serendipity[searchButton]">
                <div id="LSResult" style="display: none;"><div id="LSShadow"></div></div>
            </div>
            </form>
        </div><!-- /#header -->

{if ($template_option.layout == 'sbs' || $template_option.layout == 'ssb') AND $leftSidebarElements > 0}
        <div id="sidebar-left" class="dbx-group">
        {if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}
        </div><!-- /#sidebar-left -->
{/if}

{if $template_option.layout == 'ssb' AND $rightSidebarElements > 0}
        <div id="sidebar-right" class="dbx-group sidebar-right-ssb">
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="right"}
        {/if}
        {if $template_option.meta == 'true'}
            <div id="meta" class="dbx-box">
                <h3 class="dbx-handle">Meta</h3>

                <div class="dbx-content">
                    <ul>
                       <li class="rss"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">{$CONST.ENTRIES} (RSS)</a></li>
                       <li class="rss"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/comments.rss2">{$CONST.COMMENTS} (RSS)</a></li>
                       <li class="login"><a href="{$serendipityBaseURL}serendipity_admin.php">{$CONST.LOGIN}</a></li>
                   </ul>
                </div>
            </div><!-- /#meta -->
        {/if}
        </div><!-- /#sidebar-right -->
{/if}

        <div id="left-col" class="{if $leftSidebarElements == 0}left-0{/if}{if $rightSidebarElements == 0} right-0{/if}">
            <div id="nav">
                <ul>
{foreach $navlinks AS $navlink}
                   <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
{/foreach}
                </ul>
            </div><!-- /#nav -->

            <div id="content">
                {$CONTENT}
            </div><!-- /#content -->

            <div id="footer">
                <span class="mangoorange"><a href="http://www.i3theme.com">i3Theme 1.6</a> is designed by <a href="http://www.ndesign-studio.com">N.Design Studio</a>, customized by <a href="http://www.mangoorange.com/">MangoOrange&trade;</a>, supported by <a href="http://www.webhostinggeeks.com/">Web Hosting Geeks</a>, <br/> sponsored by <a href="http://www.web-hosting-top.com/">Web Hosting Reviews &amp; Free Coupons</a> and <a href="http://www.b4udecide.com/">Cheap Web Hosting</a>.</span>
                <span class="mangoorange">{$CONST.POWERED_BY} <a href="https://ophian.github.io/" target="_blank">Serendipity Styx Edition</a> | Ported by <a href="http://yellowled.de/s9y.html">YellowLed</a>.</span>
            </div><!-- /#footer -->
        </div><!-- /#left-col -->

{if $template_option.layout == 'sbs' || $template_option.layout == 'bss'}
        <div id="sidebar-right" class="dbx-group">
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="right"}
        {/if}
        {if $template_option.meta == 'true'}
            <div id="meta" class="dbx-box">
                <h3 class="dbx-handle">Meta</h3>

                <div class="dbx-content">
                    <ul>
                       <li class="rss"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">{$CONST.ENTRIES} (RSS)</a></li>
                       <li class="rss"><a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/comments.rss2">{$CONST.COMMENTS} (RSS)</a></li>
                       <li class="login"><a href="{$serendipityBaseURL}serendipity_admin.php">{$CONST.LOGIN}</a></li>
                   </ul>
                </div>
            </div><!-- /#meta -->
        {/if}
        </div><!-- /#sidebar-right -->
{/if}
{if $template_option.layout == 'bss'}
        <div id="sidebar-left" class="dbx-group sidebar-left-bss">
        {if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}
        </div><!-- /#sidebar-left -->
{/if}

        <hr class="hidden" />
    </div><!-- /#wrapper -->
</div><!-- /#page -->
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
