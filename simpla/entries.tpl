<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
    <div class="serendipity_Entry_Date">
        {if $dategroup.is_sticky}
        <h3 class="serendipity_date">{$CONST.STICKY_POSTINGS}</h3>
        {else}
        <h3 class="serendipity_date">{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</h3>
        {/if}

        {foreach $dategroup.entries AS $entry}
        {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}

        <h2 class="serendipity_title"><a href="{$entry.link}">{$entry.title}</a></h2>

        <div class="serendipity_entry serendipity_entry_author_{$entry.author|makeFilename}{if NOT empty($entry.is_entry_owner)} serendipity_entry_author_self{/if}">
        {if NOT empty($entry.categories)}

            <span class="categoryIcon">
        {foreach $entry.categories AS $entry_category}
            {if $entry_category.category_icon}
                <a href="{$entry_category.category_link}"><img class="categoryIcon" title="{$entry_category.category_name|escape}{$entry_category.category_description|emptyPrefix}" alt="{$entry_category.category_name|escape}" src="{$entry_category.category_icon|escape}"></a>
            {/if}
        {/foreach}
            </span>

        {/if}

                <div class="serendipity_entry_body">
                    {$entry.body}

                {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
                    <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
                {/if}
                {if $is_single_entry AND $entry.is_extended}

                    <a id="extended"></a>
                    {$entry.extended}
                {/if}

                </div>
                {if $is_single_entry AND NOT $is_preview}

                <div class="entrymeta">
                    <div class="postinfo">
                        <span class="postedby">{$CONST.ENTRY_POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a></span>

                        {if NOT empty($entry.categories)}
                        {$CONST.FILED_UNDER} {foreach $entry.categories AS $entry_category} <span class="filedto"><a rel="category" href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a></span>{if NOT $entry_category@last}, {/if}{/foreach}.
                        {/if}

                    </div><!-- postinfo ende -->

                    {if $entry.has_comments}
                        {if $use_popups}
                        <a class="commentslink" href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_comments} ({$entry.comments})</a>
                        {else}
                        <a class="commentslink" href="{$entry.link}#comments">{$entry.label_comments} ({$entry.comments})</a>
                        {/if}
                    {/if}

                    {if $entry.has_trackbacks}
                        {if $use_popups}
                        <a class="commentslink" href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                        {else}
                        <a class="commentslink" href="{$entry.link}#trackbacks">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                        {/if}
                    {/if}

                    {if $entry.allow_comments}
                        <br>{$CONST.LEAVE_RESPONSE|sprintf:'<a href="#serendipity_CommentForm">':'</a>':"<a href=\"{$entry.link}\">":'</a>'}
                        {if $entry.moderate_comments}
                            {$CONST.SUBJECT_TO_MODERATION}
                        {/if}
                    {else}
                        {$CONST.COMMENTS_CLOSED}
                    {/if}

                </div><!-- entrymeta ende -->

                {else}
            {if NOT $is_preview}

                <div class="entrymeta">
                    <div class="postinfo">
                        <span class="postedby">{$CONST.ENTRY_POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a></span>

                        {if NOT empty($entry.categories)}
                        {$CONST.FILED_UNDER} {foreach $entry.categories AS $entry_category} <span class="filedto"><a rel="category" href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a></span>{if NOT $entry_category@last}, {/if}{/foreach}.
                        {/if}

                    </div><!-- postinfo ende -->

                {if $entry.has_comments}
                    {if $use_popups}
                        <a class="commentslink" href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_comments} ({$entry.comments})</a>
                    {else}
                        <a class="commentslink" href="{$entry.link}#comments">{$entry.label_comments} ({$entry.comments})</a>
                    {/if}
                {/if}

                {if $entry.has_trackbacks}
                    {if $use_popups}
                        <a class="commentslink" href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                    {else}
                        <a class="commentslink" href="{$entry.link}#trackbacks">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                    {/if}
                {/if}

                </div><!-- entrymeta ende -->

                {if NOT empty($entry.is_entry_owner)}
                    <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>
                {/if}
            {/if}

                {/if}{* else end *}

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

        {if $is_single_entry AND NOT $is_preview}

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

            <div class="serendipity_comments serendipity_section_trackbacks">
                <a id="trackbacks"></a>
                <h3 id="trackbacks">{$CONST.TRACKBACKS}</h3>
                <div class="serendipity_center">
                    <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a>
                </div>
                <ol id="serendipity_trackbacklist" class="commentlist">
                {serendipity_printTrackbacks entry=$entry.id}
                </ol>
            </div>

            <div class="serendipity_comments commentsblock serendipity_section_comments">
                <a id="comments"></a>
                <h3 id="comments">{$CONST.COMMENTS}</h3>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <ol id="serendipity_commentlist" class="commentlist">
                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
                </ol>

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

                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:"<a href=\"{if $is_logged_in AND isset($commentform_action)}{$commentform_action}{/if}#c{$smarty.get.last_insert_cid|default:''}\">#{$smarty.get.last_insert_cid|default:''}</a> "}</div>
            {elseif $is_comment_moderate}

                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:''}<br>{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>
            {elseif NOT $entry.allow_comments}

                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>
            {else}

                <h3 id="respond">{$CONST.ADD_COMMENT}</h3>
                {$COMMENTFORM}
            {/if}
            </div><!-- commentsblock end -->
        {/if}

        {$entry.backend_preview}
    {/foreach}
    </div>
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <h4>{$CONST.NO_ENTRIES_TO_PRINT}</h4>
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
