{assign var="is_static_page" value="yes"}
{if $plugin_contactform_articleformat}
    <h1>{$plugin_contactform_name}</h1>
{/if}

{if NOT empty($is_contactform_sent)}
    <div class="serendipity_center serendipity_msg_notice">
        {$plugin_contactform_sent}
    </div>
{else}

    {if NOT empty($is_contactform_error)}
    <div class="serendipity_center serendipity_msg_important">
        {$plugin_contactform_error}
    </div>

    <!-- Needed for Captchas -->
{foreach $comments_messagestack AS $message}
    <div class="serendipity_center serendipity_msg_important">{$message}</div>
{/foreach}
{/if}

    <!-- This whole commentform style, including field names is needed for Captchas. The spamblock plugin relies on the field names [name], [email], [url], [comment]! -->
    <a id="serendipity_CommentForm"></a>
    <form id="serendipity_comment" action="{$commentform_action}#feedback" method="post">
        <input type="hidden" name="serendipity[subpage]" value="{$commentform_sname}" />
        <input type="hidden" name="serendipity[commentform]" value="true" />
        <div class="form_field">
            <input class="textfield" type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" tabindex="1" /><label class="text">{$CONST.NAME}</label>
        </div>
        <div class="form_field">
            <input class="textfield" type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" tabindex="23" /><label class="text">{$CONST.EMAIL}</label>
        </div>
        <div class="form_field">
            <input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" class="textfield" tabindex="3" /><label class="text">{$CONST.HOMEPAGE}</label>
        </div>
        <textarea id="serendipity_commentform_comment" name="serendipity[comment]" class="commentbox" tabindex="4"></textarea>
        <!-- This is where the spamblock/Captcha plugin is called -->
        {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}

        <input type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" />
    </form>
{/if}

</div>
<div class="secondary">
    <h2>{$plugin_contactform_pagetitle}</h2>
    <div class="featured"><p>{$plugin_contactform_preface}</p></div>
</div>
