{foreach $comments AS $comment}
    <div id="c{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if}"{if $comment.depth > 0} style="padding-left: {$comment.depth*20}px"{/if}>
        <div class="commentwrap">
        <div class="serendipity_comment_source">
            <a href="#c{$comment.id|default:0}" title="Link to comment #{$comment.trace}">#{$comment.trace}</a>
            {if $comment.email}
                <a href="mailto:{$comment.email}">{$comment.author|default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}
            {/if}
            {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND $comment.authoremail == $comment.clear_email} <span class="pc-owner">Post author</span> {/if}
            {if $comment.url}
                wrote (<a href="{$comment.url|escape:'htmlall'}" title="{$comment.url|escape}">Link</a>)
            {/if}
            {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
                (<a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">delete</a>)
            {/if}
            {if isset($entry) AND $entry.allow_comments}
                (<a href="#serendipity_CommentForm" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}';{if NOT empty($comment_onchange)} {$comment_onchange|default:''}{/if}">{$CONST.REPLY}</a>)
            {/if}
        <br />Posted {$CONST.ON} {$comment.timestamp|formatTime:DATE_FORMAT_ENTRY}
        </div>
        <div class="serendipity_commentBody">{$comment.body}</div>
        <div class="serendipity_commentFooter">&nbsp;</div>
        </div>
    </div>
{foreachelse}
    <div class="serendipity_center">{$CONST.NO_COMMENTS}</div>
{/foreach}
