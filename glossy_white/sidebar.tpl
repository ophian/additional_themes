{foreach $plugindata AS $item}
    <div class="serendipitySideBarItem container_{$item.class}">
        {if $item.title != ""}<div class="serendipitySideBarTitle {$item.class}"><div class="ItemTitle">{$item.title}</div></div>{/if}
        <div class="serendipitySideBarContent">{$item.content}</div>
        <div class="serendipitySideBarFooter">{$item.footer|default:''}</div>
    </div>
{/foreach}