{foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
        <div class="all_entries {if $entry@last} last_entry{/if}"><div>
    {/foreach}
{/foreach}