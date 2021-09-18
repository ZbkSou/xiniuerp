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
import com.ruoyi.biz.domain.BizPlatformToken;
import com.ruoyi.biz.service.IBizPlatformTokenService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 三方平台Controller
 * 
 * @author xiniu
 * @date 2021-09-12
 */
@RestController
@RequestMapping("/biz/token")
public class BizPlatformTokenController extends BaseController
{
    @Autowired
    private IBizPlatformTokenService bizPlatformTokenService;

    /**
     * 查询三方平台列表
     */
    @PreAuthorize("@ss.hasPermi('biz:token:list')")
    @GetMapping("/list")
    public TableDataInfo list(BizPlatformToken bizPlatformToken)
    {
        startPage();
        List<BizPlatformToken> list = bizPlatformTokenService.selectBizPlatformTokenList(bizPlatformToken);
        return getDataTable(list);
    }

    /**
     * 导出三方平台列表
     */
    @PreAuthorize("@ss.hasPermi('biz:token:export')")
    @Log(title = "三方平台", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(BizPlatformToken bizPlatformToken)
    {
        List<BizPlatformToken> list = bizPlatformTokenService.selectBizPlatformTokenList(bizPlatformToken);
        ExcelUtil<BizPlatformToken> util = new ExcelUtil<BizPlatformToken>(BizPlatformToken.class);
        return util.exportExcel(list, "三方平台数据");
    }

    /**
     * 获取三方平台详细信息
     */
    @PreAuthorize("@ss.hasPermi('biz:token:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(bizPlatformTokenService.selectBizPlatformTokenById(id));
    }

    /**
     * 新增三方平台
     */
    @PreAuthorize("@ss.hasPermi('biz:token:add')")
    @Log(title = "三方平台", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BizPlatformToken bizPlatformToken)
    {
        return toAjax(bizPlatformTokenService.insertBizPlatformToken(bizPlatformToken));
    }

    /**
     * 修改三方平台
     */
    @PreAuthorize("@ss.hasPermi('biz:token:edit')")
    @Log(title = "三方平台", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BizPlatformToken bizPlatformToken)
    {
        return toAjax(bizPlatformTokenService.updateBizPlatformToken(bizPlatformToken));
    }

    /**
     * 删除三方平台
     */
    @PreAuthorize("@ss.hasPermi('biz:token:remove')")
    @Log(title = "三方平台", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(bizPlatformTokenService.deleteBizPlatformTokenByIds(ids));
    }
}
