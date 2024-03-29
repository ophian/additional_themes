{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
        {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}
        <div class="clearfix"></div>
        <div class="content_date">
            <div class="content_month">{$entry.timestamp|formatTime:"%b"}</div>
            {$entry.timestamp|formatTime:"%d"}
        </div>
        <div class="content_post">
            <h2 class="content_title" id="post-{$entry.id}"><a href="{$entry.link}">{$entry.title}</a></h2>
            <hr />
            <div class="post_info">
                <div class="content_post_cat">
                {if NOT empty($entry.categories)}
                    {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
                {else}
                    Uncategorized
                {/if}
                </div>
                <div class="content_post_comments"><img src="{serendipity_getFile file="images/comments.gif"}" alt="" /><a href="{$entry.link}#comments">{$entry.comments} comments</a></div>
                <div class="content_post_body">
                {$entry.body}
                {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
                    <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
                {/if}
                {if $is_single_entry AND $entry.is_extended}
                    <a id="extended"></a>
                    {$entry.extended}
                {/if}
                </div>
            </div>
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
                    <h3><a id="trackbacks">{$CONST.TRACKBACKS}</a></h3>
                    <a href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape:"html"}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
                    <ol id="serendipity_trackbacklist" class="commentlist">
                    {serendipity_printTrackbacks entry=$entry.id}
                    </ol>
                </div>

                <div class="serendipity_comments serendipity_section_comments">
                    <h3><a id="comments">{$CONST.COMMENTS}</a></h3>
                    <p>{$CONST.DISPLAY_COMMENTS_AS}
                    {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                        ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a rel="nofollow" href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                    {else}
                        (<a rel="nofollow" href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                    {/if}
                    </p>
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
                    <h3>{$CONST.ADD_COMMENT}</h3>
                    {$COMMENTFORM}

                {/if}
                </div>
            {/if}
            {$entry.backend_preview}
        </div>
        {/foreach}
    {/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
        <div class="serendipity_overview_noentries">{$CONST.NO_ENTRIES_TO_PRINT}</div>
    {/if}
{/if}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    <div class="navigation">
    {if $footer_prev_page}
        <a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&#160;&#160;
    {/if}

    {if $footer_info}
        ({$footer_info})
    {/if}

    {if $footer_next_page}
        <a href="{$footer_next_page}">&raquo; {$CONST.NEXT_PAGE}</a>
    {/if}
    </div>
{/if}

    {serendipity_hookPlugin hook="entries_footer"}
