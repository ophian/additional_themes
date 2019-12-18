<div class="comment-head">
      <a id="trackbacks"></a>
<ol id="comments" class="pingback">
{foreach $trackbacks AS $trackback}
    <a id="c{$trackback.id}"></a>
    <li class="pingback">
        <cite>
            <span class="author">{$trackback.timestamp|formatTime:'%b %d, %H:%M'}</span>
        </cite>
        <div class="content">
            <em><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.title}</a></em><br />
            {$trackback.body|strip_tags|escape:all}<br />
            {if NOT empty($entry.is_entry_owner)}(<a href="{$trackback.link_delete}">{$CONST.DELETE}</a>){/if}
        </div>
        <div class="clear"></div>
     </li>
{/foreach}
</ol>
</div>
