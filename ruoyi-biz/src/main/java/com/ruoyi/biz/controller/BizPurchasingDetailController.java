package com.ruoyi.biz.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.biz.domain.BizPurchasingDetail;
import com.ruoyi.biz.service.IBizPurchasingDetailService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 进货单详情Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/purchasingdetail")
public class BizPurchasingDetailController extends BaseController
{
    @Autowired
    private IBizPurchasingDetailService bizPurchasingDetailService;

    /**
     * 查询进货单详情列表
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasingdetail:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizPurchasingDetail bizPurchasingDetail)
    {
        startPage();
        List<BizPurchasingDetail> list = bizPurchasingDetailService.selectBizPurchasingDetailList(bizPurchasingDetail);
        return getDataTable(list);
    }

    /**
     * 导出进货单详情列表
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasingdetail:export')")
    @Log(title = "进货单详情", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizPurchasingDetail bizPurchasingDetail)
    {
        List<BizPurchasingDetail> list = bizPurchasingDetailService.selectBizPurchasingDetailList(bizPurchasingDetail);
        ExcelUtil<BizPurchasingDetail> util = new ExcelUtil<BizPurchasingDetail>(BizPurchasingDetail.class);
        return util.exportExcel(list, "进货单详情数据");
    }

    /**
     * 获取进货单详情详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasingdetail:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizPurchasingDetailService.selectBizPurchasingDetailById(id));
    }

    /**
     * 新增进货单详情
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasingdetail:add')")
    @Log(title = "进货单详情", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizPurchasingDetail bizPurchasingDetail)
    {
        return toAjax(bizPurchasingDetailService.insertBizPurchasingDetail(bizPurchasingDetail));
    }

    /**
     * 修改进货单详情
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasingdetail:edit')")
    @Log(title = "进货单详情", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizPurchasingDetail bizPurchasingDetail)
    {
        return toAjax(bizPurchasingDetailService.updateBizPurchasingDetail(bizPurchasingDetail));
    }

    /**
     * 删除进货单详情
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasingdetail:remove')")
    @Log(title = "进货单详情", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizPurchasingDetailService.deleteBizPurchasingDetailByIds(ids));
    }
}
