{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
<ul>
{foreach $plugindata AS $item}
  {if $item.class != "serendipity_plugin_quicksearch"}
    <li><div class="sidebarbox container_{$item.class}">
    {if $item.title != ""}
            <h2>{$item.title}</h2>
    {/if}
            {$item.content}
        </div>
    </li>
  {/if}
{/foreach}
</ul>
{if $is_raw_mode}
</div>
{/if}
