<ol class="commentlist">
{foreach $comments AS $comment}
    <li id="c{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if} {cycle values="alt,even"}{if $comment.depth > 8} commentlevel-9{else} commentlevel-{$comment.depth}{/if}">
        <cite>{if $comment.url}<a href="{$comment.url|escape:'htmlall'}">{/if}{$comment.author|default:$CONST.ANONYMOUS}{if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND $comment.authoremail == $comment.clear_email} <span class="pc-owner">Post author</span> {/if}{if $comment.url}</a>{/if} {$CONST.ON} <small class="commentmetadata"><time datetime="{$comment.timestamp|serendipity_html5time}">{$comment.timestamp|formatTime:($template_option.date_format|default:$CONST.DATE_FORMAT_ENTRY)}</time></small>:</cite>

        <div class="serendipity_comment_source">
        {if $comment.body == 'COMMENT_DELETED'}
            <p class="serendipity_msg_important">{$CONST.COMMENT_IS_DELETED}</p>
        {else}
            <p>{if isset($comment.type) AND $comment.type == 'TRACKBACK'}{$comment.body|strip_tags:false} [&hellip;]{else}{$comment.body}{/if}</p>
        {/if}
        </div>
        <ul class="meta{if isset($comment.type) AND $comment.type == 'TRACKBACK'} tb-meta{/if}">
        {if isset($comment.type) AND $comment.type == 'TRACKBACK'}
            <li><strong>TRACKBACK</strong></li>
        {/if}
            <li><time>{$comment.timestamp|formatTime:'%H:%M'}</time></li>
            <li><a class="comment_source_trace" href="#c{$comment.id|default:0}" title="{$CONST.I3_PLINK_TITLE}">{$CONST.I3_PLINK_TEXT}</a></li>
        {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
            <li><a class="comment_source_ownerlink" href="{$comment.link_delete}" title="{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}">{$CONST.DELETE}</a></li>
        {/if}
        {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND $comment.authoremail == $comment.clear_email}
            <li><span class="pc-owner">Post author</span></li>
        {/if}
        {if isset($comment.type) AND $comment.type == 'TRACKBACK'}
            <li>{$CONST.IN} {$CONST.TITLE}: <span class="comment_source_ctitle">{$comment.ctitle|truncate:42|wordwrap:15:"\n":true|escape}</span></li>
        {else}
    {if NOT empty($template_option.refcomments)}
        {if $comment.parent_id != '0'}
            <li><a class="reply_origin" href="#c{$comment.parent_id}" title="{$CONST.I3_REPLYORIGIN}: {$CONST.COMMENT} #c{$comment.parent_id}">{$CONST.I3_REPLYORIGIN}</a></li>
        {/if}
    {/if}
        {if isset($comment.id) AND NOT empty($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
            <li><a id="serendipity_reply_{$comment.id}" class="comment_reply" href="#serendipity_CommentForm" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}';{if NOT empty($comment_onchange)} {$comment_onchange|default:''}{/if}">{$CONST.REPLY}</a>
            <div id="serendipity_replyform_{$comment.id}"></div></li>
        {/if}
        {/if}
        </ul>
   </li>
{foreachelse}
    <li class="alt"><span class="serendipity_msg_notice">{$CONST.NO_COMMENTS}</span></li>
{/foreach}
</ol>
