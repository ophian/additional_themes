{foreach $plugindata AS $item}
{if $item.class == "serendipity_plugin_quicksearch"}
{else}
    {if $item.class == "serendipity_plugin_staticpage"}
        {if $item.title != ""}<h3>{$item.title}</h3>{/if}
        {$item.content}
    {else}
        {if $item.class == "serendipity_plugin_categories"}
        {if $item.title != ""}<h3>{$item.title}</h3>{/if}
        <ul class="plainList">
            {$item.content}
        </ul>
        {elseif $item.class == "serendipity_plugin_archives"}
        {if $item.title != ""}<h3>{$item.title}</h3>{/if}
            {$item.content}
        {else}
        <div id="{$item.class}" class="sbitem">
            {if $item.title != ""}<h3>{$item.title}</h3>{/if}
            <div class="sbcontent">
                {$item.content}
            </div>
        </div>
        {/if}
    {/if}
{/if}
{/foreach}
