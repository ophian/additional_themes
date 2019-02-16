{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
{if in_array($view, ['start', 'entries', 'entry', 'feed', 'plugin']) OR NOT empty($staticpage_pagetitle) OR (isset($robots_index) AND $robots_index == 'index')}
    <meta name="robots" content="index,follow">
{else}
    <meta name="robots" content="noindex,follow">
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if ($view == "start")}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom10.xml">
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
        <!--
        <div class="logo">
            <a href="{$serendipityBaseURL}"><img src="templates/example/img/logo.png" alt="Logo"></a>
        </div>
        -->
        <div id="navigation">
            <ul>
                <li class="nav1"><a href="{$serendipityBaseURL}index.php?frontpage" title="button1" accesskey="1">button1</a></li>
                <li class="nav2"><a href="{$serendipityBaseURL}index.php?frontpage" title="button2" accesskey="2">button2</a></li>
                <li class="nav3"><a href="{$serendipityBaseURL}index.php?frontpage" title="button3" accesskey="3">button3</a></li>
                <li class="nav4"><a href="{$serendipityBaseURL}index.php?frontpage" title="button4" accesskey="4">button4</a></li>
                <!-- ADDITIONAL LINKS: UNCOMMENT TO ACTIVATE: remember to add them to style.css as well
                <li class="nav4"><a href="{$serendipityBaseURL}index.php?/pages/contact.html" title="Contact" accesskey="4">Contact</a></li>
                -->
            </ul>
        </div>
    </div>
    <div id="mainpane">
        <div id="content">
            {$CONTENT}
        </div>
    {if $leftSidebarElements > 0}

        <div id="serendipityLeftSideBar">
            {serendipity_printSidebar side="left"}
        </div>
    {/if}
    {if $rightSidebarElements > 0}

        <div id="serendipityRightSideBar">
            {serendipity_printSidebar side="right"}
        </div>
    {/if}

    </div>

    <div id="footer">
        <div id="serendipity_breadcrumb">
            <a href="{$serendipityBaseURL}">Home</a>
            {if ($head_title AND empty($entry.title)) OR (isset($entry.title) AND $head_title != $entry.title)}
                  :: {$category.category_name}
            {elseif $head_title AND NOT empty($entry.title)}
                :: <a href="{$category.category_link}">{$category.category_name}</a>
            {if isset($entry.title) AND $entry.title == $head_title}
                :: {$entry.title}
            {/if}
            {/if}
            {if NOT empty($staticpage_pagetitle) AND empty($entry.title)}
                :: {$staticpage_pagetitle}
            {/if}
        </div>
        <div id="credits">Copyright 2005 <a href="http://www.taeglichanders.de/" title="Copyrights 2005">T&auml;glich &amp; Anders</a>
            | Original Code by <a href="http://myschizobuddy.com/" title="Template ported by" target="_blank">Ziyad Saeed</a>
            <br>Powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a> <abbr title="and">&amp;</abbr> the <i>{$template}</i> theme.
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
