{if $staticpage_articleformat}
<div id="staticpage_{$staticpage_pagetitle|makeFilename}" class="serendipity_Entry_Date serendipity_staticpage">
{/if}
    <h2 class="staticpage_title">{if $staticpage_articleformat}{if $staticpage_articleformattitle}{$staticpage_articleformattitle}{else}{$staticpage_pagetitle|escape}{/if}{else}{if $staticpage_headline}{$staticpage_headline}{else}{$staticpage_pagetitle|escape}{/if}{/if}</h2>

{if $staticpage_navigation AND $staticpage_shownavi}
    <table border="0" cellpadding="2" cellspacing="2" width="100%" class="staticpage_navigation">
        <tr>
            <td class="staticpage_navigation_left"   style="width: 20%"><a href="{$staticpage_navigation.prev.link}" title="prev">{$staticpage_navigation.prev.name|escape}</a></td>
            <td class="staticpage_navigation_center" style="width: 60%; text-align: center"><a href="{$staticpage_navigation.top.link}" title="top">{$staticpage_navigation.top.name|escape}</a></td>
            <td class="staticpage_navigation_right"  style="width: 20%; text-align: right"><a href="{$staticpage_navigation.next.link}" title="next">{$staticpage_navigation.next.name|escape}</a></td>
        </tr>
    </table>
{/if}

{if $staticpage_articleformat}
    <div class="post">
        <div class="content">
{/if}

{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
        <div class="staticpage_password">{$CONST.STATICPAGE_PASSWORD_NOTICE}</div>
        <br /><br />
        <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
            <div>
                <input type="password" name="serendipity[pass]" value="" />
                <input type="submit" name="submit" value="{$CONST.GO}" />
             </div>
        </form>
{else}
        {if $staticpage_precontent}
        <div class="ccontent serendipity_preface">
            {$staticpage_precontent}
        </div>
        {/if}
        {if is_array($staticpage_childpages)}
        <ul id="staticpage_childpages">
            {foreach $staticpage_childpages AS $childpage}
            <li><a href="{$childpage.permalink|escape}" title="{$childpage.pagetitle|escape}">{$childpage.pagetitle|escape}</a></li>
            {/foreach}
        </ul>
        {/if}
        {if $staticpage_content}
        <div class="{if $staticpage_articleformat}staticpage_content{else}post{/if}">
            {$staticpage_content}
        </div>
        {/if}
{/if}

{if $staticpage_articleformat}
        </div>
    </div>
{/if}

{if $staticpage_author}
    <div class="staticpage_author">{$CONST.POSTED_BY} {$staticpage_author|escape}</div>
{/if}

    <div class="staticpage_metainfo">
{if $staticpage_lastchange}
    <span class="staticpage_metainfo_lastchange">{$staticpage_lastchange|date_format:"%B %d, %Y"}</span>
{/if}

{if $staticpage_adminlink AND $staticpage_adminlink.page_user}
    | <a class="staticpage_metainfo_editlink" href="{$staticpage_adminlink.link_edit}">{$staticpage_adminlink.link_name|escape}</a>
{/if}
    </div>

{if $staticpage_articleformat}
</div>
{/if}

