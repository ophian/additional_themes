{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
        {foreach $dategroup.entries AS $entry}
            {assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" *}
    {if (isset($bxloaded) AND $bxloaded) AND NOT $dategroup.is_sticky}
        {$bxloaded = false}
        </div>
    {/if}
    {if $dategroup.is_sticky AND NOT $is_single_entry}
        {if empty($bxloaded)}
            {$bxloaded = true}
            <div id="bxslider">
        {/if}
    {/if}
    <article id="post_{$entry.id}" class="serendipity_entry{if $dategroup.is_sticky}_sticky{/if}{if $is_single_entry} singlepage{/if}">
        <header class="clearfix">
            {if NOT $is_single_entry AND NOT $is_preview}
                <a href="{$entry.link}">
                    {if isset($entry.properties.ep_featuredImage)}
                        <img class="featuredImage lazy" {if NOT $dategroup.is_sticky && $template_option.lazyload == true}data-original="{else}src="{/if}{$entry.properties.ep_featuredImage}" />
                        <noscript><img class="featuredImage" src="{$entry.properties.ep_featuredImage}" /></noscript>
                    {else}
                        <span class="featuredImage"></span>
                    {/if}
                </a>
                <a class="photoEntryBox" href="{$entry.link}">
                    <h2 class="photoEntryTitle">{$entry.title}</h2>
                    <h3 class="photoEntryData">
                        <time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:$template_option.date_format}</time>
                        {if NOT empty($entry.categories)}{foreach $entry.categories AS $entry_category}{if $entry_category.category_icon}<img class="serendipity_entryIcon" title="{$entry_category.category_name|escape}{$entry_category.category_description|emptyPrefix}" alt="{$entry_category.category_name|escape}" src="{$entry_category.category_icon}" />{/if}{/foreach}{/if}
                    </h3>
                </a>
            {else}
                <h2><a href="{$entry.link}">{$entry.title}</a></h2>
            {/if}
        </header>

        {if $is_single_entry OR $is_preview}
            <div class="clearfix content serendipity_entry_body">
            {if isset($entry.properties.ep_featuredImage)}<a class="serendipity_image_link" href="{$entry.properties.ep_featuredImage|replace:'.serendipityThumb':''}"><img id="featuredImage" {if $template_option.lazyload == true}class="lazy" data-original="{else}src="{/if}{$entry.properties.ep_featuredImage}" /><noscript><img id="featuredImage" src="{$entry.properties.ep_featuredImage}" /></noscript></a>{/if}
            {$entry.body}
            {if $entry.is_extended}
                <div id="extended" class="clearfix content">
                    {$entry.extended}
                </div>
            {/if}
            {if $entry.plugin_display_dat}
                {$entry.plugin_display_dat}
            {/if}
            </div>
        {else}
            {if $entry.plugin_display_dat}
                {$entry.plugin_display_dat}
            {/if}
        {/if}


        {if $is_single_entry AND NOT empty($is_preview)}
            <footer class="clearfix">
                <span class="single_user">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} </span><time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:$template_option.date_format}s</time>

            {if NOT empty($entry.categories)}
                {$CONST.IN} <span class="visuallyhidden">{$CONST.CATEGORIES}: </span>{foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
            {/if}
            {if ($entry.has_comments OR NOT empty($entry.has_disqus))}
            {if isset($entry.has_disqus) AND $entry.has_disqus}
                | {$entry.comments}{if $entry.has_trackbacks}, <a href="{$entry.link}#trackbacks">{$entry.trackbacks} {$entry.label_trackbacks}</a>{/if}
            {else}
                | <a href="{$entry.link}#comments" title="{$entry.comments} {$entry.label_comments}{if $entry.has_trackbacks}, {$entry.trackbacks} {$entry.label_trackbacks}{/if}">{$entry.comments} {$entry.label_comments}</a>
            {/if}
            {/if}
            {if isset($entry.url_tweetthis) AND $entry.url_tweetthis}
                | <a href="{$entry.url_tweetthis}" title="{$CONST.TWOK11_TWEET_THIS}">Twitter</a>
            {/if}
            {if isset($entry.url_dentthis) AND $entry.url_dentthis}
                | <a href="{$entry.url_dentthis}" title="{$CONST.TWOK11_DENT_THIS}">Identica</a>
            {/if}
            {if isset($entry.url_shorturl) AND $entry.url_shorturl}
                | <a href="{$entry.url_shorturl}" title="{$CONST.TWOK11_SHORT_URL_HINT}" class="short-url">{$CONST.TWOK11_SHORT_URL}</a>
            {/if}
                {$entry.add_footer|default:''}
                {if NOT empty($entry.is_entry_owner) AND NOT $is_preview} | <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}
            </footer>
        {/if}
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

    {if $is_single_entry AND NOT $is_preview}
        {if $CONST.DATA_UNSUBSCRIBED}
        <p class="serendipity_msg_notice">{$CONST.DATA_UNSUBSCRIBED|sprintf:$CONST.UNSUBSCRIBE_OK}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_DELETED|sprintf:$CONST.TRACKBACK_DELETED}</p>
        {/if}
        {if $CONST.DATA_TRACKBACK_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_TRACKBACK_APPROVED|sprintf:$CONST.TRACKBACK_APPROVED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_DELETED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_DELETED|sprintf:$CONST.COMMENT_DELETED}</p>
        {/if}
        {if $CONST.DATA_COMMENT_APPROVED}
        <p class="serendipity_msg_notice">{$CONST.DATA_COMMENT_APPROVED|sprintf:$CONST.COMMENT_APPROVED}</p>
        {/if}

        <section id="trackbacks" class="serendipity_comments serendipity_section_trackbacks">
            <a id="trackbacks"></a>
            <div class="serendipity_commentsTitle">{$CONST.TRACKBACKS}</div>
            <div class="serendipity_center">
                <a rel="nofollow" href="{$entry.link_trackback}" onclick="alert('{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;'); return false;" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|escape} &raquo;{$entry.rdf_ident|escape}&laquo;">{$CONST.TRACKBACK_SPECIFIC}</a>
            </div>
            <div id="serendipity_trackbacklist">
                {serendipity_printTrackbacks entry=$entry.id}
            </div>
        </section>

        <section id="comments" class="serendipity_comments serendipity_section_comments">
            <h3>{$CONST.COMMENTS}</h3>

            {serendipity_printComments entry=$entry.id mode=$entry.viewmode}
        {if NOT empty($entry.is_entry_owner)}
            <p class="manage_comments">
            {if $entry.allow_comments}
            <a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>
            {else}
            <a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>
            {/if}
            </p>
        {/if}
        </section>
            <a id="feedback"></a>
        {foreach $comments_messagestack AS $message}
            <p class="serendipity_msg_important">{$message}</p>
        {/foreach}
        {if $is_comment_added}
            <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}</p>
        {elseif $is_comment_moderate}
            <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED}: {$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
        {elseif NOT $entry.allow_comments}
            <p class="serendipity_msg_important">{$CONST.COMMENTS_CLOSED}</p>
        {/if}
        {if $entry.allow_comments}
            <section id="respond" class="serendipity_section_commentform">
                <h3>{$CONST.ADD_COMMENT}</h3>
                {$COMMENTFORM}
            </section>
        {/if}
    {/if}
    {$entry.backend_preview}
    </article>
    {/foreach}
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <p class="nocontent">{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/if}

{if NOT $is_single_entry AND NOT $is_preview AND NOT $plugin_clean_page AND (NOT empty($footer_prev_page) OR NOT empty($footer_next_page))}
    <nav class="serendipity_pagination block_level">
        <ul class="clearfix">
            {if NOT empty($footer_info)}
            <li class="info"><span>{$footer_info}</span></li>
            {/if}
            <li class="prev">{if $footer_prev_page}<a href="{$footer_prev_page}">{/if}{if $footer_prev_page}&larr; {$CONST.PREVIOUS_PAGE}{else}&nbsp;{/if}{if $footer_prev_page}</a>{/if}</li>
            <li class="next">{if $footer_next_page}<a href="{$footer_next_page}">{/if}{if $footer_next_page}{$CONST.NEXT_PAGE} &rarr;{else}&nbsp;{/if}{if $footer_next_page}</a>{/if}</li>
        </ul>
    </nav>
{/if}
    {serendipity_hookPlugin hook="entries_footer"}
