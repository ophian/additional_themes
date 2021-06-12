<!-- ENTRIES START -->
{if NOT $is_preview}
<div class="primary">
    <h1>{$CONST.ARCHIVES}</h1>
    <ul class="dates">
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
{foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
        {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}
        <li>
            <span class="date">{$entry.timestamp|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')}</span>
            <a href="{$entry.link}">{$entry.title|default:$entry.id}</a>
            {if NOT empty($entry.categories)}
                {$CONST.IN} {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
            {/if}
        </li>
    {/foreach}
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <div class="serendipity_overview_noentries">{$CONST.NO_ENTRIES_TO_PRINT}</div>
    {/if}
{/if}

    </ul>
{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}

    <div class="block_center">
    {if NOT empty($footer_prev_page)}
        <span class="previous"><a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a></span>
    {else}
        <span class="previous">&#160;</span>
    {/if}

    {if NOT empty($footer_info)}
        <span class="entries_info">({$footer_info})</span>
    {/if}

    {if NOT empty($footer_next_page)}
        <span class="next"><a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a></span>
    {else}
        <span class="next">&#160;</span>
    {/if}
    </div>
{/if}

    {serendipity_hookPlugin hook="entries_footer"}

</div>

<div class="secondary">
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    <h2>{$template_option.about_title}</h2>
    <div class="featured">
        <p>{$template_option.about} {if $template_option.aboutpageurl != "#"}<a href="{$template_option.aboutpageurl}"> More &raquo;</a>{/if}</p>
    </div>
</div>

{else}

<div class="primary">
{foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
    {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}
    <h1 class="serendipity_title">{$entry.title|default:$entry.id}</h1>
    <div class="serendipity_entry_body">
        {$entry.body}

    {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
        <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
    {/if}

    </div>
{if $entry.has_extended}

    <div class="serendipity_entry_extended">
        <a id="extended"></a>
        {$entry.extended}
    </div>
{/if}

</div>

<hr class="hide">

<div class="secondary">
    <h2>About this entry</h2>
    <div class="featured">
        <p>You&rsquo;re currently reading &ldquo;{$entry.title|default:$entry.id},&rdquo; an entry on {$blogTitle}</p>
        <dl>
            <dt>{$CONST.POSTED_BY}:</dt>
            <dd><a href="{$entry.link_author}">{$entry.author}</a>
            {if $dategroup.is_sticky}{$CONST.ON}{else}{$CONST.AT}{/if}
            <a href="{$entry.link}">{if NOT $dategroup.is_sticky}{$dategroup.date|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')}{/if}</a> / {$entry.timestamp|formatTime:'%H:%M'}<br>Last updated {$entry.last_modified|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')}</dd>
        </dl>
    {if NOT empty($entry.categories)}
        <dl>
            <dt>{$CONST.CATEGORY}:</dt>
            <dd>
            {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
            </dd>
        </dl>
    {/if}
        {if NOT empty($entry.is_entry_owner) AND NOT $is_preview}<dl><dd><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></dd></dl>{/if}
    </div>
</div>
        {/foreach}
    {/foreach}

{/if}
<!-- ENTRIES END -->
