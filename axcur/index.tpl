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

<div id="wrap">

    <div id="art-page-background-simple-gradient"></div>
    <div id="art-page-background-glare">
        <div id="art-page-background-glare-image"></div>
    </div>
    <div id="art-main">
        <div class="art-Sheet">
            <div class="art-Sheet-tl"></div>
            <div class="art-Sheet-tr"></div>
            <div class="art-Sheet-bl"></div>
            <div class="art-Sheet-br"></div>
            <div class="art-Sheet-tc"></div>
            <div class="art-Sheet-bc"></div>
            <div class="art-Sheet-cl"></div>
            <div class="art-Sheet-cr"></div>
            <div class="art-Sheet-cc"></div>
            <div class="art-Sheet-body">
                <div class="art-Header">
                    <div class="art-Header-png"></div>
                    <div class="art-Header-jpeg"></div>
                    <div class="art-Logo">
                        <h1 id="name-text" class="art-Logo-name"><a href="{$serendipityBaseURL}">{$head_title|truncate:40:" ..."|default:$blogTitle}</a></h1>
                        <div id="slogan-text" class="art-Logo-text"><a href="{$serendipityBaseURL}">{$head_subtitle|default:$blogDescription}</a></div>
                    </div>
                </div>
            {if $template_option.enablehmenue === true}

                <div class="art-nav">
                    <div class="l"></div>
                    <div class="r"></div>
                    <ul class="art-menu">
                        <li>
                            <a href="{$serendipityBaseURL}" class=" active"><span class="l"></span><span class="r"></span>{if $currpage==$serendipityBaseURL}  {/if}><span class="t">{$CONST.HOMEPAGE}</span></a>
                        </li>
                    {foreach $navlinks AS $navlink}

                        <li>
                            <a href="{$navlink.href}"><span class="l"></span><span class="r"></span><span class="t">{$navlink.title}</span></a>
                        {if $navlink.drop != "0"}
                            <ul>
                            {foreach $navlink.dropdownentries AS $sub}
                                <li> <a {if $currpage==$sub.href}class="currentpage" {/if}href="{$sub.href}" title="{$sub.title}" >{$sub.title}</a></li>
                            {/foreach}
                            </ul>
                        {/if}

                        </li>
                    {/foreach}
                    {if $is_logged_in}

                        <li>
                        <a href="#"><span class="l"></span><span class="r"></span><span class="t">{$CONST.EDIT}</span></a>
                            <ul>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=personal">{$CONST.PERSONAL_SETTINGS}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=entries&amp;serendipity[adminAction]=new">{$CONST.ENTRIES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=entries&amp;serendipity[adminAction]=editSelect">{$CONST.EDIT_ENTRIES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=category&amp;serendipity[adminAction]=view">{$CONST.CATEGORIES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=event_display&amp;serendipity[adminAction]=staticpages">{$CONST.PLUGIN_STATICPAGELIST_TITLE_DEFAULT}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=addSelect">{$CONST.ADD_MEDIA}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=media">{$CONST.MEDIA_LIBRARY}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=directorySelect">{$CONST.MANAGE_DIRECTORIES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=media&amp;serendipity[adminAction]=sync">{$CONST.CREATE_THUMBS}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=templates">{$CONST.MANAGE_STYLES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=plugins">{$CONST.CONFIGURE_PLUGINS}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=plugins&amp;serendipity[adminAction]=addnew">+ Sidebar-Plugin</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=plugins&amp;serendipity[adminAction]=addnew&amp;serendipity[type]=event">+ Event-Plugin</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=configuration">{$CONST.CONFIGURATION}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=users">{$CONST.MANAGE_USERS}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=groups">{$CONST.MANAGE_GROUPS}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=import">{$CONST.IMPORT_ENTRIES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=export">{$CONST.EXPORT_ENTRIES}</a></li>
                                <li><a href="{$serendipityBaseURL}serendipity_admin.php?serendipity[adminModule]=logout" rel="gb_page_center[500, 500]">Logout</a></li>
                            </ul>
                        </li>
                    {else}
                        <li>
                            <a href="{$serendipityBaseURL}/serendipity_admin.php"><span class="l"></span><span class="r"></span><span class="t">Login</span></a>
                        </li>
                    {/if}
                    </ul>
                </div><!-- art-nav end -->
            {/if}

                <div class="art-contentLayout">
                    <div class="art-sidebar1">
                        {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
                        {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}

                    </div>
                    <div class="art-content">
                        {$CONTENT}
                    </div><!-- art-content end -->
                </div><!-- art-contentLayout end -->
                <div class="cleared"></div>
                <div class="art-Footer">
                    <div class="art-Footer-inner">
                        <div class="art-Footer-text">
                            <p>
                                {$date|default:''|formatTime:'%Y'} <span class="url fn org">{$blogTitle}</span> |
                                <a href="{$serendipityBaseURL}feeds/index.rss2">{$CONST.ENTRIES}&nbsp;(RSS)</a> | <a href="{$serendipityBaseURL}feeds/comments.rss2">{$CONST.COMMENTS}&nbsp;(RSS)</a> |&nbsp; Theme <a href="http://xcur.de/" title="xcur">xcur</a>
                            </p>
                        </div>
                    </div>
                    <div class="art-Footer-background"></div>
                </div>
            </div><!-- art-Sheet body end -->
        </div><!-- art-Sheet end -->
        <div class="cleared"></div>
        <p class="art-page-footer">&nbsp;</p>
    </div><!-- art-main end -->

</div><!-- wrap end  -->

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
