{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
            {assign var="entry" value=$entry scope="root"}

      {if !$is_single_entry}
          <div class="ePrv">
              <div class="ePrvLink"><h3><a class="ePrvLink" href="{$entry.link}">{$entry.title|default:$entry.body}</a></h3></div>
              <div class="ePrvDate">{$dategroup.date|formatTime:DATE_FORMAT_ENTRY} - {$CONST.POSTED_BY} {$entry.author}</div>
          </div>
      {/if}

      {if $is_single_entry}
          <div class="e">
              <div class="eDate">{$dategroup.date|formatTime:DATE_FORMAT_ENTRY} {$CONST.POSTED_BY} {$entry.author}</div>
              <div class="eContent">{$entry.body}</div>
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
