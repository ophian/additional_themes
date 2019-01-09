<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
    <div class="serendipity_Entry_Date">
        {if $dategroup.is_sticky}
         {else}
         {/if}

        {foreach $dategroup.entries AS $entry}
        {assign var="entry" value=$entry scope="root"}
        <h3 class="serendipity_title"><a href="{$entry.link}">{$entry.title|default:$entry.id}</a></h3>

        <div class="serendipity_entry serendipity_entry_author_{$entry.author|makeFilename} {if $entry.is_entry_owner}serendipity_entry_author_self{/if}">
            <div class="serendipity_entry_body">
                {$entry.body}

        {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <br /><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a>
            {/if}</div>
            {if $entry.is_extended}
            <div class="serendipity_entry_extended"><a id="extended"></a><br />{$entry.extended}</div>
            {/if}

            <div class="serendipity_entryFooter">
            {$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} {$entry.timestamp|formatTime:DATE_FORMAT_ENTRY_ANDREAS06} {if $entry.categories}
                   {$CONST.IN} {foreach $entry.categories AS $category} <a href="{$category.category_link}">{$category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}.{/if} {if $entry.is_entry_owner AND NOT $is_preview}&#160;&#160;<a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}<br />
            {if NOT $is_single_entry AND NOT $entry.is_extended}
                 {if $entry.has_comments}
                    {if $use_popups}
                        <a class="comment_link" href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{if $entry.comments == 0}{$CONST.BE_FIRST_TO_COMMENT}{else}{$entry.comments} {$entry.label_comments}{/if}</a>
                    {else}
                       <a class="comment_link" href="{$entry.link}#comments">{if $entry.comments == 0}{$CONST.BE_FIRST_TO_COMMENT}{else}{$entry.comments} {$entry.label_comments}{/if}</a>
                    {/if}
                {/if}
                {if $entry.has_trackbacks}
                    {if $use_popups}
                        &#160;&#160;<a class="trackback_link"  href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.trackbacks} {$entry.label_trackbacks}</a>
                    {else}
                        &#160;&#160;<a class="trackback_link" href="{$entry.link}#trackbacks">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
                    {/if}
                {/if}
        {/if}
        {$entry.add_footer}
            </div>
        {$entry.plugin_display_dat}
        </div>


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
        {/if}

        {if $is_single_entry AND NOT $is_preview}

                <br />
                <a id="trackbacks"></a>
                <h3 class="serendipity_commentsTitle">{if $entry.trackbacks == 0}{$CONST.TRACKBACKS}{else}{$entry.trackbacks} {if $entry.trackbacks >= 2}{$CONST.TRACKBACKS}{else}{$CONST.TRACKBACK}{/if}{/if}</h3>
                <div class="serendipity_comments">
                    <div class="serendipity_center">
                        <a class="permalink" rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
                    </div>
                    <br />
                        {serendipity_printTrackbacks entry=$entry.id}
                </div>

                <br />
                <a id="comments"></a>
                <h3 class="serendipity_commentsTitle">{if $entry.comments == 0}{$CONST.COMMENTS}{else}{$entry.comments} {if $entry.comments >= 2}{$CONST.COMMENTS}{else}{$CONST.COMMENT}{/if}{/if}</h3>
                <div class="serendipity_comments">
                    <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                    {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                        ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                    {else}
                        (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                    {/if}
                    </div>
                    <br />
                </div>
                <div class="serendipity_comments">
                    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
                </div>
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
                <h3 class="serendipity_commentsTitle">{$CONST.ADD_COMMENT}</h3>
                {$COMMENTFORM}

                {/if}

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

    <div class="serendipity_pageFooter" style="text-align: center">
      {if $footer_info}
        {if $footer_prev_page}
        <a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&#160;&#160;
        {else}
        <span class="grey">&laquo; {$CONST.PREVIOUS_PAGE}</span>&#160;&#160;
        {/if}
    {else}
    {/if}

    {if $footer_info}
        ({$footer_info})
    {/if}

    {if $footer_info}
        {if $footer_next_page}
        &#160;&#160;<a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a>
        {else}
        &#160;&#160;<span class="grey">{$CONST.NEXT_PAGE} &raquo;</span>
        {/if}
    {else}
    {/if}


    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->
