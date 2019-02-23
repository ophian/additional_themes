<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
            {assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" *}
    <div class="post">
        <h3><a class="title" href="{$entry.link}" rel="bookmark">{$entry.title|default:$entry.id}</a></h3>

        <small>{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> &bull; {$entry.timestamp|formatTime:DATE_FORMAT_ENTRY}{if NOT empty($entry.categories)} &bull; {$CONST.CATEGORY}: {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}{/if}{if $dategroup.is_sticky} &bull; {$CONST.STICKY_POSTINGS}{/if}{if NOT empty($entry.is_entry_owner) AND NOT $is_preview} &bull; <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}</small>

        <div class="entry">
            {$entry.body}
{if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
{/if}
{if $is_single_entry AND $entry.is_extended}

            <div class="serendipity_entry_extended">
                <a id="extended"></a>
                {$entry.extended}
            </div>
{/if}
            {if NOT $is_preview}{$entry.add_footer|default:''}{/if}
        </div>
    </div>

    {if NOT $is_preview}
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
        {$entry.plugin_display_dat}
    {/if}

        {if $is_single_entry AND NOT $use_popups AND NOT $is_preview}
            {if $CONST.DATA_UNSUBSCRIBED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|sprintf:$CONST.UNSUBSCRIBE_OK}</div>
            {/if}

            {if $CONST.DATA_TRACKBACK_DELETED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|sprintf:$CONST.TRACKBACK_DELETED}</div>
            {/if}

            {if $CONST.DATA_TRACKBACK_APPROVED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|sprintf:$CONST.TRACKBACK_APPROVED}</div>
            {/if}

            {if $CONST.DATA_COMMENT_DELETED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|sprintf:$CONST.COMMENT_DELETED}</div>
            {/if}

            {if $CONST.DATA_COMMENT_APPROVED}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|sprintf:$CONST.COMMENT_APPROVED}</div>
            {/if}

            <div class="serendipity_section_trackbacks">
                <a id="trackbacks"></a>
                <h3 id="trackbacks">{$entry.trackbacks} {$CONST.TRACKBACKS}</h3>

                <div class="serendipity_center">
                    <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a>
                </div>
                <div id="serendipity_trackbacklist">
                    {serendipity_printTrackbacks entry=$entry.id}
                </div>
            </div>
        {/if}

        {if $is_single_entry AND NOT $is_preview}
            <div class="serendipity_section_comments">
                <a id="comments"></a>
                <h3 id="comments">{$entry.comments} {$CONST.COMMENTS}</h3>

                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>

                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                {if NOT empty($entry.is_entry_owner)}
                    {if $entry.allow_comments}
                    <div class="serendipity_center">(<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)</div>
                    {else}
                    <div class="serendipity_center">(<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)</div>
                    {/if}
                {/if}
                <a id="feedback"></a>

                {foreach $comments_messagestack AS $message}
                <div class="serendipity_center serendipity_msg_important">{$message}</div>
                {/foreach}

                {if $is_comment_added}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</div>
                {elseif $is_comment_moderate}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br>{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>
                {elseif not $entry.allow_comments}
                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>
                {else}
                <div class="serendipity_section_commentform">
                    <h3 id="respond">{$CONST.ADD_COMMENT}</h3>
                    {$COMMENTFORM}
                </div>
                {/if}
            </div>
        {/if}
        {$entry.backend_preview}
    {/foreach}
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/if}

    <div class="serendipity_entryFooter">
{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    {if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&#9668; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}
    {if NOT empty($footer_info)}({$footer_info}){/if}
    {if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &#9658;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}
{/if}

    {serendipity_hookPlugin hook="entries_footer"}
    </div>

<!-- ENTRIES END -->
