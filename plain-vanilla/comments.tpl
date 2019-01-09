{foreach $comments AS $comment}
    <a id="c{$comment.id}"></a>
    <li class="{if $comment@iteration is odd}graybox{/if}" style="margin-left: {$comment.depth*20}px">
        <cite>{if $comment.url}
                <a href="{$comment.url}" target="_blank">{$comment.author|default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}
            {/if}</cite> {$CONST.SAYS}:<br />
        <small id="serendipity_comment_{$comment.id}" class="commentmetadata">
            <a href="#c{$comment.id}" title="{$CONST.LINK_TO_COMMENT|sprintf:$comment.trace}">#{$comment.trace}</a>
            {$comment.timestamp|formatTime:$CONST.DATE_FORMAT_SHORT}
            {if $entry.is_entry_owner}
                (<a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
            {/if}
            {if $entry.allow_comments}
                (<a href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)
                <div id="serendipity_replyform_{$comment.id}"></div>
            {/if}
        </small>
        <p>{$comment.body}</p>
    </li>
{foreachelse}
    <p class="nocomments">{$CONST.NO_COMMENTS}</p>
{/foreach}
