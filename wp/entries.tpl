{serendipity_hookPlugin hook="entries_header" addData="$entry_id"}
{if NOT empty($entries)}{* catch a staticpage startpage which has no $entries array set *}
    {foreach $entries AS $dategroup}
      {if $dategroup.is_sticky}
        <h2>{$CONST.STICKY_POSTINGS}</h2>
      {else}
        <h2>{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</h2>
      {/if}

      {foreach $dategroup.entries AS $entry}
      {assign var="entry" value=$entry scope="root"}
        <div class="post">
        <h3 class="storytitle" id="post-{$entry.id}"><a href="{$entry.link}" rel="bookmark" title="Permanent Link: {$entry.title}">{$entry.title}</a></h3>

        <div class="meta">Filed under:
          <ul class="post-categories">{foreach $entry.categories AS $entry_category}
            <li><a title="View all posts in {$entry_category.category_name}" href="{$serendipityHTTPPath}{$serendipityRewritePrefix}{$CONST.PATH_CATEGORIES}/{$entry_category.category_id}-{$entry_category.category_name|makeFilename}">{$entry_category.category_name}</a></li>
          {/foreach}</ul>
          &#8212; {$entry.author} @ {$entry.timestamp|formatTime:'%I:%M %p'}
        </div>

    <div class="storycontent">
          <p>
            {$entry.body}
            {if $entry.is_extended}
              {$entry.extended}
            {/if}
          </p>
          {if $entry.has_extended AND NOT $is_single_entry AND NOT $entry.is_extended}
            <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a></p>
          {/if}
    </div>

    <div class="feedback">
          <a href="{$entry.link}#comments">Comments ({$entry.comments+$entry.trackbacks})</a>
          {$entry.add_footer}
    </div>

        <!--
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                 xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
                 xmlns:dc="http://purl.org/dc/elements/1.1/">
        <rdf:Description
                 rdf:about="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/ei_{$entry.id}.rdf"
                 trackback:ping="{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry.id}"
                 dc:title="{$entry.title_rdf|default:$entry.title}"
                 dc:identifier="{$entry.rdf_ident}" />
        </rdf:RDF>
        -->
        {$entry.plugin_display_dat}

        {if $is_single_entry AND NOT $is_preview}
          <h2 id="comments">Comments <a href="#postcomment" title="Leave a comment">&raquo;</a></h2>
          <p>The <acronym title="Uniform Resource Identifier">URI</acronym> to TrackBack this entry is: <em>{$serendipityBaseURL}comment.php?type=trackback&amp;entry_id={$entry.id}</em></p>
          <ol id="commentlist">
            {serendipity_printTrackbacks entry=$entry.id}
            {serendipity_printComments entry=$entry.id mode=$CONST.VIEWMODE_LINEAR}
          </ol>
          {$COMMENTFORM}
        {/if}
        </div>
    {/foreach}
    </div>
{/foreach}
{else}
    {if NOT $plugin_clean_page AND $view != '404'}
    <p>{$CONST.NO_ENTRIES_TO_PRINT}</p>
    {/if}
{/if}
