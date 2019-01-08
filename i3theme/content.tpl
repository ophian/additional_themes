<!-- CONTENT START -->
{if NOT empty($searchresult_tooShort)}
<h2>{$CONST.QUICKSEARCH}</h2>
<p class="serendipity_search_tooshort">{$content_message}</p>
{elseif NOT empty($searchresult_error)}
<h2>{$CONST.QUICKSEARCH}</h2>
<p class="serendipity_search_error">{$content_message}</p>
{elseif NOT empty($searchresult_noEntries)}
<h2>{$CONST.QUICKSEARCH}</h2>
<p class="serendipity_search_noentries">{$content_message}</p>
{elseif NOT empty($searchresult_results)}
<h2>{$CONST.QUICKSEARCH}</h2>
<p class="serendipity_search_results">{$content_message}</p>
{else if NOT empty($content_message)}
<p class="serendipity_content_message">{$content_message}</p>
{/if}
{$ENTRIES}
{$ARCHIVES}
<!-- CONTENT END -->
