{serendipity_hookPlugin hook="entries_header"}
<div class='serendipity_date'>{$CONST.TOPICS_OF} {$dateRange.0|formatTime:"%B, %Y"}</div>

<div class="serendipity_entry">
    <ul>
    {foreach $entries AS $sentries}
        {foreach $sentries.entries AS $entry}
        <li><a href="{$entry.link}">{$entry.title}</a><br>{$CONST.POSTED_BY} {$entry.author} {$CONST.ON} {$entry.timestamp|formatTime:DATE_FORMAT_ENTRY}</li>
        {/foreach}
    {/foreach}
    </ul>
</div>

