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
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" media="all">

    {if $template_option.fonts == 'times'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/times.css">
    {elseif $template_option.fonts == 'bitstream_vera_sans'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/bitstream_vera_sans.css">
    {elseif $template_option.fonts == 'bitstream_vera_serif'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/bitstream_vera_serif.css">
    {elseif $template_option.fonts == 'georgia'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/georgia.css">
    {elseif $template_option.fonts == 'courier'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/courier.css">
    {elseif $template_option.fonts == 'trebuchet'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/trebuchet.css">
    {elseif $template_option.fonts == 'verdana'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/verdana.css">
    {elseif $template_option.fonts == 'arial'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/arial.css">
    {elseif $template_option.fonts == 'helvetica'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/helvetica.css">
    {elseif $template_option.fonts == 'tahoma'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/fontsets/tahoma.css">
    {/if}

    {if $template_option.style == 'aqua'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/style/aqua.css">
    {elseif $template_option.style == 'oldskool'}
    <link rel="stylesheet" href="{$serendipityBaseURL}templates/{$template}/style/oldskool.css">
    {/if}

    <link rel="home" title="startpage" href="{$serendipityBaseURL}">
    <link rel="archive" title="entries archive" href="{$serendipityBaseURL}archive">
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">

{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
<div><a name="top" id="top"></a></div>
    <div id="header">
    {if $template_option.style == 'aqua'}
        <h1><a href="{$serendipityBaseURL}"><img src="{$serendipityBaseURL}templates/{$template}/img/header.png" alt="{$blogTitle}" /></a><span>{$head_title|default:$blogTitle} {if $head_subtitle AND  $view != 'plugin'} - {$head_subtitle}{/if}</span></h1>
    {elseif $template_option.style == 'oldskool'}
        <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle} {if $head_subtitle AND  $view != 'plugin'} - {$head_subtitle}{/if}</a></h1>
    {/if}
        <div class="description">{$blogDescription}</div>
    </div>

<div id="column-wrap" class="clearfix">
    <div id="content"{if $view == 'comments'} class="paged_comments"{/if}> <!-- start content -->
    {$CONTENT}
    </div> <!-- close content -->
{if $view != 'comments'}
    <div id="sidebar1"> <!-- start sidebar1 -->
        <div class="sidebar">
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="left"}
        {/if}

        </div>
    </div> <!-- close sidebar1 -->

    <div id="sidebar2"> <!-- start sidebar2 -->
        <div id="rssicon">
        {if $template_option.style == 'aqua'}
            <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2"><img class="centered" src="{$serendipityBaseURL}templates/{$template}/img/rssicon.png" alt="RSS-Feed" title="RSS-Feed" /></a>
        {elseif $template_option.style == 'oldskool'}
            <a href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2"><img class="centered" src="{$serendipityBaseURL}templates/{$template}/img/rssicon-oldskool.png" alt="RSS-Feed" title="RSS-Feed" /></a>
        {/if}

        </div>

        <div class="sidebar">
        {if $rightSidebarElements > 0}
            {serendipity_printSidebar side="right"}
        {/if}
        </div>
    </div> <!-- close sidebar2 -->
{/if}

</div> <!-- close column-wrap -->

<div id="footer"{if $view == 'comments'} class="paged_comments"{/if}>
    <a href="#top"><img src="{$serendipityBaseURL}/templates/{$template}/img/up.png" alt="hoch / up" title="hoch / up" /></a> {$CONST.PROUDLY_POWERED_BY} <a href="https://ophian.github.io/">Serendipity Styx Edition</a> &amp; the <i>{$template}</i> theme.<br>Style is <a href="http://alp-uckan.net/free/s9y/style-adapation/">adaptation 0.8</a> by <a href="http://alp-uckan.net">Alp Uçkan</a>
</div>
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
