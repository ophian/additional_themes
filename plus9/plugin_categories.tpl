
{foreach $categories AS $plugin_category}
   <li><a href="{$plugin_category.categoryURL}">{$plugin_category.category_name|escape}</a></li>
{/foreach}

