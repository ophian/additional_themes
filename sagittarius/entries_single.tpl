<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
    {foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
    <div class="serendipity_Entry_Date post">
        <h2>{$entry.title|default:$entry.id}</h2>

        <small>{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> &bull; {$entry.timestamp|formatTime:DATE_FORMAT_ENTRY}{if NOT empty($entry.categories)} &bull; {$CONST.CATEGORY}: {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}{/if}{if $dategroup.is_sticky} &bull; {$CONST.STICKY_POSTINGS}{/if}{if $entry.is_entry_owner AND NOT $is_preview} &bull; <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}</small>

        <div class="serendipity_entry entry">
            <div class="serendipity_entry_body">
                {$entry.body}
            </div>

{if $entry.is_extended}
            <div class="serendipity_entry_extended">
                <a id="extended"></a>
                {$entry.extended}
            </div>
{/if}
{if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
{/if}
            {$entry.add_footer|default:''}
        </div>
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
        {$entry.plugin_display_dat}


 {if empty($entry.properties.special_switch3) OR $entry.properties.special_switch3 !== true}
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
                    <a rel="nofollow" style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape:"html"}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
                </div>

                {serendipity_printTrackbacks entry=$entry.id}
            </div>
        {/if}
 {/if}
        {if $is_single_entry AND NOT $is_preview}
          {if empty($entry.properties.special_switch3) OR $entry.properties.special_switch3 !== true}
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
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:"<a href=\"{if $is_logged_in}$commentform_action}{/if}#c{$smarty.get.last_insert_cid}\">#{$smarty.get.last_insert_cid}</a> "}</div>
                {elseif $is_comment_moderate}
                <div class="serendipity_center serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:''}<br>{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>
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
        {/if}
        {$entry.backend_preview}
        {serendipity_hookPlugin hook="entries_footer"}
        {/foreach}
    {foreachelse}
    {if NOT $plugin_clean_page AND $view != '404'}
        <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
    {/foreach}

    {if NOT empty($footer_info)}({$footer_info}){/if}
<!-- ENTRIES END -->
