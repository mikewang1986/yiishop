<?php
/**
 * CLinkPager class file.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @link http://www.yiiframework.com/
 * @copyright 2008-2013 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

/**
 * CLinkPager displays a list of hyperlinks that lead to different pages of target.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @package system.web.widgets.pagers
 * @since 1.0
 */
class TbLinkPager extends CBasePager
{
    const CSS_FIRST_PAGE='first';
    const CSS_LAST_PAGE='last';
    const CSS_PREVIOUS_PAGE='previous';
    const CSS_NEXT_PAGE='next';
    const CSS_INTERNAL_PAGE='page';
    const CSS_HIDDEN_PAGE='hidden';
    const CSS_SELECTED_PAGE='active';

    /**
     * @var string the CSS class for the first page button. Defaults to 'first'.
     * @since 1.1.11
     */
    public $firstPageCssClass=self::CSS_FIRST_PAGE;
    /**
     * @var string the CSS class for the last page button. Defaults to 'last'.
     * @since 1.1.11
     */
    public $lastPageCssClass=self::CSS_LAST_PAGE;
    /**
     * @var string the CSS class for the previous page button. Defaults to 'previous'.
     * @since 1.1.11
     */
    public $previousPageCssClass=self::CSS_PREVIOUS_PAGE;
    /**
     * @var string the CSS class for the next page button. Defaults to 'next'.
     * @since 1.1.11
     */
    public $nextPageCssClass=self::CSS_NEXT_PAGE;
    /**
     * @var string the CSS class for the internal page buttons. Defaults to 'page'.
     * @since 1.1.11
     */
    public $internalPageCssClass=self::CSS_INTERNAL_PAGE;
    /**
     * @var string the CSS class for the hidden page buttons. Defaults to 'hidden'.
     * @since 1.1.11
     */
    public $hiddenPageCssClass=self::CSS_HIDDEN_PAGE;
    /**
     * @var string the CSS class for the selected page buttons. Defaults to 'selected'.
     * @since 1.1.11
     */
    public $selectedPageCssClass=self::CSS_SELECTED_PAGE;
    /**
     * @var integer maximum number of page buttons that can be displayed. Defaults to 10.
     */
    public $maxButtonCount=5;
    /**
     * @var string the text label for the next page button. Defaults to 'Next &gt;'.
     * Setting this to false will disable this button.
     */
    public $nextPageLabel='&rsaquo;';
    /**
     * @var string the text label for the previous page button. Defaults to '&lt; Previous'.
     * Setting this to false will disable this button.
     */
    public $prevPageLabel='&lsaquo;';
    /**
     * @var string the text label for the first page button. Defaults to '&lt;&lt; First'.
     * Setting this to false will disable this button.
     */
    public $firstPageLabel='&laquo;';
    /**
     * @var string the text label for the last page button. Defaults to 'Last &gt;&gt;'.
     * Setting this to false will disable this button.
     */
    public $lastPageLabel='&raquo;';
    /**
     * @var string the text shown before page buttons. Defaults to 'Go to page: '.
     */
    public $header='';
    /**
     * @var string the text shown after page buttons.
     */
    public $footer='';
    /**
     * @var mixed the CSS file used for the widget. Defaults to null, meaning
     * using the default CSS file included together with the widget.
     * If false, no CSS file will be used. Otherwise, the specified CSS file
     * will be included when using this widget.
     */
    public $cssFile;
    /**
     * @var array HTML attributes for the pager container tag.
     */
    public $htmlOptions=array();

    public $is_ajax=false;

    public $pageSize = 10;

    /**
     * Initializes the pager by setting some default property values.
     */
    public function init()
    {
        if(!isset($this->htmlOptions['id']))
            $this->htmlOptions['id']='page-id';
        if(!isset($this->htmlOptions['class']))
            $this->htmlOptions['class']='pagination';
    }

    /**
     * Executes the widget.
     * This overrides the parent implementation by displaying the generated page buttons.
     */
    public function run()
    {
        $buttons=$this->createPageButtons();
        echo $this->header;
        echo $this->createHtml($buttons);
        echo $this->footer;
    }

    public function createHtml($buttons)
    {
        $count = $this->getItemCount();
        $start = $this->getCurrentPage() * $this->pageSize + 1;
        if ($count < ($this->getCurrentPage() + 1) * $this->pageSize)
            $end = $count;
        else $end = ($this->getCurrentPage() + 1) * $this->pageSize;
        $tip = Yii::t('zii',"共{$count}条记录,当前页:{$start}-{$end}条");

        $pagehtml = CHtml::tag('ul',$this->htmlOptions,implode("\n",$buttons));

        $html = '<div class="col-sm-6"><div class="dataTables_info" id="sample-table-2_info">'.$tip.'</div></div>';
        if (!empty($buttons))
            $html .= '<div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap">'.$pagehtml.'</div></div>';
        return $html;
    }

    /**
     * Creates the page buttons.
     * @return array a list of page buttons (in HTML code).
     */
    protected function createPageButtons()
    {
        //pageSize
        $this->setPageSize($this->pageSize);

        if(($pageCount=$this->getPageCount())<=1)
            return array();

        list($beginPage,$endPage)=$this->getPageRange();
        $currentPage=$this->getCurrentPage(false); // currentPage is calculated in getPageRange()
        $buttons=array();

        // first page
        if ($this->firstPageLabel !== false) {
            $buttons[]=$this->createPageButton($this->firstPageLabel,0,$this->firstPageCssClass,$currentPage<=0,false);
        }
        // prev page
        if ($this->prevPageLabel !== false) {
            if(($page=$currentPage-1)<0)
                $page=0;
            $buttons[]=$this->createPageButton($this->prevPageLabel,$page,$this->previousPageCssClass,$currentPage<=0,false);
        }

        // internal pages
        for($i=$beginPage;$i<=$endPage;++$i)
            $buttons[]=$this->createPageButton($i+1,$i,$this->internalPageCssClass,false,$i==$currentPage);

        // next page
        if ($this->nextPageLabel !== false) {
            if(($page=$currentPage+1)>=$pageCount-1)
                $page=$pageCount-1;
            $buttons[]=$this->createPageButton($this->nextPageLabel,$page,$this->nextPageCssClass,$currentPage>=$pageCount-1,false);
        }
        // last page
        if ($this->lastPageLabel !== false) {
            $buttons[]=$this->createPageButton($this->lastPageLabel,$pageCount-1,$this->lastPageCssClass,$currentPage>=$pageCount-1,false);
        }

        return $buttons;
    }

    /**
     * Creates a page button.
     * You may override this method to customize the page buttons.
     * @param string $label the text label for the button
     * @param integer $page the page number
     * @param string $class the CSS class for the page button.
     * @param boolean $hidden whether this page button is visible
     * @param boolean $selected whether this page button is selected
     * @return string the generated button
     */
    protected function createPageButton($label,$page,$class,$hidden,$selected)
    {

        if($selected) $class.=' '.($hidden ? $this->hiddenPageCssClass : $this->selectedPageCssClass);
        return '<li class="'.$class.'">'.CHtml::link($label,$this->createPageUrl($page)).'</li>';
    }

    /**
     * @return array the begin and end pages that need to be displayed.
     */
    protected function getPageRange()
    {
        $currentPage=$this->getCurrentPage();
        $pageCount=$this->getPageCount();

        $beginPage=max(0, $currentPage-(int)($this->maxButtonCount/2));
        if(($endPage=$beginPage+$this->maxButtonCount-1)>=$pageCount)
        {
            $endPage=$pageCount-1;
            $beginPage=max(0,$endPage-$this->maxButtonCount+1);
        }
        return array($beginPage,$endPage);
    }
}
