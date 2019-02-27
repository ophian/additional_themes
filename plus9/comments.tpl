<ol class="commentlist">
{foreach $comments AS $comment}
    <li id="c{$comment.id|default:0}">
        <div id="serendipity_comment_{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if} {cycle values="comment_oddbox,comment_evenbox"}"{if $comment.depth > 0} style="padding-left: {$comment.depth*20}{***}px"{/if}>
            <div class="serendipity_comment_source">
                <div class="comment_mod"></div>
                <div class="comment_text">{if $comment.body == 'COMMENT_DELETED'}{$CONST.COMMENT_IS_DELETED}{else}{$comment.body}{/if}</div>

                <div class="comment_author">
                    <p>
                        <strong>{if $comment.url}<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|escape}">{/if}{$comment.author|default:$CONST.ANONYMOUS}{if $comment.url}</a>{/if}</strong>
                        {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND isset($entry) AND $entry.email == $comment.clear_email} <span class="pc-owner">Post author</span>{/if}
                    </p>

                    <p><small>{$comment.timestamp|formatTime:'%d %b %y'} {$CONST.AT} <a href="#c{$comment.id|default:0}">{$comment.timestamp|formatTime:'%H:%M'}</a>{if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)} <a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id|default:'':$comment.author}');">{$CONST.DELETE}</a>{/if}</small></p>

                {if isset($comment.id) AND NOT empty($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
                    <p><small><a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a></small></p>
                    <div id="serendipity_replyform_{$comment.id}"></div>
                {/if}
                </div>

                <div class="clear"></div>
            </div>
        </div>
    </li>
{foreachelse}
    <li>{$CONST.NO_COMMENTS}</li>
{/foreach}
</ol>
