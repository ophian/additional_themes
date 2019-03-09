<?php

@define('IMAGECAT_INSTR', '<b>Note:</b> The Mimbo template supports on the start page a single accompanying image per entry. For this feature to actually work, the s9y event plugin <i>Extended properties for entries</i> has to be installed. In the configuration of this plugin, two fields called MagazineCategoryImage and MagazineCategoryImageAlt (mind the capitalization!) have to be set up under <i>Custom Fields</i>. When posting a new entry to the blog, an image from the media database along with a proper alt text can now be assigned to it under <i>Advanced Options</i>. The recommended width for these images depends on the Mimbo category (see below) the entry is assigned to.<br><br><b>Mimbo categories:</b> The Mimbo template displays entries in three areas on the start page. Use the following dropdown boxes to assign s9y categories to these Mimbo categories. The lead category will display its most recent entry (recommended width for the accompanying image: 270 pixels max). The features category will display links to its latest three entries (recommenden width for the accompanying image: 255 pixels max). Finally, select three news categories. Each of them will display its most recent entry as a shortened teaser (recommended width for the accompanying image: 60 pixels max).<br><br>');
@define('MIMBO_CAT_LEAD', 'Select lead category');
@define('MIMBO_CAT_FEAT', 'Select features category');
@define('MIMBO_CAT_X1', 'Select first news category');
@define('MIMBO_CAT_X2', 'Select second news category');
@define('MIMBO_CAT_X3', 'Select third news category');

