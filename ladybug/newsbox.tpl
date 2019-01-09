<!-- NEWSBOX ENTRIES START -->
  {if $newsbox_data.isContainer}
  <div class="newsbox_container newsbox_{$newsbox_data.title}"><p class="newsbox_title">{$newsbox_data.title}</p>
    {foreach $NEWSBOX AS $newsbox}
    {$newsbox}
    {/foreach}
    <div style="clear:both"><br/></div>
  </div>
  {else}
  <div class="newsbox newsbox_{$newsbox_data.title}"><p class="newsbox_title">{$newsbox_data.title}</p>
    {foreach $entries AS $dategroup}
    <div class="serendipity_Entry_Date">
        {if $dategroup.is_sticky}
        <h4 class="serendipity_date">{$CONST.STICKY_POSTINGS}</h4>
        {/if}

        {foreach $dategroup.entries AS $entry}
        <div class="shadow">
          <div class="serendipity_entry serendipity_entry_author_{$entry.author|makeFilename} {if $entry.is_entry_owner}serendipity_entry_author_self{/if} drop newsbox_entry">
            <h3 class="serendipity_title"><a href="{$entry.link}">{$entry.title}</a></h3>
            <h4 class="serendipity_date">{$dategroup.date|formatTime:DATE_FORMAT_ENTRY}</h4>

            <div class="serendipity_entry_body">
                {$entry.body}
            </div>

            {if $entry.has_extended}
            <a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|sprintf:$entry.title}</a>
            {/if}

          </div>
        </div>
        <!--
        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                 xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
                 xmlns:dc="http://purl.org/dc/elements/1.1/">
        <rdf:Description
                 rdf:about="{$entry.link_rdf}"
                 trackback:ping="{$entry.link_trackback}"
                 dc:title="{$entry.title}"
                 dc:identifier="{$entry.rdf_ident}" />
        </rdf:RDF>
        -->
    {/foreach}
    </div>
    {foreachelse}
    {if NOT $plugin_clean_page AND $view != '404'}
        {$CONST.NO_ENTRIES_TO_PRINT}
    {/if}
    {/foreach}

    <div class="serendipity_entryFooter" style="text-align: center">
      <form style="display:inline;" action="{$newsbox_data.multicat_action}" method="post">
      {foreach $newsbox_data.cats AS $cat_id}
        <input type="hidden" name="serendipity[multiCat][]" value="{$cat_id}">
      {/foreach}
        <input type="submit" name="serendipity[isMultiCat]" value="More {$newsbox_data.title}">
      </form>
    </div>
  </div>
  {/if}
<!-- NEWBOX ENTRIES END -->
