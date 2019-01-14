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
    <meta name="robots" content="index,follow">
{else}
    <meta name="robots" content="noindex,follow">
{/if}
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if in_array($view, ['start', 'entries'])}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
    {if $entry_id} <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}

{if $is_raw_mode != true}
<div id="container" class="group">
    <div id="rlmenuefr">
        <div id="rlmenue">
            <ul>
                <li><a href="{$serendipityBaseURL}index.php">Home</a></li>
            {if NOT empty($template_option.enablecat)}
                <li><a href="#">{$CONST.CATEGORY}</a> <ul> {serendipity_showPlugin class="serendipity_categories_plugin"}</ul></li>
            {/if}
            {if NOT empty($template_option.enablearch)}
                <li><a href="#">{$CONST.ARCHIVES}</a> {serendipity_showPlugin class="serendipity_archives_plugin"}</li>
            {/if}
            {if NOT empty($template_option.enablestat)}
                <li><a href="#">{$template_option.statheader} </a><ul>{serendipity_showPlugin class="serendipity_plugin_staticpage"}</ul></li>
            {/if}
            {if NOT empty($template_option.enableuser)}
                <li><a href="#">{$template_option.dropheader} </a> <ul>{foreach $droplinks AS $droplink}<li><a href="{$droplink.href}" title="{$droplink.title}">{$droplink.title}</a></li>{/foreach}</ul></li>
            {/if}

            {if NOT empty($template_option.enablelog)}
            {if $is_logged_in}

                <li><a href="#">{$CONST.EDIT} </a>
                    <ul>
{*                        <li><a href="#">{$CONST.CONTENT}</a></li>*}
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=personal">{$CONST.PERSONAL_SETTINGS}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=entries&amp;serendipity[adminAction]=new">{$CONST.NEW_ENTRY}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=entries&amp;serendipity[adminAction]=editSelect">{$CONST.EDIT_ENTRIES}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=category&amp;serendipity[adminAction]=view">{$CONST.CATEGORIES}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=event_display&amp;serendipity[adminAction]=staticpages">{$CONST.PLUGIN_STATICPAGELIST_TITLE_DEFAULT}</a></li>
{*                        <li><a href="#">{$CONST.MEDIA}</a></li>*}
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=addSelect">{$CONST.ADD_MEDIA}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=media">{$CONST.MEDIA_LIBRARY}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=directorySelect">{$CONST.MANAGE_DIRECTORIES}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=sync">{$CONST.CREATE_THUMBS}</a></li>
{*                        <li><a href="#">{$CONST.MENU_ACTIVITY}</a></li>*}
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=templates">{$CONST.MANAGE_STYLES}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=plugins">{$CONST.CONFIGURE_PLUGINS}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=plugins&amp;serendipity[adminAction]=addnew"> + Sidebar-Plugin </a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=plugins&amp;serendipity[adminAction]=addnew&amp;serendipity[type]=event">+ Event-Plugin</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=maintenance">{$CONST.MENU_MAINTENANCE}</a></li>
{*                        <li><a href="#">{$CONST.MENU_SETTINGS}</a></li>*}
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=configuration">{$CONST.CONFIGURATION}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=users">{$CONST.MANAGE_USERS}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=groups"> {$CONST.MANAGE_GROUPS}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=import">{$CONST.IMPORT_ENTRIES}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=export">{$CONST.EXPORT_ENTRIES}</a></li>
                        <li><a href="{$serendipityBaseURL}/serendipity_admin.php?serendipity[adminModule]=logout" rel="gb_page_center[500, 500]">Logout</a></li>
                    </ul>
                </li>

            {else}
                <li><a href="{$serendipityBaseURL}/serendipity_admin.php" >Login</a></li>
            {/if}
        {/if}

        {foreach $navlinks AS $navlink}
            {* if $navlink@iteration > 4}{break}{/if *}
                <li{if $currpage==$navlink.href} class="current_page_item"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
        {/foreach}
            </ul>
        </div>
    </div>

    <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>

    <div id="cl1">
        <b>{if $startpage}{$CONST.HOMEPAGE}{else}{$CONST.HOMEPAGE}{/if}<br/>
            {if ($head_title && empty($entry.title)) || (isset($entry.title) AND $head_title != $entry.title)}
            {if isset($entry.title)}&raquo; {$category_info.category_name|default:''}{/if}
            {elseif $head_title && isset($entry.title)}
            {if isset($category_info.category_name)}
            &raquo; {$category_info.category_name}
            {/if}
            {if $entry.title == $head_title}
            &raquo; {$entry.title|truncate:28:" ...":true}
            {/if}
            {elseif $head_subtitle}
            &raquo;
            {/if}
            {if NOT empty($staticpage_pagetitle) && empty($entry.title)}
            &raquo; {$staticpage_headline}
            {/if}
        </b>
    </div>
    <div id="cm1"> &nbsp;
        <a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a>
    </div>
   {if isset($plugin_calendar_head) AND is_array($plugin_calendar_head)}
   <div id="cr1">
        <strong><a style="white-space: nowrap" href="{$plugin_calendar_head.uri_month}/">{$plugin_calendar_head.month_date|formatTime:"%B '%y":false}</a></strong>
    </div><br/>
    {/if}

    <div id="navbar">
        <ul>
            <li class="selected">{if $template_option.wppddd == true}{$template_option.addvtext}{/if}</li>
        </ul>
        <form id="searchform" action="{$serendipityBaseURL}" method="get"><input type="hidden" name="serendipity[action]" value="search" /><input alt="Quicksearch" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onFocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onBlur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';"></input></form>
    </div><!-- /#navbar -->

    <br/> <br/>

    <div id="content" class="group">
        {$CONTENT}
    </div><!-- /#content -->

    <div id="sidebar">
        {if $leftSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="right"}
        {/if}
    </div><!-- /#sidebar -->

</div><!-- /#container -->

<div id="footer">
    <p><span lang="en">Powered by <a href="https://ophian.github.io/">Serendipity Styx Edition</a> &amp; the <i>{$template}</i> theme.</span></p>{* <p>Template: <a href="http://www.plus9.de/index.php">Plus9</a></p>*}
</div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
