<!-- CONTENT START -->
{if isset($searchresult_tooShort)}
    <h2 class="archive">{$CONST.QUICKSEARCH}</h2>
    <div class="warning serendipity_search_tooshort"><p>{$content_message}</p></div>
{elseif isset($searchresult_error)}
    <h2 class="archive">{$CONST.QUICKSEARCH}</h2>
    <div class="warning serendipity_search_error"><p>{$content_message}</p></div>
{elseif isset($searchresult_noEntries)}
    <h2 class="archive">{$CONST.QUICKSEARCH}</h2>
    <div class="warning serendipity_search_noentries"><p>{$content_message}</p></div>
{elseif isset($searchresult_results)}
    <h2 class="archive">{$CONST.QUICKSEARCH}</h2>
    <div class="serendipity_search_results"><p>{$content_message}</p></div>
{elseif isset($subscribe_confirm_error)}
    <h2 class="archive">{$CONST.ERROR}</h2>
    <div class="serendipity_msg_important comment_subscribe_error">{$content_message}</div>
{elseif isset($subscribe_confirm_success)}
    <h2 class="serendipity_date">{$CONST.SUCCESS}</h2>
    <div class="serendipity_msg_success comment_subscribe_success">{$content_message}</div>
{else}
    {if isset($content_message) AND $content_message|strip == $content_message}<div class="serendipity_content_message">{$content_message}</div>{else}{$content_message|default:''}{/if}
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
