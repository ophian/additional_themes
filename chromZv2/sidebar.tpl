{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}

{foreach $plugindata AS $item}
    <div class="serendipitySideBarItem container_{$item.class} boxed">
        {if $item.title != ""}<h4 class="serendipitySideBarTitle {$item.class} title">{$item.title}</h4>{/if}
        <div class="serendipitySideBarContent content">{$item.content}</div>
    </div>
{/foreach}

{if $is_raw_mode}
</div>
{/if}
