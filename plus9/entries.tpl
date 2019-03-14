<!-- ENTRIES START -->
{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    {if NOT empty($footer_info)}
    <div class="paginationtop">{$footer_info}<br/>
    {/if}
    <span class="prev_page">{if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&#9668; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}</span>
    <span class="next_page">{if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &#9658;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}</span>
    {if NOT empty($footer_info)}
    </div>
    {/if}
{/if}

{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
        {assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" *}
        <h2 id="post-{$entry.id}"><a href="{$entry.link}" rel="bookmark">{$entry.title}</a>{if $dategroup.is_sticky} ({$CONST.STICKY_POSTINGS}){/if}</h2>

      {if $entry.has_comments AND NOT $is_preview}
        <p class="comments">
        {if $use_popups}
            <a href="{$entry.link_popup_comments}" onclick="window.open(this.href, 'comments', 'width=480,height=480,scrollbars=yes'); return false;">{if $entry.comments == 0}{$CONST.J_WITHOUT} {else}{$CONST.J_WITH} {$entry.comments} {/if}{if $entry.comments > 1}{$CONST.J_COMMTS}{else}{$entry.label_comments|default:''}{/if}</a>
        {else}
            <a href="{$entry.link}#comments">{if $entry.comments == 0}{$CONST.J_WITHOUT} {else}{$CONST.J_WITH} {$entry.comments} {/if}{if $entry.comments > 1}{$CONST.J_COMMTS}{else}{$entry.label_comments}{/if}</a>
        {/if}
        </p>
      {/if}

        <div class="main">
            {$entry.body}
      {if $entry.is_extended}
            <a id="extended"></a>
            {$entry.extended}
      {/if}
      {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title} &raquo;</a></p>
      {/if}
        </div>

    {if NOT $is_preview}
        <div class="meta group">
            <div class="signature">
                <p>{$CONST.POSTED_BY} {$entry.author} {if isset($entry.is_entry_owner) AND NOT $is_preview}<span class="edit"><a href="{$entry.link_edit}">Edit</a></span>{/if}</p>
                <p>{$entry.timestamp|formatTime:'%x'} {$CONST.AT} {$entry.timestamp|formatTime:'%X'}</p>
            </div>
            <div class="tags">
            {if NOT empty($entry.categories)}
                <p>{$CONST.J_POSTED} {$CONST.IN} {foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}</p>
            {/if}
            {$entry.freetag|default:''}
            </div>
        </div>

        <div class="addfooter">{$entry.add_footer|default:''}

        {if $template_option.enable_ad== true}
            <script type="text/javascript">
                addthis_url = '{$entry.rdf_ident|escape:url}';
                addthis_title = '{$entry.title|escape:url}';
                addthis_pub = '{$template_option.my_addthis_account}';
            </script>
            <script type="text/javascript" src="http://s7.addthis.com/js/addthis_widget.php?v=12" ></script>
        {/if}

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

            <a id="trackbacks"></a>
            <h3 class="reply">{$entry.trackbacks} {$entry.label_trackbacks} {$CONST.J_TO} {$entry.title}</h3>

            <p class="comment_meta">
                <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a>
            </p>

            {serendipity_printTrackbacks entry=$entry.id}
        {/if}

        {if $is_single_entry AND NOT $is_preview}
            <a id="comments"></a>
            <h3 class="reply">{$entry.comments} {$entry.label_comments|default:''} {$CONST.J_TO} {$entry.title}</h3>

            {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

          {if isset($entry.is_entry_owner)}
            {if $entry.allow_comments}
            <p class="comment_meta"><a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a></p>
            {else}
            <p class="comment_meta"><a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a></p>
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
          {elseif not $entry.allow_comments}
            <div class="serendipity_center serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</div>
          {else}
            <h3 class="reply">{$CONST.ADD_COMMENT}</h3>
            {$COMMENTFORM}
          {/if}
        {/if}
        {$entry.backend_preview}
    {/foreach}
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <div class="warning"><p>{$CONST.NO_ENTRIES_TO_PRINT}</p></div>
    {/if}
{/if}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    {if NOT empty($footer_info)}
    <div class="pagination navigation group">{$footer_info}<br/>
    {/if}
    <span class="prev_page">{if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&#9668; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}</span>
    <span class="next_page">{if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &#9658;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}</span>
    {if NOT empty($footer_info)}
    </div>
    {/if}
{/if}
{serendipity_hookPlugin hook="entries_footer"}
<!-- ENTRIES END -->
