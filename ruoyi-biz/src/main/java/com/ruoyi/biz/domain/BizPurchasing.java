package com.ruoyi.biz.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 进货对象 biz_purchasing
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizPurchasing extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 进货表ID */
    private Integer id;

    /** 货物总价 */
    @Excel(name = "货物总价")
    private Long totalGoodsPice;

    /** 额外包装成本 */
    @Excel(name = "额外包装成本")
    private Long extraPackageCost;

    /** 运输成本 */
    @Excel(name = "运输成本")
    private Long deliveryCost;

    /** 仓库ID */
    @Excel(name = "仓库ID")
    private Integer wId;

    /** 进货时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "进货时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purchasingTime;

    /** 结算时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结算时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 进仓时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "进仓时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date enterTime;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setTotalGoodsPice(Long totalGoodsPice) 
    {
        this.totalGoodsPice = totalGoodsPice;
    }

    public Long getTotalGoodsPice() 
    {
        return totalGoodsPice;
    }
    public void setExtraPackageCost(Long extraPackageCost) 
    {
        this.extraPackageCost = extraPackageCost;
    }

    public Long getExtraPackageCost() 
    {
        return extraPackageCost;
    }
    public void setDeliveryCost(Long deliveryCost) 
    {
        this.deliveryCost = deliveryCost;
    }

    public Long getDeliveryCost() 
    {
        return deliveryCost;
    }
    public void setwId(Integer wId) 
    {
        this.wId = wId;
    }

    public Integer getwId() 
    {
        return wId;
    }
    public void setPurchasingTime(Date purchasingTime) 
    {
        this.purchasingTime = purchasingTime;
    }

    public Date getPurchasingTime() 
    {
        return purchasingTime;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }
    public void setEnterTime(Date enterTime) 
    {
        this.enterTime = enterTime;
    }

    public Date getEnterTime() 
    {
        return enterTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("totalGoodsPice", getTotalGoodsPice())
            .append("extraPackageCost", getExtraPackageCost())
            .append("deliveryCost", getDeliveryCost())
            .append("wId", getwId())
            .append("purchasingTime", getPurchasingTime())
            .append("payTime", getPayTime())
            .append("enterTime", getEnterTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
