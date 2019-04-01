{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach $plugindata AS $item}
    {if $item.class != "serendipity_plugin_quicksearch" AND NOT empty($item.content)}
    <div id="{$item.id|replace:'@':''}" class="dbx-box">
        <h3 class="dbx-handle">{$item.title}</h3>
        <div class="dbx-content">{$item.content}</div>
    </div>
    {/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}
