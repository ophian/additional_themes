<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
        {assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" *}

        <div class="post-info">
            <h2 class="serendipity_title">
        {if $dategroup.is_sticky}
            <span class="post-date">{$CONST.STICKY_POSTINGS}
        {else}
            <span class="post-date">{$dategroup.date|formatTime:'%b %e:'}
        {/if}
            <a href="{$entry.link}">{$entry.title|default:$entry.body|truncate:37:" ..."}</a>
            </span>
            </h2>
        </div>
        <div class="serendipity_entry_body">
            {$entry.body}

        {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
        {/if}

        </div>

        {if $is_single_entry AND $entry.is_extended}
        <div class="serendipity_entry_extended">
            <a id="extended"></a>
            {$entry.extended}
        </div>
        {/if}
    {if NOT $is_preview}

        <div class="serendipity_entryFooterTop"></div>
        <div class="serendipity_entryFooterMain">
            <a href="{$entry.link_author}"><img src="{serendipity_getFile file="img/icons/user.gif"}">{$CONST.POSTED_BY}: {$entry.author}</a> {$CONST.IN} <img src="{serendipity_getFile file="img/icons/category.gif"}">:
        {if NOT empty($entry.categories)}
            {foreach $entry.categories AS $category}<a href="{$category.category_link}"> {$category.category_name|escape}</a>{if NOT $category@last}, {/if}{/foreach}<br>
        {/if}
        {if $entry.has_comments}
            {if $use_popups}
            <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_comments} ({$entry.comments})</a>
            {else}
            <a href="{$entry.link}#comments"><img src="{serendipity_getFile file="img/icons/comment.gif"}">{$entry.label_comments}: [{$entry.comments}]</a>
            {/if}
        {/if}
        {if $entry.has_trackbacks}
            {if $use_popups}
            <a href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
            {else}
            <a href="{$entry.link}#trackbacks"><img src="{serendipity_getFile file="img/icons/trackback.gif"}">{$entry.label_trackbacks}: [{$entry.trackbacks}]</a>
            {/if}
        {/if}

        {if NOT empty($entry.is_entry_owner)}
            <a href="{$entry.link_edit}"><img src="{serendipity_getFile file="img/icons/edit.gif"}">: {$CONST.EDIT_ENTRY}</a>
        {/if}
            {$entry.add_footer|default:''}
        </div>
        <div class="serendipity_entryFooterBottom">

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
        </div>
        {$entry.plugin_display_dat}
        <div class="post-footer">&nbsp;</div>
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

            <div class="serendipity_comments">
                <a id="trackbacks"></a>
                <div class="serendipity_commentsTitle">{$CONST.TRACKBACKS}</div>
                <div class="serendipity_center">
                    <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a>
                </div>
                <div id="serendipity_trackbacklist">
                    {serendipity_printTrackbacks entry=$entry.id}
                </div>
            </div>
        {/if}

        {if $is_single_entry AND NOT $is_preview}
            <div class="serendipity_comments">
                <a id="comments"></a>
                <div class="serendipity_commentsTitle">{$CONST.COMMENTS}</div>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
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

                <div class="serendipity_commentsTitle">{$CONST.ADD_COMMENT}</div>
                {$COMMENTFORM}

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

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    <div class="serendipity_entries_footer">
    {if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&#9668; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}
    {if NOT empty($footer_info)}{$footer_info}{/if}
    {if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &#9658;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}
    </div>
{/if}

    {serendipity_hookPlugin hook="entries_footer"}
<!-- ENTRIES END -->
