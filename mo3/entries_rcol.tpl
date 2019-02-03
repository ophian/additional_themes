{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach $entries AS $dategroup}
{foreach $dategroup.entries AS $entry}
    <div class="clearfloat">
        <h3>{foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}</h3>

{if NOT empty($entry.properties.ep_MimboImage)}
        <a href="{$entry.link}" rel="bookmark" title="Permanent link: {$entry.title}"><img src="{$entry.properties.ep_MimboImage}" /></a>
{/if}
        <a class="title" href="{$entry.link}" rel="bookmark">{$entry.title|default:$entry.id}&raquo;</a>

        <div>{$entry.body|strip_tags|truncate:400:" ..."}</div>
    </div><!-- /.clearfloat -->
{/foreach}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
