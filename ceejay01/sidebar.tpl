{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach $plugindata AS $item}
{if $item.class != "serendipity_quicksearch_plugin"}
    <div class="serendipitySideBarItem container_{$item.class}">
        {if $item.title != ""}<h3 class="serendipitySideBarTitle {$item.class}">{$item.title}</h3>{/if}
        <div class="serendipitySideBarContent">{$item.content}</div>
    </div>
{/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}
