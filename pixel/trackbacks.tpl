<ul class="trackback">
{foreach $trackbacks AS $trackback}
    <li id="li-comment-{$trackback.id}" class="serendipity_comment comment{if isset($comment.depth)} depth-{$comment.depth+1}{/if} {cycle values="even,odd"} {cycle values="thread-even,thread-odd"}">
        <div id="comment-{$trackback.id}">
            <div class="commentbody">
                <cite><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title} - {$trackback.author|default:$CONST.ANONYMOUS}</a></cite>
                <br />
                <small class="commentmetadata">
                    <a href="#comment-{$trackback.id}">{$trackback.timestamp|formatTime:'%b %d, %H:%M'}</a>
                {if NOT empty($entry.is_entry_owner)}
                    <a href="{$trackback.link_delete}">{$CONST.DELETE}</a>
                {/if}</small>
            </div>
            {$trackback.body|strip_tags|escape:'htmlall'} [&hellip;]
        </div>
    </li>
{foreachelse}
    <li class="nocomment">{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ul>
