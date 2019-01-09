{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{foreach $entries AS $dategroup}
{foreach $dategroup.entries AS $entry}
    <div class="clearfloat">
        <h6><a href="{foreach $entry.categories AS $entry_category}{$entry_category.category_link}{/foreach}">{foreach $entry.categories AS $entry_category}{$entry_category.category_name|escape}{/foreach}</a></h6>

{if $entry.properties.ep_MimboImage != ''}
        <a href="{$entry.link}" rel="bookmark" title="Permanent link: {$entry.title}"><img src="{$entry.properties.ep_MimboImage}" /></a>
{/if}
        <a class="title" href="{$entry.link}" rel="bookmark">{$entry.title|default:$entry.id}&raquo;</a>

        <div>{$entry.body|strip_tags|truncate:400:" ..."}</div>
    </div><!-- /.clearfloat --><br/>
{/foreach}
{/foreach}
{serendipity_hookPlugin hook="entries_footer"}
