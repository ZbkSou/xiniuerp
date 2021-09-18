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
import com.ruoyi.biz.domain.BizDeliveryLog;
import com.ruoyi.biz.service.IBizDeliveryLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 发货记录Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/log")
public class BizDeliveryLogController extends BaseController
{
    @Autowired
    private IBizDeliveryLogService bizDeliveryLogService;

    /**
     * 查询发货记录列表
     */
    @PreAuthorize("@ss.hasPermi('biz:log:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizDeliveryLog bizDeliveryLog)
    {
        startPage();
        List<BizDeliveryLog> list = bizDeliveryLogService.selectBizDeliveryLogList(bizDeliveryLog);
        return getDataTable(list);
    }

    /**
     * 导出发货记录列表
     */
    @PreAuthorize("@ss.hasPermi('biz:log:export')")
    @Log(title = "发货记录", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizDeliveryLog bizDeliveryLog)
    {
        List<BizDeliveryLog> list = bizDeliveryLogService.selectBizDeliveryLogList(bizDeliveryLog);
        ExcelUtil<BizDeliveryLog> util = new ExcelUtil<BizDeliveryLog>(BizDeliveryLog.class);
        return util.exportExcel(list, "发货记录数据");
    }

    /**
     * 获取发货记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:log:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(bizDeliveryLogService.selectBizDeliveryLogById(id));
    }

    /**
     * 新增发货记录
     */
    @PreAuthorize("@ss.hasPermi('biz:log:add')")
    @Log(title = "发货记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizDeliveryLog bizDeliveryLog)
    {
        return toAjax(bizDeliveryLogService.insertBizDeliveryLog(bizDeliveryLog));
    }

    /**
     * 修改发货记录
     */
    @PreAuthorize("@ss.hasPermi('biz:log:edit')")
    @Log(title = "发货记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizDeliveryLog bizDeliveryLog)
    {
        return toAjax(bizDeliveryLogService.updateBizDeliveryLog(bizDeliveryLog));
    }

    /**
     * 删除发货记录
     */
    @PreAuthorize("@ss.hasPermi('biz:log:remove')")
    @Log(title = "发货记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(bizDeliveryLogService.deleteBizDeliveryLogByIds(ids));
    }
}
