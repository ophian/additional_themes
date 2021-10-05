{foreach $trackbacks AS $trackback}
    <li class="{if $trackback@iteration is odd}graybox{/if}">
        <a id="c{$trackback.id}"></a>
        <cite><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a></cite>{if $trackback.type == 'TRACKBACK'}<br>{/if}
        <div class="serendipity_commentBody">
            {$trackback.body|strip_tags|escape:'htmlall'} [&hellip;]
        </div>
        <div class="commentmetadata">
            <strong>{$CONST.WEBLOG}:</strong> {$trackback.author|default:$CONST.ANONYMOUS}<br>
            <strong>{$CONST.TRACKED}:</strong> {$trackback.timestamp|formatTime:'%b %d, %H:%M'}
        {if NOT empty($entry.is_entry_owner)}
            (<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>)
        {/if}
        </div>
    </li>
{foreachelse}
    <p class="nocomments">{$CONST.NO_TRACKBACKS}</p>
{/foreach}
