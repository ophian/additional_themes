{foreach $comments AS $comment}
    <li class="{if $comment@iteration is odd}graybox{/if}" style="margin-left: {$comment.depth*2}em">
    <a id="c{$comment.id}"></a>

        {if $comment.body == 'COMMENT_DELETED'}
        <p>{$CONST.COMMENT_IS_DELETED}</p>
        {else}
        <p><cite>{if $comment.url}
                <a href="{$comment.url}">{$comment.author|default:$CONST.ANONYMOUS}:</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}:
            {/if}</cite> {$comment.body}</p>
        {/if}
        <div class="commentmetadata" id="serendipity_comment_{$comment.id}">
            <a href="#c{$comment.id}" title="{$CONST.LINK_TO_COMMENT|sprintf:$comment.trace}">#{$comment.trace}</a>
            {$comment.timestamp|formatTime:$CONST.DATE_FORMAT_SHORT}
            {if $entry.is_entry_owner}
                (<a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
            {/if}
            {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                (<a href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)
                <div id="serendipity_replyform_{$comment.id}"></div>
            {/if}
        </div>
    </li>
{foreachelse}
    <li class="nocomments">{$CONST.NO_COMMENTS}</li>
{/foreach}
