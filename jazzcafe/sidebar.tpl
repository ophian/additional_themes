<ul id="categories">
{foreach $plugindata AS $item}
        <li>
            {if $item.title != ""}<h3>{$item.title}</h3>{/if}
            {$item.content}
    </li>
{/foreach}
</ul>
