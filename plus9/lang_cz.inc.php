<?php

/**
 *  @author Vladim�r Ajgl <vlada@ajgl.cz>
 *  @translated 2009/06/05
 */@define('J_INSTR','<strong>Pluginy, kter� je t�eba nainstalovat</strong>: <br>aby naviga�n� menu fungovalo spr�vn�, mus� b�t nainstalovan� pluginy: <em><br><br>Archiv </em>(postrann� blok skryt�) <br>- Zobrazovat po�et p��sp�vk� v kategori�ch?&nbsp; Ne <br>- Skr�t odkaz na archiv, pokud neobsahuje ��dn� p��sp�vky:&nbsp; Ne<br><br><em>Kategorie </em>(skryt� postrann� sloupec)<br>- XML-Tla��tka : ��dn�<br>- Umo�nit n�v�t�vn�k�m zobrazit v�ce kateogiri� najednou? Ne<br>- Povolit �ablony Smarty? &nbsp; Ano<br /><br><em>Statick� str�nky&nbsp; </em>&nbsp;<br />Ikony nebo �ist� text <b>: </b>�ist� text<br>Pou��vat podadres�� s obr�zky v adres��i pluginu: <b>Ne<br><br></b>Pokud chcete pou��t <strong>statick� str�nky</strong> v naviga�n� li�t�, mus�te zm�nit ��dku 252 v souboru&nbsp; <em><strong>/plugins/serendipity_event_staticpage/serendipity_plugin_staticpage.php&nbsp;&nbsp; </strong></em>z <br>star� k�d: <strong><em>? sprintf(&nbsp; &quot;&lt;a href=\&quot;%s\&quot; title=\&quot;%s\&quot; style=\&quot;padding-left: %dpx;\&quot;&gt;%s&lt;/a&gt;&lt;br /&gt;\n&quot;, </em></strong><br><br>na <br>nov� k�d: <strong><em>? sprintf( &quot;&lt;li&gt; &lt;a href=\&quot;%s\&quot; &gt;%s&lt;/a&gt;&lt;/li&gt;\n&quot;,</em></strong><b><br><br><br>Pozn�mky:</b>Aby se v �ablon� zobrazily spr�vn� tagy, mus�te j�t na nastaven� pluginu Tagov�n� p��sp�vk� (kl��ov� slova) a nastavit volbu "Zobrazovat tagy v pati�ce" na <strong>Smarty</strong>.<br><b><br>');
@define('J_MENUTITLE', 'Nadpis menu v postrann�m sloupci');
@define('J_MENUTEXT', 'Str�nky');
@define('J_SEARCHFIELD','Zadejte slovo k vyhled�v�n�');
@define('J_SEARCHINFO','prohledat archivy');
@define('J_SUBMITTEXT','Hledej');
@define('J_SUBMITALT','Klikni pro prohled�n� archiv�');
@define('J_WITH', 's');
@define('J_WITHOUT','bez');
@define('J_POSTED', 'Publikov�no');
@define('J_COMMTS', 'Koment��e');
@define('J_TO', 'pro');
@define('NAVLINK_AMOUNT', 'Zadejte po�et odkaz� v naviga�n� li�t� (pak je t�eba znovu nat�hnout str�nku Spr�va styl�)');
@define('NAV_LINK_TEXT', 'Zadejte text rozbalovac�ho odkazu');
@define('NAV_LINK_URL', 'Zadejte plnou URL adresu rozbalovac�ho odkazu');
@define('WPP_DDD','Reklamy');
@define('ADDVTEXT','google k�d');
@define('NAV_LINK_TEXT', 'Zadejte text rozbalovac�ho odkazu');
@define('NAV_LINK_URL', 'Zadejte plnou URL adresu rozbalovac�ho odkazu');
@define('DROP_D1', 'Zadejte po�et odkaz� pro Rozbalovac� menu');
@define('USER_DROP', 'Povolit Rozbalovac� menu');
@define('DROP_HEADER', 'N�zev rozbalovac�ho odkazu');
@define('ENABLE_CAT','Zobrazit kategorie v menu');
@define('ENABLE_ARCH','Zobrazit archivy v menu');
@define('ENABLE_STAT','Zobrazit statick� str�nky v menu');
@define('ENABLE_USER','Zobrazit rozbalovac� menu (p��sp�vky a ��sla str�nek)');
@define('ENABLE_LOG','Zobrazit p�ihl�en� v menu');
@define('DRNAV_LINK_TEXT', 'Text Rozbalovac�ho odkazu');
@define('DRNAV_LINK_URL', 'URL Rozbalovac�ho odkazu');
@define('STAT_HEADER','Nadpis rozbalovac�ho menu pro statick� str�nky');
@define('ENABLE_AD','Zobrazit tla��tko "addthis"?');
@define('MY_ADDTHIS_ACCOUNT','V� addthis ��et. Pokud ho nem�te, m��ete si ho zalo�it na http://www.addthis.com');
@define('SHOW_PAGITOP','Zobrazit dopl�uj�c� ��sla str�nek v z�hlav� obsahu');
@define('SHOW_PAGIBOTTOM','Zobrazit dopl�uj�c� ��sla str�nek v pati�ce');