{serendipity_hookPlugin hook="entries_header"}
<div class="serendipity_Entry_Date">
    <h3 class="serendipity_date">{$CONST.TOPICS_OF} {$dateRange.0|formatTime:"%B, %Y"}</h3>
    <div class="serendipity_entry archive_summary_entry">
        {foreach $entries AS $sentries}
            {foreach $sentries.entries AS $entry}
                <dl class="archive_summary {cycle values='archive_summary_odd,archive_summary_even'}">
                    <dt class="archive_summary_title"><a href="{$entry.link}">{$entry.title|truncate:80:" ..."}</a></dt>
                    <dd class="archive_summary_postdate">{$entry.timestamp|formatTime:$template_option.date_format}</dd>
                  {if $template_option.footerauthor == 'true' OR $template_option.footercategories == 'true'}
                    <dd class="archive_summary_postdetails">
                        {if $template_option.footerauthor == 'true'}
                            {$CONST.POSTED_BY} <address class="author"><a href="{$entry.link_author}">{$entry.author}</a></address>
                        {/if}
                        {if $template_option.footercategories == 'true'}
                            {if NOT empty($entry.categories)}
                                {$CONST.IN} {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
                            {/if}
                        {/if}
                    </dd>
                  {/if}
                </dl>
            {/foreach}
        {/foreach}
    </div>
</div>

<div class="serendipity_entries_footer">
    {serendipity_hookPlugin hook="entries_footer"}
</div>
