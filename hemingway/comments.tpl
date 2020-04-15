{if isset($entry) AND $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
<ol id="comments">
{foreach $comments AS $comment}
    <a id="c{$comment.id|default:0}"></a>
    <li class="serendipity_comment_author_{$comment.author|makeFilename} {if $entry.author == $comment.author}serendipity_comment_author_self{/if}">
        <cite>
            <span class="author">
                {if $comment.email}<a href="mailto:{$comment.email}">{$comment.author|default:$CONST.ANONYMOUS}</a>{else}{$comment.author|default:$CONST.ANONYMOUS}{/if}
            </span>
            <span class="date">{$comment.timestamp|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')} / <a class="comment_source_trace" href="#c{$comment.id}" title="{$CONST.PERMALINK_COMMENT}">{$comment.timestamp|formatTime:'%H:%M'}</a></span>
        </cite>
        <div class="content">
            {$comment.body}<br />
        {if $comment.url}
            (<a class="comment_source_url" href="{$comment.url|escape:'htmlall'}" title="{$comment.url|escape}">Link</a>)
        {/if}
        {if isset($comment.id) AND isset($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
            (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
        {/if}
        {if NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
            (<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">delete</a>)
        {/if}
        </div>
        <div class="clear"></div>
    </li>
{/foreach}
</ol>
{else}
<ol id="comments">
{foreach $comments AS $comment}
    <li class="serendipity_comment_author_{$comment.author|makeFilename}{if isset($entry) AND $entry.author == $comment.author} serendipity_comment_author_self{/if}">
        <a id="c{$comment.id|default:0}"></a>
        <cite>
            <span class="author">
                {if $comment.email}<a href="mailto:{$comment.email}">{$comment.author|default:$CONST.ANONYMOUS}</a>{else}{$comment.author|default:$CONST.ANONYMOUS}{/if}
            </span>
            <span class="date">{$comment.timestamp|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')} / <a class="comment_source_trace" href="#c{$comment.id}" title="{$CONST.PERMALINK_COMMENT}">{$comment.timestamp|formatTime:'%H:%M'}</a></span>
        </cite>
        <div class="content{if $comment.depth >= 1} child{/if}">
            {$comment.body}<br />
        {if $comment.url}
            (<a class="comment_source_url" href="{$comment.url|escape:'htmlall'}" title="{$comment.url|escape}">Link</a>)
        {/if}
        {if isset($comment.id) AND isset($entry.allow_comments) AND $comment.body != 'COMMENT_DELETED'}
            (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange|default:''}">{$CONST.REPLY}</a>)
        {/if}
        {if isset($entry) AND NOT empty($entry.is_entry_owner) AND NOT empty($comment.id)}
            (<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|sprintf:$comment.id:$comment.author}');">delete</a>)
        {/if}
        </div>
        <div class="clear"></div>
    </li>
{/foreach}
</ol>
{/if}
