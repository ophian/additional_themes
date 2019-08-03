{if empty($ajax)}
{* <?xml version="1.0" encoding="{$head_charset}"?> *}
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <title>{$head_title|default:$blogTitle}{if $head_subtitle} | {$head_subtitle}{/if}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
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

{*    <script type="application/x-javascript" src="{serendipity_getFile file="iui.js"}"></script> *}
  <link rel="stylesheet" title="Default" href="{serendipity_getFile file="iui/t/default/default-theme.css"}" type="text/css"/>
  <script type="application/x-javascript" src="{serendipity_getFile file="iui/iui.js"}"></script>
</head>

<body>

    <div class="toolbar">
        <h1 id="pageTitle">{$head_title|default:$blogTitle}</h1>
        <a id="backButton" class="button" href="#">{$CONST.BACK}</a>
        <a href="{$serendipityBaseURL}"><img src="{serendipity_getFile file="img/s9y_banner.png"}" id="s9y_banner"/></a>
    </div>
{/if}

{if !$is_single_entry}
    <ul id="home" title="{$blogTitle}" selected="true">
        {$CONTENT}
    {if $footer_prev_page}
        <li><a class="blue" href="{$footer_prev_page}" target="_ajax">{$CONST.PREVIOUS_PAGE}</a></li>
    {/if}
    {if $footer_next_page}
        <li><a class="blue" href="{$footer_next_page}" target="_ajax">{$CONST.NEXT_PAGE}</a></li>
    {/if}
{if NOT empty($categories)}
        <li><a class="blue" href="#categories">{$CONST.CATEGORIES}</a></li>
{/if}
    </ul>
{/if}

{if $is_single_entry}
    <div title="{$head_title}" id="content">
    {if NOT empty($debug)}
        <div>{$debug}</div>
    {/if}
    {$CONTENT}
{/if}


{if NOT empty($categories)}
    <ul id="categories" title="{$CONST.CATEGORIES}">
    {foreach $categories AS $plugin_category}
        <li><a href="{$plugin_category.categoryURL}" target="_ajax">{$plugin_category.category_name|escape}</a></li>
    {/foreach}
    </ul>
{/if}

{if empty($ajax)}
</body>
</html>
{/if}
