<div id="staticpage_{$staticpage_pagetitle|makeFilename}" class="clearfloat serendipity_staticpage{if $staticpage_articleformat} serendipity_entry post{/if}">
    <h2>{$staticpage_headline|escape}</h2>

{if $staticpage_pass AND $staticpage_form_pass != $staticpage_pass}
    <div class="staticpage_password">{$CONST.STATICPAGE_PASSWORD_NOTICE}</div>
    <form class="staticpage_password_form" action="{$staticpage_form_url}" method="post">
    <div>
        <input type="password" name="serendipity[pass]" value="" />
        <input type="submit" name="submit" value="{$CONST.GO}" class="button" />
    </div>
    </form>
{else}
    <div class="staticpage_precontent">{$staticpage_precontent}</div>

    {if is_array($staticpage_childpages)}
    <ul id="staticpage_childpages">
    {foreach $staticpage_childpages AS $childpage}
       <li><a href="{$childpage.permalink|escape}" title="{$childpage.pagetitle|escape}">{$childpage.pagetitle|escape}</a></li>
    {/foreach}
    </ul>
    {/if}

    <div class="staticpage_content entry">{$staticpage_content}</div>

    <small>{if $staticpage_author}{$CONST.POSTED_BY} {$staticpage_author|escape}{/if}{if $staticpage_lastchange} &bull; {$staticpage_lastchange|date_format:"%Y-%m-%d"}{/if}{if $staticpage_adminlink AND $staticpage_adminlink.page_user} &bull; <a class="staticpage_metainfo_editlink" href="{$staticpage_adminlink.link_edit}">{$staticpage_adminlink.link_name|escape}</a>{/if}</small>
{/if}
</div>

{if $staticpage_navigation AND $staticpage_shownavi}
    <table class="staticpage_navigation">
        <tr>
            <td class="staticpage_navigation_left"><a href="{$staticpage_navigation.prev.link}" title="prev">{$staticpage_navigation.prev.name|escape}</a></td>
            <td class="staticpage_navigation_center"><a href="{$staticpage_navigation.top.link}" title="top">{$staticpage_navigation.top.name|escape}</a></td>
            <td class="staticpage_navigation_right"><a href="{$staticpage_navigation.next.link}" title="next">{$staticpage_navigation.next.name|escape}</a></td>
        </tr>
    <tr>
        <td class="staticpage_navigation_center">
        {foreach $staticpage_navigation.crumbs AS $crumb}
            {if NOT $crumb@first}&raquo;{/if}<a href="{$crumb.link}">{$crumb.name|escape}</a>
        {/foreach}
        </td>
    </tr>
    </table>
{/if}
