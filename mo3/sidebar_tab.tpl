<div id="menu">
    <ul>
    {foreach $plugindata AS $item}
        <li id={$item}><a href="#nogo">{if $item.title != ""}{$item.title}{else}{$CONST.NONE}{/if}</a>
            <ul>
                <li>
                    <div class="serendipityTabSideBarContent">{$item.content}</div><br/>
                </li>
            </ul>
        </li>
    {/foreach}
    </ul>
</div>
