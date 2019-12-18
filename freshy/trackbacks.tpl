<dl class="commentlist">
{foreach $trackbacks AS $trackback}

        <dt class="none">
            <small class="date">
                <span class="date_day">{$trackback.timestamp|formatTime:'%d'}</span>
                <span class="date_month">{$trackback.timestamp|formatTime:'%m'}</span>
                <span class="date_year">{$trackback.timestamp|formatTime:'%Y'}</span>
            </small>
        </dt>
        <dd class="commentlist_item {cycle values="alt, "} none">
            <div class="comment">
            <strong class="author">
                <a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a>
            </strong> <div class="comment_text">
                {$trackback.body|strip_tags|escape:all}
            </div>
            <b>Weblog:</b> {$trackback.author|default:$CONST.ANONYMOUS}<br />
            <b>{$CONST.TRACKED}:</b> {$trackback.timestamp|formatTime:'%b %d, %H:%M'}
            </div>

        {if NOT empty($entry.is_entry_owner)}
            (<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>)
        {/if}
        </dd>

{foreachelse}
    {$CONST.NO_TRACKBACKS}
{/foreach}
</dl>