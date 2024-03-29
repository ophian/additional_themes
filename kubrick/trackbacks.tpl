{foreach $trackbacks AS $trackback}
    <li class="{if $trackback@iteration is odd}graybox{/if}">
        <a id="c{$trackback.id}"></a>
        <cite><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a></cite>
        <p>{$trackback.body|strip_tags|escape:'htmlall'} [&hellip;]</p>
        <div class="commentmetadata">
            <b>{$CONST.WEBLOG}:</b> {$trackback.author|default:$CONST.ANONYMOUS}<br>
            <b>{$CONST.TRACKED}:</b> {$trackback.timestamp|formatTime:'%b %d, %H:%M'}
        {if NOT empty($entry.is_entry_owner)}
            (<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>)
        {/if}
        </div>
    </li>
{foreachelse}
    <p class="nocomments">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
