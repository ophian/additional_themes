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
{if ($view == "entry")}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if ($view == "start")}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
    <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate" type="application/x.atom+xml" title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="trackback" type="application/x-www-form-urlencoded" href="{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry_id}">
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
<!-- Converted to Serendipity by Carl Galloway [http://www.carlgalloway.com] -->
{if $template_option.colorset == 'white'}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="white.css"}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $template_option.date_format == 'ddmmyyyy'}{assign var="HEMINGWAY_DATE" value=HEMINGWAY_DATE_DDMMYYYY}{else}{assign var="HEMINGWAY_DATE" value=HEMINGWAY_DATE_MMDDYYYY}{/if}
{if $is_raw_mode != true}

    <div id="header">
        <div class="inside">
            <div id="search">
                <form method="get" id="searchform" action="{$serendipityBaseURL}"><input type="hidden" name="serendipity[action]" value="search">
                     <div class="searchimg"></div>
                    <input type="text" id="serendipityQuickSearchTermField" name="serendipity[searchTerm]" size="15">
                </form>
            </div>

            <h2><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:35:" ...":true}</a></h2>
            <p class="description">{$head_subtitle|default:$blogDescription}</p>
        </div>
    </div>
{if $view == "entry" OR NOT empty($staticpage_pagetitle)}

    <div id="primary" class="single-post">
        <div class="inside"><!-- entries_single.tpl -->
            {include file="./entries_single.tpl"}
        </div>
        <div class="clear"></div>
    </div>
{elseif $view == "start"}

    <div id="primary" class="twocol-stories">
        <div class="inside">
             <!-- StartPage Begins -->
            {if $template_option.startpage_option == 'true'}
                {include file="./entries_startpage.tpl"}
            {elseif $template_option.startpage_option == 'false'}
                {serendipity_fetchPrintEntries limit="0,2" use_hooks=0 skip_smarty_hooks=true noSticky=false template="entries_latest.tpl"}
            {/if}
            <!-- StartPage Ends -->
        </div>
        <div class="clear"></div>
    </div>
{elseif $view == "search"}

    <div id="primary" class="single-post">
        <div class="inside"><!-- search.tpl -->
            {if isset($searchresult_results)}
            {assign var="searchtitle" value=$CONST.YOUR_RESULTS}
            {elseif isset($searchresult_tooShort)}
            {assign var="searchtitle" value=$CONST.OOPS_RESULTS}
            {elseif isset($searchresult_noEntries)}
            {assign var="searchtitle" value=$CONST.NONE_RESULTS}
            {/if}
            {include file="./search.tpl"}
            <div class="secondary">
                <h2>{$CONST.QUICKSEARCH}</h2>
            {if isset($content_message)}
                <div class="featured">
                <p>{$content_message}</p>
                </div>
            {/if}
            </div>
        </div>
        <div class="clear"></div>
    </div>
{elseif $view == "404"}

    <div id="primary" class="single-post">
        <div class="inside"><!-- 404.tpl -->
            {include file="./404.tpl"}
        </div>
        <div class="clear"></div>
    </div>
{else}

    <div id="primary" class="single-post">
        <div class="inside"><!-- entries.tpl -->
            {$CONTENT}
        </div>
        <div class="clear"></div>
    </div>
{/if}

    <hr class="hide">
    <div id="ancillary">
        <div class="inside">
            <div class="block first">
                {serendipity_printSidebar side="left"}
            </div>
            <div class="block">
                {serendipity_printSidebar side="middle"}
            </div>
            <div class="block">
                {serendipity_printSidebar side="right"}
            </div>
        <div class="clear"></div>
        </div>
    </div>

    <hr class="hide">
    <div id="footer">
        <div class="inside">
            <p class="copyright">
            </p>
        </div>
    </div>

{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
