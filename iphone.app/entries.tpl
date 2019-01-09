{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
            {assign var="entry" value=$entry scope="root"}
        {if !$is_single_entry}
            <li>
                <a href="{$entry.link}" target="_ajax">{$entry.title|default:$entry.body}<br/>
                <span class="small">{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</span></a>
            </li>
        {/if}

        {if $is_single_entry}
            <div class="entry">
                <h1>{$entry.title}</h1>
                <h3>{$dategroup.date|formatTime:DATE_FORMAT_ENTRY} {$CONST.POSTED_BY} {$entry.author}</h3>
                <div class="entryBody">{$entry.body}</div>
                <h3>Kommentare</h3>
                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
            </div>
        {/if}
    {/foreach}
    </div>
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/if}
