{if $ajax!=1}
<?xml version="1.0" encoding="{$head_charset}"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
         "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>{$head_title|default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
        <meta name="generator" content="Serendipity IPhone Output - http://c.seo-mobile.de/"/>
    {if in_array($view, ['start', 'entries', 'entry', 'feed', 'plugin']) OR NOT empty($staticpage_pagetitle) OR (isset($robots_index) AND $robots_index == 'index')}
        <meta name="robots" content="index,follow" />
    {else}
        <meta name="robots" content="noindex,follow" />
    {/if}
    {if ($view == "entry")}
        <link rel="canonical" href="{$entry.rdf_ident}" />
    {/if}
    {if ($view == "start")}
        <link rel="canonical" href="{$serendipityBaseURL}" />
    {/if}
        <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
        <script type="application/x-javascript" src="{serendipity_getFile file="iui.js"}"></script>
            <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}"/>
    </head>
    <body>

        <!-- {$debug} -->

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
            {if $categories}
                        <li><a class="blue" href="#categories">{$CONST.CATEGORIES}</a></li>
            {/if}
            <li><a class="small" href="http://c.seo-mobile.de/">Serendipity Mobile Output Plugin</a></li>
            </ul>
        {/if}

        {if $is_single_entry}
            <div title="{$head_title}" id="content">
            {if $debug}
                <div>{$debug}</div>
            {/if}
            {$CONTENT}
            </div>
        {/if}


        {if $categories}
            <ul title="{$CONST.CATEGORIES}" id="categories">
                {foreach $categories AS $plugin_category}
                        <li><a href="{$plugin_category.categoryURL}" target="_ajax">{$plugin_category.category_name|escape}</a></li>
                    {/foreach}
            </ul>
        {/if}

{if $ajax!=1}
    </body>
</html>
{/if}
