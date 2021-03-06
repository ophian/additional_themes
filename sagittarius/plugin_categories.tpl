{if $is_form}
<form id="serendipity_category_form" action="{$form_url}" method="post">
{/if}
    <ul class="subnav">
{foreach $categories AS $plugin_category}
        <li class="cat-item">
        {if NOT empty($category_image)}
            <a class="serendipity_xml_icon" href="{$plugin_category.feedCategoryURL}"><img src="{$category_image}" alt="XML"></a>
        {/if}

        {if $is_form}
            <input type="checkbox" name="serendipity[multiCat][]" value="{$plugin_category.categoryid}">
        {/if}
            <a href="{$plugin_category.categoryURL}" title="{$plugin_category.category_description|escape}">{$plugin_category.category_name|escape}</a>
        </li>
{/foreach}
    </ul>
{if $is_form}
    <div class="category_submit"><input type="submit" name="serendipity[isMultiCat]" value="{$CONST.GO}"></div>
{/if}
{if $is_form}
</form>
{/if}
