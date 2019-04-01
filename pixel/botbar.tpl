{foreach $plugindata AS $item}
  {if $item.class != "serendipity_plugin_quicksearch"}
    <div class="{cycle values="col2,col3,col1"} container_{$item.class}">
    {if $item.title != ""}
        <h3>{$item.title}</h3>
    {/if}
        {$item.content}
    </div>
  {/if}
{/foreach}
