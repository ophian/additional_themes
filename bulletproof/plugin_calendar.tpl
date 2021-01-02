<table cellspacing="0" cellpadding="0" summary="this table is a calendar for the month of {$smarty.now|formatTime:"%B, %Y"}" class="serendipity_calendar">
    <thead>
      <tr>
        <th id="back" scope="col" colspan="1" class="serendipity_calendarHeader">
        {if $plugin_calendar_head.minScroll le $plugin_calendar_head.month_date}
           {if $template_option.colorset == 'blank'}
           <a title="{$CONST.BACK}" href="{$plugin_calendar_head.uri_previous}"><img alt="{$CONST.BACK}" src="{serendipity_getFile file="img/back.png"}" width="12" height="12" /></a>
           {else}
           <a title="{$CONST.BACK}" href="{$plugin_calendar_head.uri_previous}"><img alt="{$CONST.BACK}" src="{$serendipityHTTPPath}templates/{$template}/img/{$template_option.colorset}_back.png" /></a>
           {/if}
        {else}
           <img alt="" src="{serendipity_getFile file="img/blank.png"}" width="6" height="6" class="serendipity_calender_spacer" />
        {/if}
        </th>

        <th id="month" scope="col" colspan="5" class="serendipity_calendarHeader">
            <b><a href="{$plugin_calendar_head.uri_month}">{$plugin_calendar_head.month_date|formatTime:"%B &rsquo;%y":false}</a></b>
        </th>

        <th id="forward" scope="col" colspan="1" class="serendipity_calendarHeader">
        {if $plugin_calendar_head.maxScroll ge $plugin_calendar_head.month_date}
            {if $template_option.colorset == 'blank'}
            <a title="{$CONST.FORWARD}" href="{$plugin_calendar_head.uri_next}"><img alt="{$CONST.FORWARD}" src="{serendipity_getFile file="img/forward.png"}" width="12" height="12" /></a>
            {else}
            <a title="{$CONST.FORWARD}" href="{$plugin_calendar_head.uri_next}"><img alt="{$CONST.FORWARD}" src="{$serendipityHTTPPath}templates/{$template}/img/{$template_option.colorset}_forward.png" /></a>
            {/if}
        {else}
            <img alt="" src="{serendipity_getFile file="img/blank.png"}" width="6" height="6" class="serendipity_calender_spacer" />
        {/if}
        </th>
    </tr>

    <tr>
    {foreach $plugin_calendar_dow AS $dow}
        <th id="{$dow.date|formatTime:"%a":false|truncate:3:'':true}" scope="col" abbr="{$dow.date|formatTime:"%A":false}" title="{$dow.date|formatTime:"%A":false}" class="serendipity_weekDayName" align="center">{$dow.date|formatTime:"%a":false|truncate:2:'':true}</th>
    {/foreach}
    </tr>
</thead>
<tfoot class="serendipity_calendarHeader">
<tr><td id="today" scope="col" colspan="7">{$smarty.now|formatTime:($template_option.date_format|default:$CONST.DATE_FORMAT_ENTRY)}</td></tr>
</tfoot>
<tbody>
    {foreach $plugin_calendar_weeks AS $week}
        <tr class="serendipity_calendar {cycle values="row1, row2, row3, row4, row5, row6"}">
        {foreach $week.days AS $day}
            <td class="serendipity_calendarDay {$day.classes}"{if isset($day.properties.Title)} title="{$day.properties.Title}"{/if}>{if isset($day.properties.Active) AND $day.properties.Active}
                <a href="{$day.properties.Link}">{/if}{$day.name|default:"&#160;"}{if isset($day.properties.Active) AND $day.properties.Active}</a>{/if}</td>
        {/foreach}
        </tr>
    {/foreach}
</tbody>
</table>
