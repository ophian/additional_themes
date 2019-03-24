<ol class="commentlist">
{foreach $trackbacks AS $trackback}
   <li id="c{$trackback.id}">
       <div class="comment_mod"></div>

       <div class="comment_text">{if $trackback.type == 'PINGBACK'}{$trackback.type}{else}{$trackback.body|strip_tags|escape:all}{/if}</div>

       <div class="comment_author">
           <strong><a href="{$trackback.url|strip_tags}" {'blank'|xhtml_target}>{$trackback.author|default:$CONST.ANONYMOUS}</a></strong>

           <small>{$trackback.timestamp|formatTime:'%d %b %y'} {$CONST.AT} <a href="#c{$trackback.id}">{$trackback.timestamp|formatTime:'%H:%M'}</a>{if isset($entry.is_entry_owner)} <a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a>{/if}</small>
       </div>

       <div class="clear"></div>
   </li>
{foreachelse}
   <li>{$CONST.NO_TRACKBACKS}</li>
{/foreach}
</ol>