<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
        {assign var="entry" value=$entry scope="root"}
        <div class="post">
            <h2 id="post-{$entry.id}"><a href="{$entry.link}">{$entry.title}</a></h2>
        <div class="serendipity_date">
          {$entry.timestamp|formatTime:'<span class="z1">%d</span> <span class="z2">%B</span> <span class="z3">%Y</span>'}
                </div>
            {if $entry.categories}
            <span class="categoryIcon">
            {foreach $entry.categories AS $entry_category}
                {if $entry_category.category_icon}
                    <a href="{$entry_category.category_link}"><img class="categoryIcon" title="{$entry_category.category_name|escape}{$entry_category.category_description|emptyPrefix}" alt="{$entry_category.category_name|escape}" src="{$entry_category.category_icon}" /></a>
                {/if}
            {/foreach}
            </span>
            {/if}

            <div class="entry">
              <div>
                {$entry.body}
                {if $is_single_entry}
                <a id="extended"></a>{$entry.extended}
                {/if}
              </div>

                {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
                <br /><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a><br /><br />
                {/if}

                {if $entry.is_entry_owner AND NOT $is_preview}
                        <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>
                {/if}

            <div class="postmetadata {if $is_single_entry} graybox{/if}">
                {if $is_single_entry}

        {$entry.timestamp|formatTime:"%H:%M"}
                {if $entry.categories}
                   | {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}.
                {/if}<br />
                {if $entry.allow_comments}
                    {if $entry.moderate_comments}
                        {$CONST.SUBJECT_TO_MODERATION}
                    {/if}
                {else}
                    {$CONST.COMMENTS_CLOSED}
                {/if}

                {else}

                {if $dategroup.is_sticky}
                    {$CONST.ON}
                {else}
                {/if} <a href="{$entry.link}">{if $dategroup.is_sticky}{$entry.timestamp|formatTime:DATE_FORMAT_ENTRY} {/if}</a>

        <div class="clearfix">
                {if $entry.has_comments}
                    {if $use_popups}
                        <div class="fleft">
                        <div class="obut">
                <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_comments} ({$entry.comments})</a>
            </div>
            </div>
                    {else}
                        <div class="fleft">
                        <div class="obut">
                            <a href="{$entry.link}#comments">{$entry.label_comments} ({$entry.comments})</a>
            </div>
            </div>
                    {/if}
                {/if}

                {if $entry.has_trackbacks}
                    {if $use_popups}
                        <div class="fleft">
            <div class="obut">
                            <a href="{$entry.link_popup_trackbacks}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
            </div>
            </div>
                    {else}
                        <div class="fleft">
            <div class="obut">
                            <a href="{$entry.link}#trackbacks">{$entry.label_trackbacks} ({$entry.trackbacks})</a>
            </div>
            </div>
                    {/if}
                {/if}
        </div>

                {/if}
                {$entry.add_footer}
               </div>
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
        <div id="tbf">
                    <div class="serendipity_center">
                        <a style="font-weight: normal" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape:html}'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape}">{$CONST.TRACKBACK_SPECIFIC}</a>
                    </div>

                {if $entry.trackbacks>=1}
                <a id="trackbacks"></a>

        <h3>{$CONST.TRACKBACKS}</h3>

                    <ol class="trackbacklist">
                        {serendipity_printTrackbacks entry=$entry.id}
                    </ol>
        {/if}
        </div>
        {/if}

        {if $is_single_entry AND NOT $is_preview}
        <div id="cof">
                <a id="comments"></a><h3>{$CONST.COMMENTS}</h3>
                <div class="serendipity_center">{$CONST.DISPLAY_COMMENTS_AS}
                {if $entry.viewmode eq $CONST.VIEWMODE_LINEAR}
                    ({$CONST.COMMENTS_VIEWMODE_LINEAR} | <a href="{$entry.link_viewmode_threaded}#comments">{$CONST.COMMENTS_VIEWMODE_THREADED}</a>)
                {else}
                    (<a href="{$entry.link_viewmode_linear}#comments">{$CONST.COMMENTS_VIEWMODE_LINEAR}</a> | {$CONST.COMMENTS_VIEWMODE_THREADED})
                {/if}
                </div>
                <br />
                <ol class="commentlist">
                    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
                </ol>

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
                <h3>{$CONST.ADD_COMMENT}</h3>
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

    <div class="serendipity_entryFooter">

      {if $footer_prev_page}
      <a href="{$footer_prev_page}">&laquo; {$CONST.PREVIOUS_PAGE}</a>&#160;&#160;
      {/if}

      {if $footer_info}
      ({$footer_info})
      {/if}

      {if $footer_next_page}
      &#160;&#160;<a href="{$footer_next_page}">{$CONST.NEXT_PAGE} &raquo;</a>
      {/if}

    {serendipity_hookPlugin hook="entries_footer"}
    </div>
<!-- ENTRIES END -->
