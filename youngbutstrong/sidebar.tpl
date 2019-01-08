{foreach $plugindata AS $item}
{if NOT empty($item.content)}
{if $item.title != ""}
					<h2 class="box_right_top">{$item.title}</h2>
{/if}

					<div class="box_right">
{$item.content}
					</div>
{/if}
{/foreach}
