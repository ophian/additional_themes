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

 <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="dropline_one.css"}" />
 <style type="text/css">
    body { background-color: {$template_option.backgroundc}; }
  </style>
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

<div id="wrap">

    <div id="serendipity_banner"><a id="topofpage"></a>
        <h1><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:80:" ..."}</a></h1>
        <h2><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></h2>
    </div>
    <ul id="dropline">

{if $template_option.enablehmenue === true}
    {foreach $navlinks AS $navlink}

        <li><a href="{$navlink.href}"><b>{$navlink.title}</b></a>
            <ul{if $navlink.drop == "0"} class="blank"{/if}>
        {if $navlink.drop != "0"}
            {foreach $navlink.dropdownentries AS $sub}
                <li> <a href="{$sub.href}" title="{$sub.title}" >{$sub.title}</a></li>
            {/foreach}
        {/if}

                <li></li>
            </ul>
     {/foreach}
{/if}

    </ul>

    <div id="mainpane">

    {if isset($staticpage_precontent) AND $staticpage_precontent == '<!--noRightSidebar-->'}
        {if $leftSidebarElements > 0}
            <div id="serendipityLeftSideBar">
                {serendipity_printSidebar side="left"}
            </div>
        {/if}
            <div id="content">
                {$CONTENT}
            </div>
    {else}
        {if isset($staticpage_precontent) AND $staticpage_precontent == '<!--noLeftSidebar-->'}
            <div id="content">
                {$CONTENT}
            </div>
            {if $rightSidebarElements > 0}
            <div id="serendipityRightSideBar">
                {serendipity_printSidebar side="right"}
            </div>
            {/if}
        {else}
        {if isset($staticpage_precontent) AND $staticpage_precontent == '<!--noSidebar-->'}
            <div id="content">
                {$CONTENT}
            </div>
        {else}
        {if $leftSidebarElements > 0}
            {if empty($entry.properties.special_switch2) OR $entry.properties.special_switch2 !== true}
                <div id="serendipityLeftSideBar" class="sidebar">
                    {serendipity_printSidebar side="left"}
                </div>
            {/if}
        {/if}

            <div id="content">
                {$CONTENT}
            </div>

    {if $rightSidebarElements > 0}
        {if empty($entry.properties.special_switch) OR $entry.properties.special_switch !== true}
            <div id="serendipityRightSideBar" class="sidebar">
                {serendipity_printSidebar side="right"}
            </div>
        {/if}
    {/if}

        {/if}
    {/if}
{/if}

    </div>

    <div id="footertable">
        <div id="footerLeft">
        {if $template_option.footerpos == "0"}
            {serendipity_printSidebar side="top"}
        {/if}
        {if $template_option.enablefooterl}
            <div id="abstand"></div>
            <h3>{$tab1_cat}</h3>
            {serendipity_fetchPrintEntries category=$template_option.catx1 full=true fetchDrafts=false noSticky=true limit="0,5" template="entries_footer.tpl"}
        {/if}
        </div>

        <div id="footerMid">
        {if $template_option.footerpos == "1"}
            {serendipity_printSidebar side="top"}
        {/if}
        {if $template_option.enablefooterm}
            <div id="abstand"></div>
            <h3>{$tab2_cat}</h3>
            {serendipity_fetchPrintEntries category=$template_option.catx2 full=true fetchDrafts=false noSticky=true limit="0,5" template="entries_footer.tpl"}
        {/if}
        </div>

        <div id="footerRight">
        {if $template_option.footerpos == "2"}
            {serendipity_printSidebar side="top"}
        {/if}
        {if $template_option.enablefooterr}
            <div id="abstand"></div>
            <h3>{$tab3_cat}</h3>
            {serendipity_fetchPrintEntries category=$template_option.catx3 full=true fetchDrafts=false noSticky=true limit="0,5" template="entries_footer.tpl"}
        {/if}
        </div>
    </div>

    <div id="footer">
        <p>S9y Theme <a href="http://www.xkur.de">xkur </a>  - Based on <a href="http://www.carlgalloway.com">Carl </a>and <a href="http://www.cssmenus.co.uk">CSSplay </a></p>
    </div>

</div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
