{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach $entries AS $dategroup}
{foreach $dategroup.entries AS $entry}
{if $entry.properties.ep_MagazineCategoryImage != ''}
    <a href="{$entry.link}" rel="bookmark" title="Permanent link: {$entry.title}"><img id="leadpic" src="{$entry.properties.ep_MagazineCategoryImage}" alt="{$entry.properties.ep_MagazineCategoryImageAlt}" /></a>
{/if}
    <h3><a href="{foreach $entry.categories AS $entry_category}{$entry_category.category_link}{/foreach}">{foreach $entry.categories AS $entry_category}{$entry_category.category_name|escape}{/foreach}</a></h3>

    <a class="title" href="{$entry.link}" rel="bookmark">{$entry.title|default:$entry.id}</a>

    {$entry.body}

{if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
    <a href="{$entry.link}#extended" rel="bookmark">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a>
{/if}

{/foreach}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
