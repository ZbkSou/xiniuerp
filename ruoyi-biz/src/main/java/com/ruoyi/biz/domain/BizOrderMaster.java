package com.ruoyi.biz.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单主对象 biz_order_master
 * 
 * @author xiniu
 * @date 2021-09-12
 */
public class BizOrderMaster extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private Integer id;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String orderSn;

    /** 下单人ID */
    @Excel(name = "下单人ID")
    private Integer customerId;

    /** 收货人姓名 */
    @Excel(name = "收货人姓名")
    private String shippingUser;

    /** 省 */
    @Excel(name = "省")
    private Integer province;

    /** 市 */
    @Excel(name = "市")
    private Integer city;

    /** 区 */
    @Excel(name = "区")
    private Integer district;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 支付方式：1现金，2余额，3网银，4支付宝，5微信 */
    @Excel(name = "支付方式：1现金，2余额，3网银，4支付宝，5微信")
    private Integer paymentMethod;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private BigDecimal orderMoney;

    /** 优惠金额 */
    @Excel(name = "优惠金额")
    private BigDecimal districtMoney;

    /** 运费金额 */
    @Excel(name = "运费金额")
    private BigDecimal shippingMoney;

    /** 支付金额 */
    @Excel(name = "支付金额")
    private BigDecimal paymentMoney;

    /** 快递公司名称 */
    @Excel(name = "快递公司名称")
    private String shippingCompName;

    /** 快递单号 */
    @Excel(name = "快递单号")
    private String shippingSn;

    /** 是否拆分发货0否1是 */
    @Excel(name = "是否拆分发货0否1是")
    private Integer splitShipment;

    /** 渠道单号 */
    @Excel(name = "渠道单号")
    private String channelSn;

    /** 渠道名 */
    @Excel(name = "渠道名")
    private String channelName;

    /** 订单所在部门id */
    @Excel(name = "订单所在部门id")
    private Long deptId;

    /** 发货时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发货时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date shippingTime;

    /** 支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date payTime;

    /** 收货时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收货时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date receiveTime;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private Integer orderStatus;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setOrderSn(String orderSn)
    {
        this.orderSn = orderSn;
    }

    public String getOrderSn()
    {
        return orderSn;
    }
    public void setCustomerId(Integer customerId) 
    {
        this.customerId = customerId;
    }

    public Integer getCustomerId() 
    {
        return customerId;
    }
    public void setShippingUser(String shippingUser) 
    {
        this.shippingUser = shippingUser;
    }

    public String getShippingUser() 
    {
        return shippingUser;
    }
    public void setProvince(Integer province) 
    {
        this.province = province;
    }

    public Integer getProvince() 
    {
        return province;
    }
    public void setCity(Integer city) 
    {
        this.city = city;
    }

    public Integer getCity() 
    {
        return city;
    }
    public void setDistrict(Integer district) 
    {
        this.district = district;
    }

    public Integer getDistrict() 
    {
        return district;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setPaymentMethod(Integer paymentMethod) 
    {
        this.paymentMethod = paymentMethod;
    }

    public Integer getPaymentMethod() 
    {
        return paymentMethod;
    }
    public void setOrderMoney(BigDecimal orderMoney) 
    {
        this.orderMoney = orderMoney;
    }

    public BigDecimal getOrderMoney() 
    {
        return orderMoney;
    }
    public void setDistrictMoney(BigDecimal districtMoney) 
    {
        this.districtMoney = districtMoney;
    }

    public BigDecimal getDistrictMoney() 
    {
        return districtMoney;
    }
    public void setShippingMoney(BigDecimal shippingMoney) 
    {
        this.shippingMoney = shippingMoney;
    }

    public BigDecimal getShippingMoney() 
    {
        return shippingMoney;
    }
    public void setPaymentMoney(BigDecimal paymentMoney) 
    {
        this.paymentMoney = paymentMoney;
    }

    public BigDecimal getPaymentMoney() 
    {
        return paymentMoney;
    }
    public void setShippingCompName(String shippingCompName) 
    {
        this.shippingCompName = shippingCompName;
    }

    public String getShippingCompName() 
    {
        return shippingCompName;
    }
    public void setShippingSn(String shippingSn) 
    {
        this.shippingSn = shippingSn;
    }

    public String getShippingSn() 
    {
        return shippingSn;
    }
    public void setSplitShipment(Integer splitShipment) 
    {
        this.splitShipment = splitShipment;
    }

    public Integer getSplitShipment() 
    {
        return splitShipment;
    }
    public void setChannelSn(String channelSn) 
    {
        this.channelSn = channelSn;
    }

    public String getChannelSn() 
    {
        return channelSn;
    }
    public void setChannelName(String channelName) 
    {
        this.channelName = channelName;
    }

    public String getChannelName() 
    {
        return channelName;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setShippingTime(Date shippingTime) 
    {
        this.shippingTime = shippingTime;
    }

    public Date getShippingTime() 
    {
        return shippingTime;
    }
    public void setPayTime(Date payTime) 
    {
        this.payTime = payTime;
    }

    public Date getPayTime() 
    {
        return payTime;
    }
    public void setReceiveTime(Date receiveTime) 
    {
        this.receiveTime = receiveTime;
    }

    public Date getReceiveTime() 
    {
        return receiveTime;
    }
    public void setOrderStatus(Integer orderStatus) 
    {
        this.orderStatus = orderStatus;
    }

    public Integer getOrderStatus() 
    {
        return orderStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderSn", getOrderSn())
            .append("customerId", getCustomerId())
            .append("shippingUser", getShippingUser())
            .append("province", getProvince())
            .append("city", getCity())
            .append("district", getDistrict())
            .append("address", getAddress())
            .append("paymentMethod", getPaymentMethod())
            .append("orderMoney", getOrderMoney())
            .append("districtMoney", getDistrictMoney())
            .append("shippingMoney", getShippingMoney())
            .append("paymentMoney", getPaymentMoney())
            .append("shippingCompName", getShippingCompName())
            .append("shippingSn", getShippingSn())
            .append("splitShipment", getSplitShipment())
            .append("channelSn", getChannelSn())
            .append("channelName", getChannelName())
            .append("deptId", getDeptId())
            .append("createTime", getCreateTime())
            .append("shippingTime", getShippingTime())
            .append("payTime", getPayTime())
            .append("receiveTime", getReceiveTime())
            .append("orderStatus", getOrderStatus())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("createBy", getCreateBy())
            .toString();
    }
}
