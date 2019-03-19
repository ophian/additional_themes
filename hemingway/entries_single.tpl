<!-- ENTRIES START -->
    <div class="primary">
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}<!-- end of plugin hook -->
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
{foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}

        <h1>{$entry.title|default:$entry.id}</h1>
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
        <!-- entry.add.footer begins -->
        {$entry.add_footer|default:''}
        {$entry.plugin_display_dat}
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
{/if}

    <hr class="hide">
    <div class="secondary">
        <h2>About this entry</h2>
        <div class="featured">
            <p>You&rsquo;re currently reading &ldquo;{$entry.title|default:$entry.id},&rdquo; an entry on {$blogTitle}</p>
            <dl>
                <dt>{$CONST.POSTED_BY}:</dt>
                <dd><a href="{$entry.link_author}">{$entry.author}</a>
                {if $dategroup.is_sticky}{$CONST.ON}{else}{$CONST.AT}{/if}
                <a href="{$entry.link}">{if NOT $dategroup.is_sticky}{$dategroup.date|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')}{/if}</a> / {$entry.timestamp|formatTime:'%H:%M'}<br>Last updated {$entry.last_modified|formatTime:($HEMINGWAY_DATE|default:'%d.%m.%Y')}</dd>
            </dl>
            {if NOT empty($entry.categories)}
            <dl>
                <dt>{$CONST.CATEGORY}:</dt>
                <dd>
                {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
                </dd>
            </dl>
            {/if}
            {if NOT empty($entry.is_entry_owner) AND NOT $is_preview}<dl><dd><a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a></dd></dl>{/if}
        </div>
    {serendipity_printSidebar side="detail"}
    </div>
    <div class="clear"></div>
</div></div><!-- end Primary -->

<hr class="hide">
<div id="secondary">
    <div class="inside">
        <div class="comment-head">
            <h2>{if $entry.comments == 0}{$CONST.NO_COMMENTS}{else}{$entry.comments} {if $entry.comments >= 2}{$CONST.COMMENTS}{else}{$CONST.COMMENT}{/if}{/if}</h2>
            <span class="details"><a href="#comment-form">Jump to comment form</a> | <a href="{$serendipityBaseURL}/feeds/comments.rss2">{$CONST.COMMENTS} RSS</a> | <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape}">{$CONST.TRACKBACK_SPECIFIC}</a></span></div>

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
        {/if}

        {if $is_single_entry AND NOT $is_preview}
            {if $entry.trackbacks >= 1}{serendipity_printTrackbacks entry=$entry.id}{/if}

                 <a id="comments"></a>
                 <p>
            {if NOT $entry.comments == 0}
                {$CONST.DISPLAY_COMMENTS_AS} {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}{$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
            {else}
                (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
            {/if}
                </p>
                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
        {/if}

            {if NOT empty($entry.is_entry_owner)}
                <p>
                {if $entry.allow_comments}
                    (<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)
                {else}
                    (<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)
                {/if}
                </p>
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
        {/if}
    {$entry.backend_preview}
    {serendipity_hookPlugin hook="entries_footer"}
    {/foreach}
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}<div class="serendipity_overview_noentries">{$CONST.NO_ENTRIES_TO_PRINT}</div>{/if}
{/if}
    {if NOT empty($footer_info)}({$footer_info}){/if}
{if $is_single_entry}
{elseif NOT empty($is_static_page)}<!-- last block in entries_single.tpl -->
</div>
<hr class="hide">
    <div class="secondary">
        <h2>{$template_option.about_title}</h2>
        <div class="featured">
            <p>{$template_option.about} {if $template_option.aboutpageurl != "#"}<a href="{$template_option.aboutpageurl}"> More &raquo;</a>{/if}</p>
        </div>
    </div>
{/if}
