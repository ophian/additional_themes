{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
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
{if in_array($view, ['start', 'entries'])}
    <link rel="canonical" href="{$serendipityBaseURL}" />
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
{if $template_option.colorset == 'default'}
    <style type="text/css" media="all">@import "{serendipity_getFile file="yellow.css"}";</style>
{elseif $template_option.colorset == 'aqua'}
    <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="aqua.css"}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
<div id="wrap">
    <div id="serendipity_banner">
        <img src="{serendipity_getFile file="img/corner_tl.gif"}" alt="corner" style="float:left;" />
        <!-- uncomment if you want your blog title and description
            <span class="title">
                <span class="white">{$head_title|default:$blogTitle}</span>
                <span class="subTitle">
                    {if $view == 'plugin'}{$blogDescription}{else}{$head_subtitle|default:$blogDescription}{/if}
                </span>
            </span>
        -->
        <a href="{$template_option.navlink4url}" title="{$template_option.navlink4text}">{$template_option.navlink4text}<span class="desc">{$template_option.navlink4alt}</span></a>
        <a href="{$template_option.navlink3url}" title="{$template_option.navlink3text}">{$template_option.navlink3text}<span class="desc">{$template_option.navlink3alt}</span></a>
        <a href="{$template_option.navlink2url}" title="{$template_option.navlink2text}">{$template_option.navlink2text}<span class="desc">{$template_option.navlink2alt}</span></a>
        <a href="{$template_option.navlink1url}" title="{$template_option.navlink1text}">{$template_option.navlink1text}<span class="desc">{$template_option.navlink1alt}</span></a>
        <a href="{$serendipityBaseURL}" title="home" class="active">home<span class="desc">welcome</span></a>
    </div>

    <div id="mainpane">
        <div id="sidebar">
            {serendipity_printSidebar side="right"}
            {serendipity_printSidebar side="left"}
            <div class="bottomCorner"><img src="{serendipity_getFile file="img/corner_sub_br.gif"}" alt="bottom corner" class="vBottom"/></div>
        </div>

        <div id="content">
            {$CONTENT}
            {$raw_data}
            <!-- Creates bottom left rounded corner -->
            <img src="{serendipity_getFile file="img/corner_sub_bl.gif"}" alt="bottom corner" class="vBottom"/>
        </div>

        <div id="sidebar" class="sidebar-append">
            {serendipity_printSidebar side="right"}
            {serendipity_printSidebar side="left"}
        </div>

    </div>
    <div id="footer" class="serendipity_entryFooter">
        <div id="footerLeft">&nbsp;&nbsp;Converted to <a href="https://ophian.github.io/">Serendipity Styx Edition</a> by <a href="http://www.carlgalloway.com/pages/serendipity-templates.html">Carl</a></div>
        <div id="footerRight">&nbsp;</div>
    </div>
</div>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
