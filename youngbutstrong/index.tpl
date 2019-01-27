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
{if $view == 'entry' AND isset($entry)}
    <link rel="canonical" href="{$entry.rdf_ident}">
{/if}
{if in_array($view, ['start', 'entries'])}
    <link rel="canonical" href="{$serendipityBaseURL}">
{/if}
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}">
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2">
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml">
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}">
{/if}
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
    <div id="container">
        <div id="logo">
            <h1><a href="{$serendipityBaseURL}"><span>{$head_title|default:$blogTitle}</span></a></h1>
        </div>
        <div id="ad_space">&nbsp;</div>
        <div id="top"></div>
        <div id="content">
            <div id="left">
                {$CONTENT}
            </div>
            {if $rightSidebarElements > 0}
            <div id="right">
                {serendipity_printSidebar side="right"}
            </div>
            {/if}
        </div><!-- //content end -->
        <div id="footer"></div>
    </div>
<!--
This Theme is free to use, but you are _not_ allowed to remove
the Sponsored Links in the Footer !
If you remove them, you are not allowed to use this Theme anymore,
you have to remove it then from your Blog !
// -->
        <div id="footer_sponsors" rel="nofollow">
            Wordpress Template by <a href="http://www.fachwissen-katalog.de" title="Artikelverzeichnis" target="_blank">Artikelverzeichnis</a> |
            Ported by <a href="http://www.hungryhacker.com/">fwaggle</a> and <a href="http://www.infectedloser.com/">sabriena</a>
        </div>
<!--
This Theme is free to use, but you are _not_ allowed to remove
the Sponsored Links in the Footer !
If you remove them, you are not allowed to use this Theme anymore,
you have to remove it then from your Blog !
// -->

{if $is_embedded != true}
</body>
</html>
{/if}
