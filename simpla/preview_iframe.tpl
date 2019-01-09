{if $is_xhtml}
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
{else}
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
{/if}
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
<head>

    <title>{$CONST.SERENDIPITY_ADMIN_SUITE}</title>
    <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
    <meta name="generator" content="Serendipity v.{$serendipityVersion}" />

    <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
{if $head_link_stylesheet_frontend}
    <link rel="stylesheet" href="{$head_link_stylesheet_frontend}">
{else}
    <link rel="stylesheet" href="{$serendipityHTTPPath}{$serendipityRewritePrefix}serendipity.css">
{/if}
    <script type="text/javascript">
       window.onload = function() {ldelim}
         parent.document.getElementById('serendipity_iframe').style.height = document.getElementById('content').offsetHeight
                                                                           + parseInt(document.getElementById('content').style.marginTop)
                                                                           + parseInt(document.getElementById('content').style.marginBottom)
                                                                           + 'px';
         parent.document.getElementById('serendipity_iframe').scrolling    = 'no';
         parent.document.getElementById('serendipity_iframe').style.border = 0;
       {rdelim}
    </script>

</head>

<body style="padding: 0px; margin: 0px;">
    <div id="wrapper" style="width: 100%; border: 0;">
        <div id="content" style="padding: 5px; margin: 0px; text-align: left">
            {$preview}
        </div>
    </div>
</body>