{if $is_embedded != true}
{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
           "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
           "http://www.w3.org/TR/html4/loose.dtd">
{/if}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<!--

    terrafirma1.0 by nodethirtythree design
    http://www.nodethirtythree.com

-->
<head>
<title>{$head_title|default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="generator" content="Serendipity v.{$serendipityVersion}" />
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
    <link rel="stylesheet" type="text/css" media="screen" href="{$head_link_stylesheet}" />
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
<link rel="stylesheet" type="text/css" href="{serendipity_getFile file="style.css"}" />
{serendipity_hookPlugin hook="frontend_header"}
</head>
<body>

<div id="outer">

    <div id="upbg"></div>

    <div id="inner">

        <div id="header">
            <h1><span>{$head_title|default:$blogTitle|truncate:20:" ...":true}</span></h1>
            <h2>{$head_subtitle|default:$blogDescription}</h2>
        </div>

        <div id="splash"></div>

        <div id="menu">
            <ul>
                <li class="{if $startpage}current_{/if}page_item">
                    <a href="{$serendipityBaseURL}">{$CONST.HOMEPAGE}</a>
                </li>
            {foreach $navlinks AS $navlink}

                 <li class="{if $currpage==$navlink.href}current_{/if}page_item"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
            {/foreach}
            </ul>
            <div id="date">{$smarty.now|date_format:"%B %d, %Y"}</div>
        </div>

        <div id="primarycontent">
            {$CONTENT}
        </div>

        <div id="secondarycontent">
        {if $template_option.about_text_toggle == 'true'}
            <h3>{$template_option.abouttitle}</h3>
            <div class="content">
                <a href="{$template_option.aboutpageurl}"><img src="{$serendipityHTTPPath}templates/{$template}/img/user.jpg" class="picB" alt="" style="border:none;"/></a>
                <p>{$template_option.about} <a href="{$template_option.aboutpageurl}"> {$CONST.MORE} &raquo;</a></p>
            </div>
            {elseif $template_option.about_text_toggle == 'false'}
            {/if}
            {serendipity_printSidebar side="left"}{serendipity_printSidebar side="right"}

        </div>

        <div id="footer">
            Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> | portetd to <a href="http://www.s9y.org">Serendipity</a> by <a href="http://www.taeglichanders.de">taeglichanders.de</a>.
        </div>
    </div>
</div>

</body>
</html>
{/if}
