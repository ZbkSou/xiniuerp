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
import com.ruoyi.biz.domain.BizDeliveryCost;
import com.ruoyi.biz.service.IBizDeliveryCostService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 发货成本Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/cost")
public class BizDeliveryCostController extends BaseController
{
    @Autowired
    private IBizDeliveryCostService bizDeliveryCostService;

    /**
     * 查询发货成本列表
     */
    @PreAuthorize("@ss.hasPermi('biz:cost:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizDeliveryCost bizDeliveryCost)
    {
        startPage();
        List<BizDeliveryCost> list = bizDeliveryCostService.selectBizDeliveryCostList(bizDeliveryCost);
        return getDataTable(list);
    }

    /**
     * 导出发货成本列表
     */
    @PreAuthorize("@ss.hasPermi('biz:cost:export')")
    @Log(title = "发货成本", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizDeliveryCost bizDeliveryCost)
    {
        List<BizDeliveryCost> list = bizDeliveryCostService.selectBizDeliveryCostList(bizDeliveryCost);
        ExcelUtil<BizDeliveryCost> util = new ExcelUtil<BizDeliveryCost>(BizDeliveryCost.class);
        return util.exportExcel(list, "发货成本数据");
    }

    /**
     * 获取发货成本详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:cost:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizDeliveryCostService.selectBizDeliveryCostById(id));
    }

    /**
     * 新增发货成本
     */
    @PreAuthorize("@ss.hasPermi('biz:cost:add')")
    @Log(title = "发货成本", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizDeliveryCost bizDeliveryCost)
    {
        return toAjax(bizDeliveryCostService.insertBizDeliveryCost(bizDeliveryCost));
    }

    /**
     * 修改发货成本
     */
    @PreAuthorize("@ss.hasPermi('biz:cost:edit')")
    @Log(title = "发货成本", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizDeliveryCost bizDeliveryCost)
    {
        return toAjax(bizDeliveryCostService.updateBizDeliveryCost(bizDeliveryCost));
    }

    /**
     * 删除发货成本
     */
    @PreAuthorize("@ss.hasPermi('biz:cost:remove')")
    @Log(title = "发货成本", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizDeliveryCostService.deleteBizDeliveryCostByIds(ids));
    }
}
