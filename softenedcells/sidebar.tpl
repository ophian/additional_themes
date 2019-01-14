{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach $plugindata AS $item}
{if NOT empty($item.content)}
    <div class="serendipitySideBarItem container_{$item.class}">
        {if NOT empty($item.title)}<div class="serendipitySideBarTitle {$item.class}">{$item.title}</div>{/if}
        <div class="serendipitySideBarContent">{$item.content}</div>
        <div class="serendipitySideBarFooter"></div>
    </div>
{/if}
{/foreach}
{if $is_raw_mode}
</div>
{/if}
