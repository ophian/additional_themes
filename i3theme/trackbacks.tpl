<ol class="commentlist">
{foreach $trackbacks AS $trackback}
   <li id="trackback-{$trackback.id}" class="{cycle values="alt,even"}">
       <cite>{$trackback.author|default:$CONST.ANONYMOUS}</cite><br />
       <small class="commentmetadata">
           <a id="c{$trackback.id}">{$trackback.timestamp|formatTime:'%x %X'}</a>
           {if NOT empty($entry.is_entry_owner)}&bull; <a href="{$trackback.link_delete}">{$CONST.DELETE}</a>{/if}
       </small>
       <p><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a><br />
          {$trackback.body|strip_tags|escape:'htmlall'}</p>
   </li>
{foreachelse}
   <li class="alt">{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>
