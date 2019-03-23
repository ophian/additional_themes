<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
    <div class="serendipity_Entry_Date">
        {foreach $dategroup.entries AS $entry}
        {assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" *}
        <h2 class="serendipity_title">
        {if $dategroup.is_sticky}
            <span>{$CONST.STICKY_POST}</span>
        {else}
            <span title="{$entry.timestamp|formatTime:DATE_FORMAT_ENTRY}"><time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:"%b %d"}</time></span>
        {/if} <a href="{$entry.link}">{$entry.title|default:$entry.id}</a>
        </h2>
        <div class="serendipity_entry serendipity_entry_author_{$entry.author|makeFilename}{if NOT empty($entry.is_entry_owner)} serendipity_entry_author_self{/if}">
            {if NOT empty($entry.categories)}
            <span class="serendipity_entryIcon">
            {foreach $entry.categories AS $category}
                {if $category.category_icon}
                    <a href="{$category.category_link}"><img class="serendipity_entryIcon" title="{$category.category_name|escape}{$category.category_description|emptyPrefix}" alt="{$category.category_name|escape}" src="{$category.category_icon}"></a>
                {/if}
            {/foreach}
            </span>
            {/if}
            <div class="serendipity_entry_body">
                {$entry.multilingual_footer|default:''}
                {$entry.body}
                {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}

                <p><a href="{$entry.link}#extended">{$CONST.READ_MORE}</a></p>
                {/if}

            </div>
            {if $entry.is_extended}

            <div class="serendipity_entry_extended">
                <a id="extended"></a>
                {$entry.extended}
            </div>
            {/if}
        {if NOT $is_preview}

        <div class="serendipity_entryFooter">
            {$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a>
                {if NOT empty($entry.categories)}
                    {$CONST.IN} {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
                {/if}
                {if $entry.has_comments}
                    {if $use_popups}
                         {$entry.label_comments}: <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">({$entry.comments})</a>
                    {else}
                         {$entry.label_comments}: <a href="{$entry.link}#comments">({$entry.comments})</a>
                    {/if}
                {/if}

                {if $entry.has_trackbacks}
                    {if $use_popups}
                         {$entry.label_trackbacks}: <a href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">({$entry.trackbacks})</a>
                    {else}
                         {$entry.label_trackbacks}: <a href="{$entry.link}#trackbacks">({$entry.trackbacks})</a>
                    {/if}
                {/if}
                {if NOT empty($entry.is_entry_owner)}
                       - <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>
                {/if}

                {$entry.add_footer|default:''}
            </div>
        {/if}
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

        {/if}

        {if $is_single_entry AND NOT $is_preview}
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
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <div id="serendipity_commentlist">
                {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
                </div>

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

                {elseif NOT $entry.allow_comments}

                <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>

                {else}

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
    <div class="serendipity_overview_noentries">{$CONST.NO_ENTRIES_TO_PRINT}</div>
    {/if}
{/if}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    <div class="serendipity_entries_footer">
    {if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&#9668; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}
    {if NOT empty($footer_info)}({$footer_info}){/if}
    {if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &#9658;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}
    </div>
{/if}

    {serendipity_hookPlugin hook="entries_footer"}

<!-- ENTRIES END -->
