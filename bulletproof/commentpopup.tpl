{if $is_xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
{/if}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>
   <title>{$head_title|default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
   <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
   <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}" />
   <!-- base styles needed for bulletproof -->
   <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="base.css"}" />
   <!-- style.css -->
   <link rel="stylesheet" type="text/css" href="{$serendipityHTTPPath}serendipity.css.php" />
   <!--[if IE 6]>
   <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie6.css"}" />
   <![endif]-->
   <!--[if IE 7]>
   <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie7.css"}" />
   <![endif]-->
   <!-- additional colorset stylesheet -->
   <link rel="stylesheet" type="text/css" href="{$serendipityHTTPPath}templates/{$template}/{$template_option.colorset}_style.css" />
   <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
   <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body id="serendipity_comment_page" class="s9y_wrap">
{if NOT empty($is_comment_added)}
    <div class="popup_comments_message popup_comments_message_added">{$CONST.COMMENT_ADDED|sprintf:"<a href=\"{if $is_logged_in AND isset($commentform_action)}{$commentform_action}{/if}#c{$smarty.get.last_insert_cid|default:''}\">#{$smarty.get.last_insert_cid|default:''}</a> "}{$comment_string.0}<a href="{$comment_url}">{$comment_string.1}</a>{$comment_string.2}<a href="#" onclick="self.close()">{$comment_string.3}</a>{$comment_string.4}</div>
{elseif NOT empty($is_comment_notadded)}
    <div class="popup_comments_message popup_comments_message_notadded">{$CONST.COMMENT_NOT_ADDED}{$comment_string.0}<a href="{$comment_url}">{$comment_string.1}</a>{$comment_string.2}<a href="#" onclick="self.close()">{$comment_string.3}</a>{$comment_string.4}</div>
{elseif NOT empty($is_comment_empty)}
    <div class="popup_comments_message popup_comments_message_empty">{$comment_string.0}<a href="#" onclick="history.go(-1)">{$comment_string.1}</a>{$comment_string.2}</div>
{elseif NOT empty($is_showtrackbacks)}
    <div class="serendipity_commentsTitle">{$CONST.TRACKBACKS}</div>
    <dl>
        <dt><strong>{$CONST.TRACKBACK_SPECIFIC}:</strong></dt>
        <dd><a rel="nofollow" href="{$comment_url}">{$comment_url}</a></dd>
        <dt><strong>{$CONST.DIRECT_LINK}:</strong></dt>
        <dd><a href="{$comment_entryurl}">{$comment_entryurl}</a></dd>
    </dl>
    {serendipity_printTrackbacks entry=$entry_id}
    <br>
{elseif $is_showcomments}
    <div class="serendipity_commentsTitle">{$CONST.COMMENTS}</div>
    {serendipity_printComments entry=$entry_id}
    {* NO popup viewmode possible without assigning/scoping entry array or assigning these variables singularly *}

    {if $is_comment_allowed}
        <div class="serendipity_commentsTitle">{$CONST.ADD_COMMENT}</div>
        {$COMMENTFORM}
    {else}
        <br>
        <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>
    {/if}
{/if}
{serendipity_hookPlugin hook="frontend_footer"}
</body>
</html>
