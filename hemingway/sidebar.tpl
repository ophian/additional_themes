{if $pluginside == 'Detail'}
{foreach $plugindata AS $item}
{if $item.class != "serendipity_quicksearch_plugin"}
    {if $item.title != ""}<h2 class="serendipitySideBarTitle {$item.class}">{$item.title}</h2>{/if}
    <div class="featured">{$item.content}</div>
{/if}
{/foreach}
{else}
{foreach $plugindata AS $item}
{if $item.class != "serendipity_quicksearch_plugin"}
    <div class="serendipitySideBarItem container_{$item.class}">
        {if $item.title != ""}<h2 class="serendipitySideBarTitle {$item.class}">{$item.title}</h2>{/if}
        <div class="serendipitySideBarContent">{$item.content}</div>
    </div>
{/if}
{/foreach}
{/if}
