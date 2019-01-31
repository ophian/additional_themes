{if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
<ol>
  <div id="commentlist">
{foreach $comments AS $comment}
    <a id="c{$comment.id|default:0}"></a>
    <div id="serendipity_comment_{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if} {cycle values="comment_oddbox,comment_evenbox"}">

        <div class="serendipity_comment_source">
            <span class="comment_source_author">
            {if $comment.email}
                <a href="mailto:{$comment.email}"><img src="{serendipity_getFile file="img/comment.gif"}" /> {$comment.author|default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}
            {/if}
            {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND isset($entry) AND $entry.email == $comment.clear_email} <span class="pc-owner">Post author</span> {/if}
        {if isset($comment.type) AND $comment.type == 'TRACKBACK'}
            <br />
            {$CONST.IN} {$CONST.TITLE}: <span class="comment_source_ctitle">{$comment.ctitle|truncate:42|wordwrap:15:"\n":true|escape}</span>
        {/if}
            </span>
            {if $comment.url}
                (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|escape}"><img src="{serendipity_getFile file="img/trackback.gif"}" /> {$CONST.HOMEPAGE}</a>)
            {/if}

            {if isset($comment.id)}<div id="serendipity_replyform_{$comment.id}"></div>{/if}
        </div>
        <div class="serendipity_commentBody">{$comment.body}</div>

        {if isset($comment.id)}
        <p class="commentmeta">
            <span class="comment_source_date">{$comment.timestamp|formatTime:$CONST.DATE_FORMAT_ENTRY} {$CONST.AT} <a class="comment_source_trace" href="#c{$comment.id}" title="{$CONST.PERMALINK_COMMENT}">{$comment.timestamp|formatTime:'%H:%M'}</a> </span>
            {if $comment.url}
                (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|escape}">Link</a>)
            {/if}
            {if isset($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
                (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
            {/if}
            {if NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
                (<a class="comment_source_ownrlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
            {/if}
        </p>
        {/if}
    </div>
{foreachelse}
    <div class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</div>
{/foreach}
  </div>
</ol>
{else}
<div id="commentlist">
{foreach $comments AS $comment}
    <div id="serendipity_comment_{$comment.id|default:0}" class="serendipity_comment serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author AND $entry.email == $comment.clear_email} serendipity_comment_author_self{/if} {if $comment.depth == 0}comment_threaded_child0{elseif $comment.depth == 1}comment_threaded_child1{else}comment_threaded_child2{/if}">
    <a id="c{$comment.id|default:0}"></a>
        <div class="serendipity_comment_source">
            <span class="comment_source_author">
            {if $comment.email}
                <a href="mailto:{$comment.email}"><img src="{serendipity_getFile file="img/comment.gif"}" /> {$comment.author|default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|default:$CONST.ANONYMOUS}
            {/if}
            {if isset($comment.entryauthor) AND $comment.entryauthor == $comment.author AND isset($entry) AND $entry.email == $comment.clear_email} <span class="pc-owner">Post author</span> {/if}
        {if isset($comment.type) AND $comment.type == 'TRACKBACK'}
            <br />
            {$CONST.IN} {$CONST.TITLE}: <span class="comment_source_ctitle">{$comment.ctitle|truncate:42|wordwrap:15:"\n":true|escape}</span>
        {/if}
            </span>
            {if $comment.url}
                (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|escape}"><img src="{serendipity_getFile file="img/trackback.gif"}" /> {$CONST.HOMEPAGE}</a>)
            {/if}

            {if isset($comment.id)}<div id="serendipity_replyform_{$comment.id}"></div>{/if}
        </div>
        <div class="serendipity_commentBody">{$comment.body}</div>
        {if isset($comment.id)}
        <p class="commentmeta">
            <span class="comment_source_date">{$comment.timestamp|formatTime:$CONST.DATE_FORMAT_ENTRY} {$CONST.AT} <a class="comment_source_trace" href="#c{$comment.id}" title="{$CONST.PERMALINK_COMMENT}">{$comment.timestamp|formatTime:'%H:%M'}</a> </span>
            {if $comment.url}
                (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|escape}">Link</a>)
            {/if}
            {if isset($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
                (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
            {/if}
            {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
                (<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>){/if}
        </p>
        {/if}
    </div>
{foreachelse}
    <div class="serendipity_center nocomments">{$CONST.NO_COMMENTS}</div>
{/foreach}
</div>
{/if}
