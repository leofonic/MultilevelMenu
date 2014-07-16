[{assign var="iManufacturerLimit" value="20"}]
[{assign var="manufacturers" value=$oView->getManufacturerlist()}]
[{if $manufacturers|count}]
    [{assign var="rootManufacturer" value=$oView->getRootManufacturer()}]
    <li [{if $oViewConf->getTopActiveClassName() == "manufacturerlist"}]class="current"[{/if}]>
        <a [{if $oViewConf->getTopActiveClassName() == "manufacturerlist"}]class="current"[{/if}] href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="MULTILEVELMENU_MANUFACTURERS" }]</a>
        <ul>
            [{foreach from=$manufacturers item=_mnf name=manufacturers}]
                [{if $smarty.foreach.manufacturers.index < $iManufacturerLimit}]
                    <li [{if $oView->getManufacturerId()==$_mnf->getId()}]class="current"[{/if}]>
                        <a [{if $oView->getManufacturerId()==$_mnf->getId()}]class="current"[{/if}] href="[{$_mnf->getLink()}]">[{$_mnf->oxmanufacturers__oxtitle->value}]</a>
                    </li>
                [{elseif $smarty.foreach.manufacturers.index == $iManufacturerLimit}]
                    <li><a href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="MORE"}]</a></li>
                [{/if}]
            [{/foreach}]
        </ul>
    </li>
[{/if}]
