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
import com.ruoyi.biz.domain.BizPurchasing;
import com.ruoyi.biz.service.IBizPurchasingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 进货Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/purchasing")
public class BizPurchasingController extends BaseController
{
    @Autowired
    private IBizPurchasingService bizPurchasingService;

    /**
     * 查询进货列表
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizPurchasing bizPurchasing)
    {
        startPage();
        List<BizPurchasing> list = bizPurchasingService.selectBizPurchasingList(bizPurchasing);
        return getDataTable(list);
    }

    /**
     * 导出进货列表
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:export')")
    @Log(title = "进货", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizPurchasing bizPurchasing)
    {
        List<BizPurchasing> list = bizPurchasingService.selectBizPurchasingList(bizPurchasing);
        ExcelUtil<BizPurchasing> util = new ExcelUtil<BizPurchasing>(BizPurchasing.class);
        return util.exportExcel(list, "进货数据");
    }

    /**
     * 获取进货详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizPurchasingService.selectBizPurchasingById(id));
    }

    /**
     * 新增进货
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:add')")
    @Log(title = "进货", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizPurchasing bizPurchasing)
    {
        return toAjax(bizPurchasingService.insertBizPurchasing(bizPurchasing));
    }

    /**
     * 修改进货
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:edit')")
    @Log(title = "进货", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizPurchasing bizPurchasing)
    {
        return toAjax(bizPurchasingService.updateBizPurchasing(bizPurchasing));
    }

    /**
     * 删除进货
     */
    @PreAuthorize("@ss.hasPermi('biz:purchasing:remove')")
    @Log(title = "进货", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizPurchasingService.deleteBizPurchasingByIds(ids));
    }
}
