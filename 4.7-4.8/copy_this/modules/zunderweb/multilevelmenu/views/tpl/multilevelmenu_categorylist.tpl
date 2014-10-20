[{oxstyle include=$oViewConf->getModuleUrl('multilevelmenu',"out/src/css/multilevelmenu.css")}]

[{oxscript include="js/widgets/oxtopmenu.js" priority=10 }]
[{oxscript add="$('#navigation').oxTopMenu();"}]
[{oxstyle include="css/libs/superfish.css"}]
[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
[{/if}]
[{assign var="tree" value=$oxcmp_categories }]
[{defun name="category_tree_head" tree=$tree act=$act class=$class testSubCat=''}]
[{assign var="activecat" value=""}]
[{assign var="iCatCnt" value=0 }]
[{strip}]
    [{if $testSubCat}]
        <!-- Submenu All Levels -->
        <ul>
        [{foreach from=$tree item=ocat key=catkey name=$test_catName}]
            [{assign var="iCatCnt" value=$iCatCnt+1 }]
            [{if $ocat->getIsVisible() }]
            <li [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                [{if $ocat->getSubCats()}]
                <a [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] href="[{$ocat->getLink()}]"><span>[{$ocat->oxcategories__oxtitle->value}]</span></a>
                    [{fun name="category_tree_head" tree=$ocat->getSubCats() act=$act class="" testSubCat=$ocat->oxcategories__oxid->value }]
                [{else}]
                <a [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}]</a>
                [{/if}]
            </li>
            [{/if}]
        [{/foreach}]
        </ul>
    [{else}]
        <!-- Main Menu -->
        <ul id="navigation" class="sf-menu">
            <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a id="startbutton" [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>

        [{foreach from=$tree item=ocat key=catkey name=$test_catName}]
            [{if $ocat->getIsVisible() }]
                [{if $iCatCnt < $oView->getTopNavigationCatCnt()}]
            <li [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                    [{if $ocat->getSubCats()}]
                <a [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] id="topmenu_root[{$iCatCnt}]" href="[{$ocat->getLink()}]"><span>[{$ocat->oxcategories__oxtitle->value}]</span></a>
                        [{fun name="category_tree_head" tree=$ocat->getSubCats() act=$act class="" testSubCat=$ocat->oxcategories__oxid->value }]
                    [{else}]
                <a [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] id="topmenu_root[{$iCatCnt}]" href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}]</a>
                    [{/if}]
            </li>
                [{/if}]
                [{if $iCatCnt == $oView->getTopNavigationCatCnt()}]
                    [{capture append="moreLinks"}]
                    <li>
                        [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
                        <a href="[{ oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist" }]">[{ oxmultilang ident="MORE" }]</a>
                        <ul>
                    [{/capture}]
                [{/if}]
                [{if $iCatCnt >= $oView->getTopNavigationCatCnt()}]
                    [{capture append="moreLinks"}]
                        <li [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                            <a [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] id="topmenu_root[{$iCatCnt}]" href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}]</a>
                        </li>
                    [{/capture}]
                [{/if}]
                [{assign var="iCatCnt" value=$iCatCnt+1 }]
            [{/if}]
        [{/foreach}]
        [{if $_catMoreUrl}]
            [{capture append="moreLinks"}]
                        </ul>
                    </li>
            [{/capture}]
        [{/if}]
        [{foreach from=$moreLinks item=link}]
           [{$link}]
        [{/foreach}]
        [{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1 oxwtemplate='header_manufacturers.tpl'}]
    

    </ul>
    [{/if}]

[{/strip}]
[{/defun}]
[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]