{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach $plugindata AS $item}
         {if $item.title != ""}<h2>{$item.title}</h2>{/if}
    {$item.content}

{/foreach}
{if $is_raw_mode}
</div>
{/if}
