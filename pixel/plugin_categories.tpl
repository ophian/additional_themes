{if $is_form}
<form id="serendipity_category_form" action="{$form_url}" method="post">
{/if}
<ul>
{foreach $categories AS $plugin_category}
    <li id="cat-{$plugin_category.categoryid}" class="cat-level-{$plugin_category.catdepth}">
        {if $is_form}
        <input type="checkbox" name="serendipity[multiCat][]" value="{$plugin_category.categoryid}">
        {/if}
        {if !empty($category_image)}
        <a href="{$plugin_category.feedCategoryURL}"><img src="{$category_image}" alt="XML"></a>
        {/if}
        <a href="{$plugin_category.categoryURL}" title="{$plugin_category.category_description|escape}">{$plugin_category.category_name|escape}</a>
    </li>
{/foreach}
</ul>
{if $is_form}
    <input id="category_submit" type="submit" name="serendipity[isMultiCat]" value="{if isset($smarty.get.serendipity.category)}{$CONST.RESET_FILTERS}{else}{$CONST.GO}{/if}">
</form>
{/if}
