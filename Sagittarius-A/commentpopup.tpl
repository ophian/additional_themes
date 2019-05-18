<!DOCTYPE html>
<html lang="{$lang}">
<head>
    <meta charset="{$head_charset}">
    <title>{$head_title|default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="generator" content="Serendipity Styx Edition v.{$serendipityVersion}">
    <link rel="stylesheet" type="text/css" href="{$serendipityHTTPPath}serendipity.css.php">
{serendipity_hookPlugin hook="frontend_header"}
</head>

<body id="serendipity_comment_page" class="s9y_wrap">

{if NOT empty($is_comment_added)}
    <div class="popup_comments_message popup_comments_message_added">{$CONST.COMMENT_ADDED}{$comment_string.0}<a href="{$comment_url}">{$comment_string.1}</a>{$comment_string.2}<a href="#" onclick="self.close()">{$comment_string.3}</a>{$comment_string.4}</div>
{elseif NOT empty($is_comment_notadded)}
    <div class="popup_comments_message popup_comments_message_notadded">{$CONST.COMMENT_NOT_ADDED}{$comment_string.0}<a href="{$comment_url}">{$comment_string.1}</a>{$comment_string.2}<a href="#" onclick="self.close()">{$comment_string.3}</a>{$comment_string.4}</div>
{elseif NOT empty($is_comment_empty)}
    <div class="popup_comments_message popup_comments_message_empty">{$comment_string.0}<a href="#" onclick="history.go(-1)">{$comment_string.1}</a>{$comment_string.2}</div>
{elseif NOT empty($is_showtrackbacks)}
    <h3 id="trackbacks">{$entry.trackbacks} {$CONST.TRACKBACKS}</h3>
    <dl>
        <dt><strong>{$CONST.TRACKBACK_SPECIFIC}:</strong></dt>
        <dd><a rel="nofollow" href="{$comment_url}">{$comment_url}</a></dd>

        <dt><strong>{$CONST.DIRECT_LINK}:</strong></dt>
        <dd><a href="{$comment_entryurl}">{$comment_entryurl}</a></dd>
    </dl>

    {serendipity_printTrackbacks entry=$entry_id}

    <br>

{elseif $is_showcomments}
    <h3 id="comments">{$entry.comments} {$CONST.COMMENTS}</h3>

    {serendipity_printComments entry=$entry_id}

    {if $is_comment_allowed}
        <h3 id="respond">{$CONST.ADD_COMMENT}</h3>
        {$COMMENTFORM}
    {else}
        <br>
        <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>
    {/if}

{/if}
{serendipity_hookPlugin hook="frontend_footer"}
</body>
</html>
