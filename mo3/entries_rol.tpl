{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
<div class="accordion">  
    <div class=headline>
     {$template_option.catrolheader}
    </div> 
{foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
 
    <h3>{$entry.title|default:$entry.id}&raquo;</h3>

    <p>{$entry.body|strip_tags|truncate:300:" ..."} <a  href="{$entry.link}" rel="bookmark"><br>{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title} &raquo;</a></p>

    {/foreach}
{/foreach}
</div> 
{serendipity_hookPlugin hook="entries_footer"}


 