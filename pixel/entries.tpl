{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
            {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}
    <div class="topPost{if $dategroup.is_sticky} sticky{/if}">
        <h2 class="topTitle"><a href="{$entry.link}">{$entry.title}</a></h2>

        <p class="topMeta">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} {$entry.timestamp|formatTime:DATE_FORMAT_ENTRY}
        {if NOT empty($entry.categories)}
            {$CONST.IN} {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
        {/if}
        </p>

        <div class="topContent">
            {$entry.body}
        {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
        {/if}
        {if $is_single_entry AND $entry.is_extended}
            <div id="extended">{$entry.extended}</div>
        {/if}
        </div>
    {if NOT $is_preview}

      {if $entry.has_comments AND NOT $is_single_entry}
        <span class="topComments"><a href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a></span>
      {/if}
      {if NOT $is_single_entry}
        <span class="topMore"><a href="{$entry.link}">{$CONST.PIX_MORE}...</a></span>
      {/if}
        <div class="cleared"></div>
        <div class="serendipity_footerplugins">
        {$entry.add_footer|default:''}
        {$entry.plugin_display_dat}
        </div>
        <div class="cleared"></div>
    {/if}
    </div>
    <br>
  {if NOT empty($entry.is_entry_owner) AND NOT $is_preview}
    <small><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></small>
  {/if}
    <!--
    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
             xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
             xmlns:dc="http://purl.org/dc/elements/1.1/">
    <rdf:Description
             rdf:about="{$entry.link_rdf}"
             trackback:ping="{$entry.link_trackback}"
             dc:title="{$entry.title_rdf|default:$entry.title}"
             dc:identifier="{$entry.rdf_ident}" />
    </rdf:RDF>
    -->
  {if $is_single_entry AND NOT $is_preview}
    {if $CONST.DATA_UNSUBSCRIBED}
    <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|sprintf:$CONST.UNSUBSCRIBE_OK}</p>
    {/if}
    {if $CONST.DATA_TRACKBACK_DELETED}
    <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|sprintf:$CONST.TRACKBACK_DELETED}</p>
    {/if}
    {if $CONST.DATA_TRACKBACK_APPROVED}
    <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|sprintf:$CONST.TRACKBACK_APPROVED}</p>
    {/if}
    {if $CONST.DATA_COMMENT_DELETED}
    <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|sprintf:$CONST.COMMENT_DELETED}</p>
    {/if}
    {if $CONST.DATA_COMMENT_APPROVED}
    <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|sprintf:$CONST.COMMENT_APPROVED}</p>
    {/if}

    <div id="comments">
    {if $entry.trackbacks > 0}
        <h3>{$entry.trackbacks} {$entry.label_trackbacks} {$CONST.PIX_FORTHIS}</h3>
        <div id="serendipity_trackbacklist">
        {serendipity_printTrackbacks entry=$entry.id}
        </div>
    {/if}
    {if NOT empty($entry.is_entry_owner)}
        {if $entry.allow_comments}
        <p><a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a></p>
        {else}
        <p><a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a></p>
        {/if}
    {/if}
    {if $entry.comments > 0}
        <h3 id="commentstitle">{$entry.comments} {$entry.label_comments} {$CONST.PIX_FORTHIS}</h3>

        <p>{$CONST.DISPLAY_COMMENTS_AS}
        {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
            {$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>
        {else}
            <a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED}
        {/if}
        </p>
        <div id="serendipity_commentlist">
        {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
        </div>
    {/if}
        <div id="respond">
            <a id="feedback"></a>
            {foreach $comments_messagestack AS $message}
            <p class="serendipity_msg_important">{$message}</p>
            {/foreach}
        {if $is_comment_added}
            <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:"<a href=\"{if $is_logged_in AND isset($commentform_action)}{$commentform_action}{/if}#c{$smarty.get.last_insert_cid|default:''}\">#{$smarty.get.last_insert_cid|default:''}</a> "}</p>
        {elseif $is_comment_moderate}
            <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:''}<br>{$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
        {elseif NOT $entry.allow_comments}
            <p class="serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
        {else}
            <h3>{$CONST.ADD_COMMENT}</h3>
            {$COMMENTFORM}
        {/if}
        </div><!-- /#respond -->
    </div><!-- /#comments -->
  {/if}
  {if NOT $is_preview}
    <div id="extrastuff">
        <span id="rssleft"><a href="{$serendipityBaseURL}rss.php?version=2.0&amp;type=comments&amp;cid={$entry.id}"><abbr lang="en" title="Really Simple Syndication">RSS</abbr> Feed {$CONST.PIX_FORTHIS} ({$CONST.COMMENTS})</a></span>
        <span id="trackright"><a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a></span>
        <div class="cleared"></div>
    </div><!-- /#extrastuff -->
  {/if}
    {$entry.backend_preview}
    {/foreach}
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <div class="serendipity_overview_noentries">{$CONST.NO_ENTRIES_TO_PRINT}</div>
    {/if}
{/if}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    <div id="nextprevious" class="serendipity_entries_footer">
    {if NOT empty($footer_info)}<div>{$footer_info}</div>{/if}
    {if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&#9668; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}
    {if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &#9658;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}
    </div>
{/if}

    {serendipity_hookPlugin hook="entries_footer"}
<!-- ENTRIES END -->
