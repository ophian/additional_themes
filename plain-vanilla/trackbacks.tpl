{foreach $trackbacks AS $trackback}
    <li class="serendipity_comment{if $trackback@iteration is odd} graybox{/if}">
        <a id="c{$trackback.id}"></a>
        <div class="serendipity_commentBody">
            <cite><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a></cite>
            {if $trackback.type == 'TRACKBACK'}<p>{$trackback.body|strip_tags|escape:all} [&hellip;]</p>{else} [&hellip;]{/if}
        </div>
        <div class="serendipity_comment_source">
            <small class="commentmetadata">
                <b>Weblog:</b> {$trackback.author|default:$CONST.ANONYMOUS}<br />
                <b>{$CONST.TRACKED}:</b> {$trackback.timestamp|formatTime:'%b %d, %H:%M'}
            {if NOT empty($entry.is_entry_owner)}
                (<a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>)
            {/if}
            </small>
        </div>
    </li>
{foreachelse}
    <p class="nocomments">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
