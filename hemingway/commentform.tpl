<div id="comment-form"><a id="serendipity_CommentForm"></a>
    <div id="serendipity_replyform_0"></div>
    <h3 class="formhead">{$CONST.ADD_COMMENT}</h3>
    <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}">
        <div class="form_field">
            <input class="textfield" type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" tabindex="1"><label class="text">{$CONST.NAME}</label>
        </div>
        <div class="form_field">
            <input class="textfield" type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" tabindex="23"><label class="text">{$CONST.EMAIL}</label>
        </div>
        <div class="form_field">
            <input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" class="textfield" tabindex="3"><label class="text">{$CONST.HOMEPAGE}</label>
        </div>
        <div class="form_field">
            {$commentform_replyTo}<label class="text">{$CONST.IN_REPLY_TO}</label>
        </div>
        <textarea id="serendipity_commentform_comment" name="serendipity[comment]" class="commentbox" tabindex="4"></textarea>
        {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
    {if $is_commentform_showToolbar}
        <div class="form_field">
            <input id="checkbox_remember" type="checkbox" name="serendipity[remember]"{$commentform_remember}>&#160;<label for="checkbox_remember">{$CONST.REMEMBER_INFO}</label>
         </div>
        {if $is_allowSubscriptions}<br>
        <div class="form_field">
            <input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]"{$commentform_subscribe}>&#160;<label for="checkbox_subscribe">{$CONST.SUBSCRIBE_TO_THIS_ENTRY}</label>
         </div>
        {/if}
    {/if}
        
        {if $is_moderate_comments}<p>{$CONST.COMMENTS_WILL_BE_MODERATED}</p>{/if}

        <div class="formactions">
            <input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" tabindex="5" class="submit">
            <input type="submit" name="serendipity[preview]" value="{$CONST.PREVIEW}" tabindex="6" class="submit">
        </div>
    </form>
</div><!-- end commentform -->