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

    <div id="container">
        <div id="header">
            <div id="serendipity_banner">
                <h1><a class="homelink1" href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
                <h2><a class="homelink2" href="{$serendipityBaseURL}">{$blogDescription}</a></h2>
            </div>
            <div id="search">
                <form action="{$serendipityBaseURL}" method="get">
                    <input type="hidden"  name="serendipity[action]" value="search">
                    <span id="QuickSearchTermFieldOut"><input alt="Quicksearch" type="text" id="QuickSearchTermField" name="serendipity[searchTerm]" size="13"></span>
                    <input type="image" src="{serendipity_getFile file="img/search_submit.gif"}" id="search-submit" value="OK">
                </form>
            </div>
        </div>
        <div id="nav">
            <ul>
                <li{if empty($staticpage_pagetitle)} id="active"{/if}><a href="{$serendipityBaseURL}" title="Home">Home<span class="tab-l"></span><span class="tab-r"></span></a></li>
            {foreach $navlinks AS $navlink}
                <li{if isset($staticpage_pagetitle) AND $staticpage_pagetitle == $template_option.navlink4text} id="active"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
            {/foreach}
            </ul>
            <div class="clearer"><span></span></div>
        </div>
        <div id="main">
            <div id="main_in">
                <div id="left">
                    <div id="content">
{$CONTENT}

                    </div>
                </div>
                <div id="right">
                    <div id="right_in">
{if $rightSidebarElements > 0}
                        <div id="serendipityRightSideBar">
{serendipity_printSidebar side="right"}

{serendipity_printSidebar side="left"}

                        </div>
{/if}
                    </div>
                    <div class="clearer"><span></span></div>
                </div>
            </div>
        </div>

        <div id="footer">
            <div id="top" class="noprint"><p><span class="noscreen">Back on top</span> <a href="#header" title="Back on top ^">^<span></span></a></p></div>
            <div id="bottom">
                <p>Template: <a href="http://www.nuvio.cz/">Nuvio</a> Colors: <a href="http://www.oswd.org/user/profile/id/21158">kendahlin</a> Port: <a href="http://www.hungryhacker.com">fwaggle</a> &amp; <a href="http://www.infectedloser.com">Sabriena</a></p>

                <div class="clearer"><span></span></div>
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
