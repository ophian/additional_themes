<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if $is_raw_mode == true}
        <div class="rawmode">
{/if}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
    <div class="serendipity_Entry_Date">

        {foreach $dategroup.entries AS $entry}
        {assign var="entry" value=$entry scope="root"}
                    <h3 class="serendipity_title"><a href="{$entry.link}">{$entry.title}</a></h3>

        {if $dategroup.is_sticky}
        <h4 class="serendipity_date">{$CONST.STICKY_POSTINGS}</h3>
        {else}
        <h4 class="serendipity_date">{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</h3>
        {/if}

        <div class="serendipity_entry serendipity_entry_author_{$entry.author|makeFilename} {if $entry.is_entry_owner}serendipity_entry_author_self{/if}">
            {if $entry.categories}
            <span class="serendipity_entryIcon">
            {foreach $entry.categories AS $category}
                {if $category.category_icon}
                    <a href="{$category.category_link}"><img class="serendipity_entryIcon" title="{$category.category_name|escape}{$category.category_description|emptyPrefix}" alt="{$category.category_name|escape}" src="{$category.category_icon}" /></a>
                {/if}
            {/foreach}
            </span>
            {/if}

            <div class="serendipity_entry_body">
                {$entry.body}
            </div>

            {if $entry.is_extended}
            <div class="serendipity_entry_extended"><a id="extended"></a>{$entry.extended}</div>
            {/if}

            {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <br /><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a><br /><br />
            {/if}

            <div class="serendipity_entryFooter">
                {$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a>
                {if $entry.categories}
                   {$CONST.IN} {foreach $entry.categories AS $category}<a href="{$category.category_link}">{$category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
                {/if}

                {if $dategroup.is_sticky}
                    {$CONST.ON}
                {else}
                    {$CONST.AT}
                {/if} <a href="{$entry.link}">{if $dategroup.is_sticky}{$entry.timestamp|formatTime:DATE_FORMAT_ENTRY} {/if}{$entry.timestamp|formatTime:'%H:%M'}</a>

                {if $entry.has_comments}
                    {if $use_popups}
                        | <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_comments} ({$entry.comments})</a>
                    {else}
                        | <a href="{$entry.link}#comments">{$entry.label_comments} ({$entry.comments})</a>
                    {/if}
                {/if}

                {if $entry.has_trackbacks}
                    {if $use_popups}
                        | <a href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                    {else}
                        | <a href="{$entry.link}#trackbacks">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                    {/if}
                {/if}

                {if $entry.is_entry_owner AND NOT $is_preview}
                        | <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>
                {/if}

                {$entry.add_footer}
            </div>
        </div>
        <!--
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                 xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
                 xmlns:dc="http://purl.org/dc/elements/1.1/">
        <rdf:Description
                 rdf:about="{$entry.link_rdf}"
                 trackback:ping="{$entry.link_trackback}"
                 dc:title="{$entry.title}"
                 dc:identifier="{$entry.rdf_ident}" />
        </rdf:RDF>
        -->
        {$entry.plugin_display_dat}

        {if $is_single_entry AND NOT $use_popups AND NOT $is_preview}
            {if $CONST.DATA_UNSUBSCRIBED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|sprintf:$CONST.UNSUBSCRIBE_OK}</div><br />
            {/if}

            {if $CONST.DATA_TRACKBACK_DELETED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|sprintf:$CONST.TRACKBACK_DELETED}</div><br />
            {/if}

            {if $CONST.DATA_TRACKBACK_APPROVED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|sprintf:$CONST.TRACKBACK_APPROVED}</div><br />
            {/if}

            {if $CONST.DATA_COMMENT_DELETED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|sprintf:$CONST.COMMENT_DELETED}</div><br />
            {/if}

            {if $CONST.DATA_COMMENT_APPROVED}
                <br /><div class="serendipity_center serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|sprintf:$CONST.COMMENT_APPROVED}</div><br />
            {/if}

            <div class="serendipity_comments serendipity_section_trackbacks">
                <br />
                <a id="trackbacks"></a>
                <div class="serendipity_commentsTitle">{$CONST.TRACKBACKS}</div>
                    <div class="serendipity_center">
                        <a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
                    </div>
                    <br />
                        {serendipity_printTrackbacks entry=$entry.id}
            </div>
        {/if}

        {if $is_single_entry AND NOT $is_preview}
            <div class="serendipity_comments serendipity_section_comments">
                <br />
                <a id="comments"></a>
                <div class="serendipity_commentsTitle">{$CONST.COMMENTS}</div>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <br />
                    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                {if $entry.is_entry_owner}
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

                <br />
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</div>

                {elseif $is_comment_moderate}

                <br />
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>

                {elseif not $entry.allow_comments}

                <br />
                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>

                {else}

                <br />
                <div class="serendipity_section_commentform">
                    <div class="serendipity_commentsTitle">{$CONST.ADD_COMMENT}</div>
                    {$COMMENTFORM}
                </div>

                {/if}
            </div>
        {/if}

        {$entry.backend_preview}
    {/foreach}
    </div>
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/if}

    <div class="serendipity_entryFooter" style="text-align: center">
    {if $footer_prev_page}
        <a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&#160;&#160;
    {/if}

    {if $footer_info}
        ({$footer_info})
    {/if}

    {if $footer_next_page}
        <a href="{$footer_next_page}">&raquo; {$CONST.NEXT_PAGE}</a>
    {/if}

    {serendipity_hookPlugin hook="entries_footer"}
    </div>
{if $is_raw_mode == true}
        </div>
{/if}
<!-- ENTRIES END -->
