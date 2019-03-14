{serendipity_hookPlugin hook="entries_header"}
<h2>{$CONST.ARCHIVES}</h2>
{foreach $archives AS $archive}
<table class="archives_listing">
    <tr class="archives_header">
        <td class="archives_header" colspan="5"><h3>{$archive.year}</h3></td>
    </tr>
    {foreach $archive.months AS $month}
    <tr class="archives_row">
        <td class="archives_date">{$month.date|formatTime:"%B"}</td>
        <td class="archives_count">&bull; {$month.entry_count} {$CONST.ENTRIES}</td>
        <td class="archives_count_link">&bull; {if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if}</td>
        <td class="archives_link">&bull; {if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if}</td>
    </tr>
    {/foreach}
</table>
{/foreach}

<div class="serendipity_entries_footer">
    {serendipity_hookPlugin hook="entries_footer"}
</div>
