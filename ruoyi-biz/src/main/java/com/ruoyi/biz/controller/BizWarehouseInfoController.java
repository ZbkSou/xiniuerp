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
import com.ruoyi.biz.domain.BizWarehouseInfo;
import com.ruoyi.biz.service.IBizWarehouseInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 仓库信息Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/warehouseinfo")
public class BizWarehouseInfoController extends BaseController
{
    @Autowired
    private IBizWarehouseInfoService bizWarehouseInfoService;

    /**
     * 查询仓库信息列表
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseinfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizWarehouseInfo bizWarehouseInfo)
    {
        startPage();
        List<BizWarehouseInfo> list = bizWarehouseInfoService.selectBizWarehouseInfoList(bizWarehouseInfo);
        return getDataTable(list);
    }

    /**
     * 导出仓库信息列表
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseinfo:export')")
    @Log(title = "仓库信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizWarehouseInfo bizWarehouseInfo)
    {
        List<BizWarehouseInfo> list = bizWarehouseInfoService.selectBizWarehouseInfoList(bizWarehouseInfo);
        ExcelUtil<BizWarehouseInfo> util = new ExcelUtil<BizWarehouseInfo>(BizWarehouseInfo.class);
        return util.exportExcel(list, "仓库信息数据");
    }

    /**
     * 获取仓库信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseinfo:query')")
    @GetMapping(value = "/{wId}")
    public AjaxResult getInfo(@PathVariable("wId") Integer wId)
    {
        return AjaxResult.success(bizWarehouseInfoService.selectBizWarehouseInfoByWId(wId));
    }

    /**
     * 新增仓库信息
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseinfo:add')")
    @Log(title = "仓库信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizWarehouseInfo bizWarehouseInfo)
    {
        return toAjax(bizWarehouseInfoService.insertBizWarehouseInfo(bizWarehouseInfo));
    }

    /**
     * 修改仓库信息
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseinfo:edit')")
    @Log(title = "仓库信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizWarehouseInfo bizWarehouseInfo)
    {
        return toAjax(bizWarehouseInfoService.updateBizWarehouseInfo(bizWarehouseInfo));
    }

    /**
     * 删除仓库信息
     */
    @PreAuthorize("@ss.hasPermi('biz:warehouseinfo:remove')")
    @Log(title = "仓库信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{wIds}")
    public AjaxResult remove(@PathVariable Integer[] wIds)
    {
        return toAjax(bizWarehouseInfoService.deleteBizWarehouseInfoByWIds(wIds));
    }
}
