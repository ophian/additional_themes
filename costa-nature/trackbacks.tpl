{foreach $trackbacks AS $trackback}
    <div class="serendipity_comment">
        <div class="serendipity_commentBody">
            <a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a>{if $trackback.type == 'TRACKBACK'}<br>{/if}
            {$trackback.body|strip_tags|escape:'htmlall'|truncate:200:" [...]":false}
        </div>
        <div class="serendipity_comment_source">
            <b>Weblog:</b> {$trackback.author|default:$CONST.ANONYMOUS}<br />
            <b>{$CONST.TRACKED}:</b> {$trackback.timestamp|formatTime:'%b %d, %H:%M'}
        {if NOT empty($entry.is_entry_owner)}
            (<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>)
        {/if}
        </div>
    </div>
{foreachelse}
    <div class="serendipity_center">{$CONST.NO_TRACKBACKS}</div>
{/foreach}
