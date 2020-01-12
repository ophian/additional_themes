{foreach $comments AS $comment}
    <li id="c{$comment.id|default:0}" class="{if $comment@iteration is odd}graybox{/if}"{if $comment.depth > 0} style="padding-left: {$comment.depth*20}{***}px"{/if}>
        <div id="serendipity_comment_{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if} {cycle values="comment_oddbox,comment_evenbox"}">
            <div class="serendipity_comment_source">

            {if $comment.body == 'COMMENT_DELETED'}
                <p>{$CONST.COMMENT_IS_DELETED}</p>
            {else}
                <p>
                    <cite>
                        {if $comment.url}<a href="{$comment.url|escape:'htmlall'}">{$comment.author|default:$CONST.ANONYMOUS}:</a>{else}{$comment.author|default:$CONST.ANONYMOUS}:{/if}
                        {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND $comment.authoremail == $comment.clear_email} <span class="pc-owner">Post author</span>{/if}
                    </cite>
                    {if isset($comment.type) AND $comment.type == 'TRACKBACK'}{$comment.body|strip_tags:false} [&hellip;]{else}{$comment.body}{/if}
                </p>
            {/if}
                <div class="commentmetadata" id="serendipity_comment_{$comment.id|default:0}">
                    <a href="#c{$comment.id|default:0}" title="{$CONST.LINK_TO_COMMENT|sprintf:$comment.trace}">#{$comment.trace}</a>
                    {$comment.timestamp|formatTime:$CONST.DATE_FORMAT_SHORT}
                    {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
                        (<a href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
                    {/if}
                    {if isset($comment.id) AND $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                        (<a href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
                        <div id="serendipity_replyform_{$comment.id}"></div>
                    {/if}
                </div>
            </div>
        </div>
    </li>
{foreachelse}
    <li class="nocomments">{$CONST.NO_COMMENTS}</li>
{/foreach}
