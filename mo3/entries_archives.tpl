{serendipity_hookPlugin hook="entries_header"}
<h2 class="pagetitle">{$CONST.ARCHIVES}</h2>
{foreach $archives AS $archive}
<table id="archives_listing">
    <tr class="archives_header">
        <td class="archives_header" colspan="5"><h3>{$archive.year}</h3></td>
    </tr>
    {foreach $archive.months AS $month}
    <tr class="archives_row">
        <td class="archives_graph" width="100"><img src="{serendipity_getFile file="img/graph_bar_horisontal.png"}" height="10" width="{math width=100 equation="count * width / max" count=$month.entry_count max=$max_entries format="%d"}"></td>
        <td class="archives_date">{$month.date|formatTime:"%B"}</td>
        <td class="archives_count">{$month.entry_count} {$CONST.ENTRIES}</td>
        <td class="archives_count_link">({if $month.entry_count}<a href="{$month.link}">{/if}{$CONST.VIEW_FULL}{if $month.entry_count}</a>{/if})</td>
        <td class="archives_link">({if $month.entry_count}<a href="{$month.link_summary}">{/if}{$CONST.VIEW_TOPICS}{if $month.entry_count}</a>{/if})</td>
    </tr>
    {/foreach}
</table>
{/foreach}

<div class="serendipity_pageFooter">
    {serendipity_hookPlugin hook="entries_footer"}
</div>
