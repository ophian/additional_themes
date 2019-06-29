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
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>

<body id="{if NOT empty($staticpage_pagetitle)}{$staticpage_pagetitle}{else}Weblog{/if}">
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

<div id="container">

    <div id="serendipity_banner">
        <div class="logo">
            <a href="{$serendipityBaseURL}"><img src="{serendipity_getFile file="img/logo.png"}" alt="Logo"></a>
        </div>
        <div id="navigation">
            <ul>
                <li class="nav1"><a href="{$serendipityBaseURL}index.php" title="button 1" accesskey="1">BUTTON1</a></li>
                <li class="nav2"><a href="{$serendipityBaseURL}index.php" title="button 2" accesskey="2">BUTTON2</a></li>
                <li class="nav3"><a href="{$serendipityBaseURL}index.php" title="button 3" accesskey="3">BUTTON3</a></li>
                <li class="nav4"><a href="{$serendipityBaseURL}index.php" title="button 4" accesskey="4">BUTTON4</a></li>
                <!-- ADDITIONAL LINKS: UNCOMMENT TO ACTIVATE: remember to add them to style.css as well
                <li class="nav4"><a href="{$serendipityBaseURL}index.php?/pages/contact.html" title="Contact" accesskey="4">Contact</a></li>
                -->
            </ul>
        </div>
    </div>

    <div id="mainpane" class="{if $rightSidebarElements == 0 AND $leftSidebarElements == 0}main{else}pane{/if}">
        <div id="content" class="content content_{$view}{if $rightSidebarElements == 0 AND $leftSidebarElements == 0} full{/if}">
            {$CONTENT}
        </div>
    {if $rightSidebarElements > 0 OR $leftSidebarElements > 0}
        <div id="serendipityRightSideBar">
            {serendipity_printSidebar side="left"}
            {serendipity_printSidebar side="right"}
        </div>
    {/if}
    </div>

    <div id="footer">
        <div id="serendipity_breadcrumb">
            <a href="{$serendipityBaseURL}">Home</a>
            {if ($head_title AND empty($entry.title)) OR (isset($entry.title) AND $head_title != $entry.title)}
                  :: {$category.category_name}
            {elseif $head_title AND NOT empty($entry.title) AND NOT empty($category.category_link)}
                :: <a href="{$category.category_link}">{$category.category_name}</a>
                {if isset($entry.title) AND $entry.title == $head_title}
                    :: {$entry.title}
                {/if}
            {/if}
            {if NOT empty($staticpage_pagetitle) AND empty($entry.title)}
                :: {$staticpage_pagetitle}
            {/if}
        </div>
        <div id="credits">
            Blix-Theme by <a href="http://www.kingcosmonaut.de/" title="Designer of This template" target="_blank">Sebastian Schmieg</a>
            | Ported by <a href="http://taeglichanders.de/" title="Template ported by" target="_blank">Christian Hoffmann</a>
            | {$CONST.POWERED_BY} <a href="https://ophian.github.io/" title="The best Blog System in the world">Serendipity Styx Edition</a>
        </div>
    </div>

</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
