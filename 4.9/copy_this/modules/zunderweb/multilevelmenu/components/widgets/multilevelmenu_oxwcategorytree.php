<?php
class multilevelmenu_oxwcategorytree extends multilevelmenu_oxwcategorytree_parent
{
    public function render()
    {
        $this->_sThisTemplate = parent::render();

        if ($this->_sThisTemplate == 'widget/header/categorylist.tpl' ) {
            $this->_sThisTemplate = 'multilevelmenu_categorylist.tpl';
        }
        return $this->_sThisTemplate;
    }
}