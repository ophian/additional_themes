{if $is_embedded != true}
<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <!-- this product is released under General Public License. Please see the attached file for details.  -->
    <!-- You can also find details about the license at http://www.opensource.org/licenses/gpl-license.php -->
    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
    <script type="text/javascript" src="{serendipity_getFile file="js/sfhover.js"}"></script>
    <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
    <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{if $entry_id}
    <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
{/if}
    <link rel="index" title="{$blogTitle}" href="{$serendipityBaseURL}" />
    {serendipity_hookPlugin hook="frontend_header"}
</head>
<body>
{else}
{serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}
<div id="wrapper">
    <div id="header">
        <div id="topright">
            <ul>
                <li><a href="#searchform">{$CONST.QUICKSEARCH}</a></li>
                <li><a href="#main">{$CONST.PIX_TOCONTENT} &darr;</a></li>
            </ul>
        </div><!-- /#topright -->

        <div class="cleared"></div>

        <div id="logo">
            <h1><a href="{$serendipityBaseURL}">{$blogTitle}</a></h1>
            <span>{$blogDescription}</span>
        </div><!-- /#logo -->
    </div><!-- /#header -->

    <div id="catnav">
        <div id="toprss">
            <a href="{if $template_option.myfeedname != ''}http://feeds.feedburner.com/{$template_option.myfeedname}{else}{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2{/if}">
                <img src="{$serendipityHTTPPath}templates/{$template}/img/rss-trans.png" alt="{$blogTitle}" width="65" height="24" />
            </a>
        </div><!-- /#toprss -->

        <ul id="nav">
            <li lang="en">{if $currpage==$serendipityBaseURL or $currpage2==$serendipityBaseURL}<strong>{else}<a href="{$serendipityBaseURL}">{/if}Home{if $currpage==$serendipityBaseURL or $currpage2==$serendipityBaseURL}</strong>{else}</a>{/if}</li>
            {foreach $navlinks AS $navlink}
            <li>{if $currpage==$navlink.href or $currpage2==$navlink.href}<strong>{else}<a href="{$navlink.href}">{/if}{$navlink.title}{if $currpage==$navlink.href or $currpage2==$navlink.href}</strong>{else}</a>{/if}</li>
            {/foreach}
        </ul>
    </div><!-- /#catnav -->

    <div class="cleared"></div>

    <div id="main">
        <div id="contentwrapper">
        {if $view == '404'}
            <div class="topPost">
                <h2 class="topTitle">{$CONST.PIX_NFTITLE}</h2>

                <div class="topContent">
                    <p>{$CONST.PIX_NFTEXT} <a href="#searchform">{$CONST.QUICKSEARCH}</a> &darr;</p>
                </div>
            </div>
        {else}
            {$CONTENT}
        {/if}
        </div><!-- /#contentwrapper -->

        <div id="sidebars">
            <div id="sidebar_full">
                <ul>
                {if $template_option.showwelcome === true or $template_option.myfeedname != ''}
                    <li><div id="welcome">
                    {if $template_option.showwelcome === true}
                        {if $template_option.welcometitle != ''}
                        <h2>{$template_option.welcometitle}</h2>
                        {/if}
                        {if $template_option.welcometext != ''}
                        <p>{$template_option.welcometext}</p>
                        {/if}
                    {/if}
                    {if $template_option.myfeedname != ''}
                        <p>{$CONST.PIX_SUBMAIL}:</p>

                        <form action="http://feedburner.google.com/fb/a/mailverify" method="post" target='popupwindow' onsubmit=\"window.open('http://feedburner.google.com/fb/a/mailverify?uri={$template_option.myfeedname}', 'popupwindow', 'scrollbars=yes,width=550,height=520');return true\">
                        <p>
                            <input type="text" name="email" id="feedbox" />
                            <input type="hidden" value="{$template_option.myfeedname}" name="uri" />
                            <input type="hidden" name="loc" value="en_US" />
                            <input type="submit" value="Subscribe" class="submitbutton" />
                        </p>
                        </form>
                    {/if}
                    </div><!-- /#welcome -->
                    </li>
                {/if}
                    {if $topSidebarElements > 0}{serendipity_printSidebar side="top" template="topbar.tpl"}{/if}
                </ul>
            </div>

            <div id="sidebar_left">
            {if $leftSidebarElements > 0}{serendipity_printSidebar side="left"}{/if}
            </div>

            <div id="sidebar_right">
            {if $rightSidebarElements > 0}{serendipity_printSidebar side="right"}{/if}
            </div>
        </div><!-- /#sidebars -->

        <div class="cleared"></div>
    </div><!-- /#main -->

    <div id="morefoot">
        <div class="col1">
            <h3>{$CONST.QUICKSEARCH}</h3>

            <p>{$CONST.SEARCH_FOR_ENTRY} {$CONST.IN} {$blogTitle}:</p>

            <form method="get" id="searchform" action="{$serendipityHTTPPath}{$serendipityIndexFile}">
            <div><input type="hidden" name="serendipity[action]" value="search" /></div>
            <p>
                <input type="text" value="" id="searchbox" name="serendipity[searchTerm]" />
                <input type="submit" class="submitbutton" value="{$CONST.GO}" name="serendipity[searchButton]" />
            </p>
            </form>
            {serendipity_hookPlugin hook="quicksearch_plugin" hookAll="true"}

            <p>{$CONST.PIX_SEARCHHINT}</p>
        </div>

        {if $botSidebarElements > 0}{serendipity_printSidebar side="bot" template="botbar.tpl"}{/if}

        <div class="cleared"></div>
    </div><!-- /#morefoot -->

    <div id="footer">
        <div id="footerleft">
            <p>powered by Serendipity Styx and brought to you by <a href="http://www.serendipity-templates.org">http://www.serendipity-templates.org</a>. <a href="#main">Back to top &uarr;</a></p>
        </div><!-- /#footerleft -->

        <div id="footerright">
            <a href="https://ophian.github.io/" title="Serendipity PHP Weblog/Blog software">Serendipity Styx Edition <img src="{$serendipityHTTPPath}templates/{$template}/img/footer-trans.png" alt="Serendipity" width="34" height="34" /></a>
        </div><!-- /#footerright -->

        <div class="cleared"></div>
    </div><!-- /#footer -->
</div><!-- /#wrapper -->
{/if}
{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
</body>
</html>
{/if}
