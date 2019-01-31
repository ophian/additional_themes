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
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}

{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
    <div id="bg">
        <div id="wrap">
            <div id="banner">
                <div id="identity">
                    <h1><a href="{$serendipityBaseURL}">{$head_title|default:$blogTitle|truncate:60:" ..."}</a></h1>
                    <h2><a href="{$serendipityBaseURL}">{if $view == 'plugin'}{$blogDescription}{else}{$head_subtitle|default:$blogDescription}{/if}</a></h2>
                </div>
                <div id="about-snippet">
                    <p>{$template_option.about} <a href="{$template_option.aboutpageurl}"> More &raquo;</a></p>
                </div>
            </div>
            <div id="mainpane">
                <div id="content">
                    {$CONTENT}
                </div>
                <div id="leftcolumn">
                    <div id="sidebar">
                        {serendipity_printSidebar side="right"}{serendipity_printSidebar side="left"}
                    </div>
                    <div id="clearingdiv">&nbsp;</div>
                </div>
                <div id="footer">
                    <p><a href="{$template_option.navlink1url}" title="{$template_option.navlink1text}">{$template_option.navlink1text}</a> | <a href="{$template_option.navlink2url}" title="{$template_option.navlink2text}">{$template_option.navlink2text}</a> | <a href="{$serendipityBaseURL}serendipity_admin.php">{if $is_logged_in}Admin Suite{else}Login{/if}</a> | Design by <a href="http://www.carlgalloway.com">ceejay</a></p>
                </div>
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
