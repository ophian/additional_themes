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
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
<!-- Designed by David Cummins 27-9-2006[http://www.bankcreative.com] -->
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="mainpane">
    <div class="spacer">&nbsp;</div>
    <div id="content" valign="top">{$CONTENT}</div>
    <div id="wrapper">
        <div id="header">
            <h2><a class="homelink2" href="{$serendipityBaseURL}">{if $view == 'plugin'}{$blogDescription}{else}{$head_subtitle|default:$blogDescription}{/if}</a></h2>
            <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|default:$blogTitle}</a></h1>
        </div>
        <div id="navcontainer">
            <ul id="navlist">
                <li class="selected"><a href="{$serendipityBaseURL}" accesskey="h">{$CONST.HOMEPAGE}</a></li>
                <li><a href="{$template_option.navlink1url}" title="{$template_option.navlink1text}">{$template_option.navlink1text}</a></li>
                <li><a href="{$template_option.navlink2url}" title="{$template_option.navlink2text}">{$template_option.navlink2text}</a></li>
                <li><a href="{$template_option.navlink3url}" title="{$template_option.navlink3text}">{$template_option.navlink3text}</a></li>
                <li><a href="{$template_option.navlink4url}" title="{$template_option.navlink4text}">{$template_option.navlink4text}</a></li>
            </ul>
        </div>
{if $leftSidebarElements > 0}
        <div id="serendipityLeftSideBar" valign="top">{serendipity_printSidebar side="left"}</div>
{/if}
{if $rightSidebarElements > 0}
        <div id="serendipityRightSideBar" valign="top">{serendipity_printSidebar side="right"}</div>
{/if}

    <div class="spacer">&nbsp;</div>
</div>
<div id="footer" class="serendipity_entryFooter">
    <p>
    Theme square design by <a href="http://themes.daves.me.uk">David Cummins</a>. Powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a>
    </p>
</div>

{/if}

{$raw_data}

{if $is_embedded != true}
</body>
</html>
{/if}
