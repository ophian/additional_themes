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
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom10.xml">
    {if $entry_id}
        <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
    {/if}
    {serendipity_hookPlugin hook="frontend_header"}
</head>
{else}
{if $staticpage_pagetitle}
<body id="{$staticpage_pagetitle}">
{else}
<body id="Weblog">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
<div id="container">
    <div id="serendipity_banner">
        <div class="logo">
        <!-- UNCOMMENT FOR CUSTOMIZING
            <a href="{$serendipityBaseURL}"><img src="templates/leaf/img/logo.png" alt="Logo" /></a>
        -->
        </div>
        <div id="navigation">
            <ul>
                <li class="nav1"><a href="{$serendipityBaseURL}" title="Weblog" accesskey="1">Weblog</a></li>
                <li class="nav2"><a href="{$serendipityBaseURL}index.php?/pages/about.html" title="About" accesskey="2">About</a></li>
                <li class="nav3"><a href="{$serendipityBaseURL}index.php?/pages/photos.html" title="Photos" accesskey="3">Photos</a></li>
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
    {if $rightSidebarElements > 0 OR  $leftSidebarElements > 0}
        <div id="serendipitySideBar" class="clearfix">
            {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
            {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
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
        <div id="credits">Copyright 2005 <a href="http://myschizobuddy.com" title="Copyrights 2005">My Schizo Buddy</a>
            | Designed by <a href="http://www.stanch.net/" title="Designer of This template" target="_blank">Ivan Fong</a>
            | Ported by <a href="http://myschizobuddy.com/" title="Template ported by" target="_blank">Ziyad Saeed</a>
            <br>Powered by <a href="https://ophian.github.io/" title="The best Blog System in the world" target="_blank">Serendipity Styx Edition</a>
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