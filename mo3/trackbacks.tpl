<ol class="commentlist">
{foreach $trackbacks AS $trackback}
   <li id="trackback-{$trackback.id}" class="{cycle values="alt,serendipity_comment"}">
      <a id="c{$trackback.id}"></a>
      <small class="commentmetadata">
          <cite><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.author|default:$CONST.ANONYMOUS} &raquo; {$trackback.title}</a></cite> {$CONST.ON} {$trackback.timestamp|formatTime:'%b %d, %H:%M'}: {if NOT empty($entry.is_entry_owner)}(<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>){/if}
      </small>
      {$trackback.body|strip_tags|escape:'htmlall'}
   </li>
{foreachelse}
   <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>