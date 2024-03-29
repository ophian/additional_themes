{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
{foreach $entries AS $dategroup}
    {foreach $dategroup.entries AS $entry}
    {if $is_single_entry AND $view == 'entry'}{assign var="entry" value=$entry scope="root"}{* See scoping issue(s) for comment "_self" - $entry array relates in trackbacks - and index.tpl Rich Text Editor asset includes *}{/if}
    <article id="post_{$entry.id}" class="serendipity_entry{if $dategroup.is_sticky}_sticky{/if}{if $is_single_entry} singlepage{/if}">
        <header class="clearfix">
                <h2><a href="{$entry.link}">{$entry.title}</a></h2>
        </header>

        <div class="clearfix content serendipity_entry_body">
            {$entry.body}

            {if $is_single_entry or $is_preview}
                {if $entry.is_extended}
                    <div id="extended" class="clearfix content">
                        {$entry.extended}
                    </div>
                {/if}
            {/if}
            {if $entry.plugin_display_dat}
                {$entry.plugin_display_dat}
            {/if}
        </div>

        {if NOT $is_preview}
        <footer class="clearfix">
            <span class="single_user">{$CONST.POSTED_BY} <a href="{$entry.link_author}">{$entry.author}</a> {$CONST.ON} </span><time datetime="{$entry.timestamp|serendipity_html5time}">{$entry.timestamp|formatTime:$template_option.date_format}</time>

        {if NOT empty($entry.categories)}
            {$CONST.IN}  <span class="visuallyhidden">{$CONST.CATEGORIES}: </span>{foreach $entry.categories AS $entry_category}<a href="{$entry_category.category_link}">{$entry_category.category_name|escape}</a>{if NOT $entry_category@last}, {/if}{/foreach}
        {/if}
        {if NOT empty($entry.has_comments) or NOT empty($entry.has_disqus)}
        {if NOT empty($entry.has_disqus)}
            | {$entry.comments}{if $entry.has_trackbacks}, <a href="{$entry.link}#trackbacks">{$entry.trackbacks} {$entry.label_trackbacks}</a>{/if}
        {else}
            | <a href="{$entry.link}#comments" title="{$entry.comments} {$entry.label_comments}{if $entry.has_trackbacks}, {$entry.trackbacks} {$entry.label_trackbacks}{/if}">{$entry.comments} {$entry.label_comments}</a>
        {/if}
        {/if}
        {if NOT empty($entry.url_tweetthis)}
            | <a href="{$entry.url_tweetthis}" title="{$CONST.TWOK11_TWEET_THIS}">Twitter</a>
        {/if}
        {if NOT empty($entry.url_dentthis)}
            | <a href="{$entry.url_dentthis}" title="{$CONST.TWOK11_DENT_THIS}">Identica</a>
        {/if}
        {if NOT empty($entry.url_shorturl)}
            | <a href="{$entry.url_shorturl}" title="{$CONST.TWOK11_SHORT_URL_HINT}" class="short-url">{$CONST.TWOK11_SHORT_URL}</a>
        {/if}
            {$entry.add_footer|default:''}
            {if NOT empty($entry.is_entry_owner) AND NOT $is_preview} | <a href="{$entry.link_edit}">{$CONST.EDIT_ENTRY}</a>{/if}
        </footer>

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
            <h3>{$CONST.TRACKBACKS}</h3>

            {serendipity_printTrackbacks entry=$entry.id}
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
            <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:"<a href=\"{if $is_logged_in AND isset($commentform_action)}{$commentform_action}{/if}#c{$smarty.get.last_insert_cid|default:''}\">#{$smarty.get.last_insert_cid|default:''}</a> "}</p>
        {elseif $is_comment_moderate}
            <p class="serendipity_msg_notice">{$CONST.COMMENT_ADDED|sprintf:''}: {$CONST.THIS_COMMENT_NEEDS_REVIEW}</p>
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
