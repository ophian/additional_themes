{foreach $trackbacks AS $trackback}
    <li class="{if $trackback@iteration is odd}graybox{/if}">
        <a id="c{$trackback.id}"></a>
        <p><cite><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a></cite><br />
        {$trackback.body|strip_tags|escape:'htmlall'}</p>
        <div class="commentmetadata">
            <b>Weblog:</b> {$trackback.author|default:$CONST.ANONYMOUS}
            ({$CONST.TRACKED}: {$trackback.timestamp|formatTime:'%b %d, %H:%M'})
        {if NOT empty($entry.is_entry_owner)}
            (<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>)
        {/if}
        </div>
    </li>
{foreachelse}
    <li class="nocomments">{$CONST.NO_TRACKBACKS}</li>
{/foreach}
