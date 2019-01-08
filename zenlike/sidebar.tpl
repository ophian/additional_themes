{foreach $plugindata AS $item}
{if NOT empty($item.content)}
    <div class="box container_{$item.class}">
        <h4 class="{$item.class}">{$item.title}</h4>
        <div class="contentarea">
            {$item.content}
        </div>
    </div>
{/if}
{/foreach}
