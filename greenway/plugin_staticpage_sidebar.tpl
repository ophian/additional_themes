<div class="staticpage_sbList">
{if NOT empty($staticpage_jsStr)}
    <div class="staticpage_sbJsList">
    {$staticpage_jsStr}
    </div>
{/if}
{if NOT $staticpage_jsStr OR empty($staticpage_jsStr)}
{if $frontpage_path}
        <a class="spp_title" href="{$frontpage_path}">{$CONST.PLUGIN_STATICPAGELIST_FRONTPAGE_LINKNAME}</a>
{/if}
{if is_array($staticpage_listContent) AND NOT empty($staticpage_listContent)}
    {foreach $staticpage_listContent AS $pageList}
        {if !empty($pageList.permalink)}
        <a class="spp_title" href="{$pageList.permalink}" title="{$pageList.pagetitle|escape}" style="padding-left: {$pageList.depth}px;">{$pageList.headline|truncate:32:"&hellip;"}</a>
        {else}
        <span class="spp_title" style="padding-left: {$pageList.depth}px;">{$pageList.headline|truncate:32:"&hellip;"}</span>
        {/if}
    {/foreach}
{/if}
{/if}
</div>
