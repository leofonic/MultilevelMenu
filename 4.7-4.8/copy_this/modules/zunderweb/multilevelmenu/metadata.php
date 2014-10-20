<?php
$aModule = array(
    'id'          => 'multilevelmenu',
    'title'       => 'Zunderweb Multilevelmenu',
    'description' =>  array(
        'de'=>'Multi-Level Topmenu',
        'en'=>'Multi-Level Topmenu',
    ),
    'version'     => '1.0',
    'url'         => 'http://zunderweb.de',
    'email'       => 'info@zunderweb.de',
    'author'      => 'Zunderweb',
    'extend'      => array(
        'oxwcategorytree' => 'zunderweb/multilevelmenu/components/widgets/multilevelmenu_oxwcategorytree',
    ),
    'templates' => array(
        'multilevelmenu_categorylist.tpl' => 'zunderweb/multilevelmenu/views/tpl/multilevelmenu_categorylist.tpl',
        'header_manufacturers.tpl' => 'zunderweb/multilevelmenu/views/tpl/manufacturerlist.tpl',
    ),
);