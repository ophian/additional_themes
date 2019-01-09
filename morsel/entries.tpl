<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        <div class="morselDate">
            <h3>{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</h3>
            {foreach $dategroup.entries AS $entry}
            {assign var="entry" value=$entry scope="root"}
            <div class="aMorsel">
                <h4><a href="{$entry.link}" rel="external">{$entry.title}</a></h4>
                <div class="morselBody">
                    {$entry.body}
                {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
                    <br /><a href="{$entry.link}#extended" rel="external">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a><br /><br />
                {else}
                    {$entry.extended}
                {/if}
                </div><!-- morselBody -->

                <div class="morselFooter">
                {$CONST.POSTED_BY} <a href="{$entry.link_username}" rel="external">{$entry.username}</a>
                {if $entry.categories}
                    {$CONST.IN} {foreach $entry.categories AS $category}<a href="{$category.category_link}" rel="external">{$category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
                {/if}
                {
                $CONST.AT} <a href="{$entry.link}" rel="external">{$entry.timestamp|formatTime:'%H:%M'}</a>

                {if $entry.has_comments}
                    | <a href="{$entry.link}#comments" rel="external">{$entry.label_comments} ({$entry.comments})</a>
                {/if}

                {if $entry.has_trackbacks}
                    | <a href="{$entry.link}#trackbacks" rel="external">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                {/if}

                {if $entry.is_entry_owner AND NOT $is_preview}
                    | <a href="{$entry.link_edit}" rel="external">{$CONST.EDIT_ENTRY}</a>
                {/if}

                {$entry.add_footer}
                </div>
                {$entry.plugin_display_dat}
            </div> <!-- aBody -->
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

            <div class="serendipity_comments">
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
            <div class="serendipity_comments">
                <br />
                <a id="comments"></a>
                <div class="serendipity_commentsTitle">{$CONST.COMMENTS}</div>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a href="{$entry.link_viewmode_linear}#comments" rel="nofollow">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <br />
                    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                {if $entry.is_entry_owner}
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

                <br />
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}</div>

                {elseif $is_comment_moderate}

                <br />
                <!-- Entires Trackback -->
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>

                {elseif not $entry.allow_comments}

                <br />
                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>

                {else}

                <br />
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
    <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/if}

</div> <!-- should close morselDate -->
{/foreach}
<!-- ENTRIES END -->
