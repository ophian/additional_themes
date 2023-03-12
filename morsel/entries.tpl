<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        <div class="morselDate">
            <h3>{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</h3>
            {foreach $dategroup.entries AS $entry}
            {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}
            <div class="aMorsel">
                <h4><a href="{$entry.link}" rel="external">{$entry.title}</a></h4>
                <div class="morselBody">
                    {$entry.body}
                {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
                    <p><a href="{$entry.link}#extended" rel="external">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
                {else}
                    {$entry.extended}
                {/if}
                </div><!-- morselBody -->

                <div class="morselFooter">
            {if NOT $is_preview}
                {$CONST.POSTED_BY} <a href="{$entry.link_author}" rel="external">{$entry.author}</a>
                {if NOT empty($entry.categories)}
                    {$CONST.IN} {foreach $entry.categories AS $category}<a href="{$category.category_link}" rel="external">{$category.category_name|escape}</a>{if NOT $category@last}, {/if}{/foreach}
                {/if}
                {
                $CONST.AT} <a href="{$entry.link}" rel="external">{$entry.timestamp|formatTime:'%H:%M'}</a>

                {if $entry.has_comments}
                    | <a href="{$entry.link}#comments" rel="external">{$entry.label_comments} ({$entry.comments})</a>
                {/if}

                {if $entry.has_trackbacks}
                    | <a href="{$entry.link}#trackbacks" rel="external">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                {/if}

                {if NOT empty($entry.is_entry_owner)}
                    | <a href="{$entry.link_edit}" rel="external">{$CONST.EDIT_ENTRY}</a>
                {/if}

                {$entry.add_footer|default:''}
                </div>
            {/if}
                {$entry.plugin_display_dat}
            </div> <!-- aBody -->
            {$entry.plugin_display_dat}

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
                <div class="serendipity_commentsTitle">{$CONST.TRACKBACKS}</div>
                <div class="serendipity_center">
                    <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a>
                </div>
                <div id="serendipity_trackbacklist">
                {serendipity_printTrackbacks entry=$entry.id}
                </div>
            </div>

            <div class="serendipity_comments serendipity_section_comments">
                <a id="comments"></a>
                <div class="serendipity_commentsTitle">{$CONST.COMMENTS}</div>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a href="{$entry.link_viewmode_linear}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <div id="serendipity_commentlist">
                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
                </div>

                {if NOT empty($entry.is_entry_owner)}
                    {if $entry.allow_comments}
                    <div class="serendipity_center">(<a href="{$entry.link_deny_comments} rel="external"">{$CONST.COMMENTS_DISABLE}</a>)</div>
                    {else}
                    <div class="serendipity_center">(<a href="{$entry.link_allow_comments}" rel="external">{$CONST.COMMENTS_ENABLE}</a>)</div>
                    {/if}
                {/if}
                <a id="feedback"></a>

                {foreach $comments_messagestack AS $message}
                <div class="serendipity_center serendipity_msg_important">{$message}</div>
                {/foreach}

                {if $is_comment_added}

                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:"<a href=\"{if $is_logged_in}$commentform_action}{/if}#c{$smarty.get.last_insert_cid}\">#{$smarty.get.last_insert_cid}</a> "}</div>

                {elseif $is_comment_moderate}

                <!-- Entires Trackback -->
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:''}<br>{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>

                {elseif NOT $entry.allow_comments}

                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>

                {else}

                <div class="serendipity_commentsTitle">{$CONST.ADD_COMMENT}</div>
                {$COMMENTFORM}

                {/if}
            </div>
        {/if}

        {$entry.backend_preview}
    {/foreach}
    </div>
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <div class="serendipity_overview_noentries">{$CONST.NO_ENTRIES_TO_PRINT}</div>
    {/if}
{/if}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    <div class="serendipity_entries_footer pager">
    {if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&laquo; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}
    {if NOT empty($footer_info)}({$footer_info}){/if}
    {if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &raquo;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}
    </div>
{/if}

    {serendipity_hookPlugin hook="entries_footer"}

<!-- ENTRIES END -->
