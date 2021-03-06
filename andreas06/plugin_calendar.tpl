<table class="serendipity_calendar">
    <tr>
        <td class="serendipity_calendarHeader">
{if $plugin_calendar_head.minScroll le $plugin_calendar_head.month_date}
            <a title="{$CONST.BACK}" href="{$plugin_calendar_head.uri_previous}"><span class="large">&laquo;</span></a>
{else}
<span class="large">&laquo;</span>
{/if}
        </td>

        <td colspan="5" class="serendipity_calendarHeader">
            <b><a href="{$plugin_calendar_head.uri_month}">{$plugin_calendar_head.month_date|formatTime:"%B '%y":false}</a></b>
        </td>

        <td class="serendipity_calendarHeader">
{if $plugin_calendar_head.maxScroll ge $plugin_calendar_head.month_date}
            <a title="{$CONST.FORWARD}" href="{$plugin_calendar_head.uri_next}"><span class="large">&raquo;</span></a>
{else}
            <span class="large">&raquo;</span>
{/if}
        </td>
    </tr>

    <tr>
    {foreach $plugin_calendar_dow AS $dow}
        <td scope="col" abbr="{$dow.date|formatTime:"%A":false}" title="{$dow.date|formatTime:"%A":false}" class="serendipity_weekDayName" align="center">{$dow.date|formatTime:"%a":false|truncate:2:'':true}</td>
    {/foreach}
    </tr>

    {foreach $plugin_calendar_weeks AS $week}
        <tr class="serendipity_calendar">
        {foreach $week.days AS $day}
            <td class="serendipity_calendarDay {$day.classes}"{if isset($day.properties.Title)} title="{$day.properties.Title}"{/if}>{if isset($day.properties.Active) AND $day.properties.Active}<a href="{$day.properties.Link}">{/if}{$day.name|default:"&#160;"}{if isset($day.properties.Active) AND $day.properties.Active}</a>{/if}</td>
        {/foreach}
        </tr>
    {/foreach}
</table>
