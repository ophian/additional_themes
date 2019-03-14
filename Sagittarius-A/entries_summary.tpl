{serendipity_hookPlugin hook="entries_header"}
<h2 class="pagetitle">{$CONST.TOPICS_OF} {$dateRange.0|formatTime:"%B, %Y"}</h2>

<div class="post">
{foreach $entries AS $sentries}
    {foreach $sentries.entries AS $entry}
    <h3 class="summary_title"><a href="{$entry.link}">{$entry.title}</a></h3>

    <small>{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> &bull; {$entry.timestamp|formatTime:DATE_FORMAT_ENTRY}{if NOT empty($entry.categories)} &bull; {$CONST.CATEGORY}: {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}{/if}</small>

    <hr class="archiverule" />
    {/foreach}
{/foreach}
</div>

<div class="serendipity_entries_footer">
    {serendipity_hookPlugin hook="entries_footer"}
</div>
