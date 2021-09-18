package com.ruoyi.biz.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 发货记录对象 biz_delivery_log
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizDeliveryLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 发货记录表ID */
    private Integer id;

    /** 订单ID */
    @Excel(name = "订单ID")
    private Integer orderId;

    /** 订单快照 */
    @Excel(name = "订单快照")
    private String orderCache;

    /** 包装盒使用记录 */
    @Excel(name = "包装盒使用记录")
    private String boxJson;

    /** 是否拆单0否1是 */
    @Excel(name = "是否拆单0否1是")
    private Integer splitShipment;

    /** 额外包装成本 */
    @Excel(name = "额外包装成本")
    private Long extraPackageCost;

    /** 人工成本需要单独支付 */
    @Excel(name = "人工成本需要单独支付")
    private Long packageCost;

    /** 单独支付快递成本 */
    @Excel(name = "单独支付快递成本")
    private Long deliveryCost;

    /** 仓库ID */
    @Excel(name = "仓库ID")
    private Integer wId;

    /** 是否结清包装人工0否1是 */
    @Excel(name = "是否结清包装人工0否1是")
    private Integer payExtraPackage;

    /** 是否结清快递0否1是 */
    @Excel(name = "是否结清快递0否1是")
    private Integer payExtraDelivery;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setOrderId(Integer orderId) 
    {
        this.orderId = orderId;
    }

    public Integer getOrderId() 
    {
        return orderId;
    }
    public void setOrderCache(String orderCache) 
    {
        this.orderCache = orderCache;
    }

    public String getOrderCache() 
    {
        return orderCache;
    }
    public void setBoxJson(String boxJson) 
    {
        this.boxJson = boxJson;
    }

    public String getBoxJson() 
    {
        return boxJson;
    }
    public void setSplitShipment(Integer splitShipment) 
    {
        this.splitShipment = splitShipment;
    }

    public Integer getSplitShipment() 
    {
        return splitShipment;
    }
    public void setExtraPackageCost(Long extraPackageCost) 
    {
        this.extraPackageCost = extraPackageCost;
    }

    public Long getExtraPackageCost() 
    {
        return extraPackageCost;
    }
    public void setPackageCost(Long packageCost) 
    {
        this.packageCost = packageCost;
    }

    public Long getPackageCost() 
    {
        return packageCost;
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
    public void setPayExtraPackage(Integer payExtraPackage) 
    {
        this.payExtraPackage = payExtraPackage;
    }

    public Integer getPayExtraPackage() 
    {
        return payExtraPackage;
    }
    public void setPayExtraDelivery(Integer payExtraDelivery) 
    {
        this.payExtraDelivery = payExtraDelivery;
    }

    public Integer getPayExtraDelivery() 
    {
        return payExtraDelivery;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("orderCache", getOrderCache())
            .append("boxJson", getBoxJson())
            .append("splitShipment", getSplitShipment())
            .append("extraPackageCost", getExtraPackageCost())
            .append("packageCost", getPackageCost())
            .append("deliveryCost", getDeliveryCost())
            .append("wId", getwId())
            .append("payExtraPackage", getPayExtraPackage())
            .append("payExtraDelivery", getPayExtraDelivery())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
