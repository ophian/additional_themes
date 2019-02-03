<div id="menu">
    <ul>
    {foreach $plugindata AS $item}
        <li id={$item@iteration}-{$item.class}><a href="#nogo">{if NOT empty($item.title)}{$item.title}{else}{$CONST.NONE}{/if}</a>
            <ul>
                <li>
                    <div class="serendipityTabSideBarContent">{$item.content}</div>
                </li>
            </ul>
        </li>
    {/foreach}
    </ul>
</div>
