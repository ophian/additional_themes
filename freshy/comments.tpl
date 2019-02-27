{* This template currently does not support all Serendipity Styx comment features since tweaked selector naming and more [see default/comments.tpl] *}
<dl class="commentlist">
{foreach $comments AS $comment}
    <dt class="{if $entry.author == $comment.author}author_comment{else}none{/if}" >
    <small class="date">
        <span class="date_day">{$comment.timestamp|formatTime:'%d'}</span>
        <span class="date_month">{$comment.timestamp|formatTime:'%m'}</span>
        <span class="date_year">{$comment.timestamp|formatTime:'%Y'}</span>
    </small>
    </dt>   
    <dd id="comment-{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename} {if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email}author_comment{else}none{/if} {cycle values="alt, "}"{if $comment.depth > 0} style="padding-left: {$comment.depth*20}{***}px"{/if}>
        <div class="comment">
            <a class="comment_source_trace" href="#c{$comment.id}">#{$comment.trace}</a>
            <strong class="author">
            {if $comment.url}
                <a href="{$comment.url}" title="{$comment.url|escape}">{$comment.author|default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}
            {/if}
            </strong>

        {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
            (<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
        {/if}
        {if isset($comment.id) AND isset($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
            (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
            <div id="serendipity_replyform_{$comment.id}"></div>
        {/if}
            <br style="display:none;"/>
            <div class="comment_text">
                {$comment.body}
            </div>
        </div>
    </dd>
{foreachelse}
   <dt> {$CONST.NO_COMMENTS}</dt>
{/foreach}
</dl>