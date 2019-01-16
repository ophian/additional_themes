{foreach $comments AS $comment}
    <a id="c{$comment.id|default:0}}"></a>
    <div id="serendipity_comment_{$comment.id|default:0}}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if} {cycle values="comment_oddbox,comment_evenbox"}"{if $comment.depth > 0} style="padding-left: {$comment.depth*20}px"{/if}>
        <div class="serendipity_commentBody">{$comment.body}</div>
        <div class="serendipity_comment_source">
            <a href="#c{$comment.id}" title="Link to comment #{$comment.trace}">#{$comment.trace}</a>
            {if $comment.email}
                <a href="mailto:{$comment.email}">{$comment.author|default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}
            {/if}
            {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND isset($entry) AND $entry.email == $comment.clear_email} <span class="pc-owner">Post author</span> {/if}
            {if $comment.url}
                (<a href="{$comment.url}" title="{$comment.url|escape}">Link</a>)
            {/if}
            {$CONST.ON}
            {$comment.timestamp|formatTime:$CONST.DATE_FORMAT_SHORT}
            {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
                (<a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">delete</a>)
            {/if}
            {if isset($comment.id) AND isset($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
                (<a href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
                <div id="serendipity_replyform_{$comment.id}"></div>
            {/if}
        </div>
    </div>
{foreachelse}
    <div class="serendipity_center">{$CONST.NO_COMMENTS}</div>
{/foreach}
