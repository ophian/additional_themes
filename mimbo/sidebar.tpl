{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul class="sidelist">
{foreach $plugindata AS $item}
   {if $item.class != "serendipity_plugin_quicksearch"}
    <li>
       {if NOT empty($item.title)}<h3>{$item.title}</h3>{/if}
       {$item.content}
    </li>
    {/if}
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}
