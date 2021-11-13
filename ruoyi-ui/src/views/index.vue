<template>
  <div>

    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <h2>犀牛电商数据</h2>
        <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="81px">
          <el-col :span="12">
              <el-col :span="24">
                <el-form-item label="店铺" prop="field114">
                  <el-input v-model="formData.field114" placeholder="1老店2新店" clearable :style="{width: '100%'}">
                  </el-input>
                </el-form-item>
              </el-col>
          </el-col>
          <el-col :span="24">
            <el-form-item size="large">
              <el-button type="primary" @click="submitForm">提交</el-button>
              <el-button @click="resetForm">重置</el-button>
            </el-form-item>
          </el-col>
        </el-form>
      </el-col>
    </el-row>
    <el-row :gutter="20">
    <el-col :sm="24" :lg="12" style="padding-left: 50px">
      <div id="orderChart" :style="{width: '1000px', height: '600px'}"></div>
    </el-col>
    </el-row>
    <el-row :gutter="20">
    <el-col :sm="24" :lg="12" style="padding-left: 50px">
      <div id="orderClassChart" :style="{width: '1000px', height: '500px'}"></div>
    </el-col>
      <el-col :sm="24" :lg="12" style="padding-left: 50px">
      <el-table v-loading="loading" :data="orderClassList" >
        <el-table-column label="产品名" align="center" prop="name" />
        <el-table-column label="数量" align="center" prop="value" />
      </el-table>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import {listMaster,selectBizOrderClass, selectBizOrderMasterStatistics} from "@/api/biz/master";
export default {
  components: {},
  props: [],
  data() {
    return {
      orderClassList: [],
      formData: {
        field114: undefined,
      },
      rules: {
        field114: [{
          required: true,
          message: '1老店2新店',
          trigger: 'blur'
        }],
      },

      orderStatic:{}
    }
  },
  computed: {},
  watch: {},
  created() {
  },
  mounted() {
    // this.drawOrderLine();
    this.getBizOrderMasterStatistics();
    this.getBizOrderClass();
  },
  methods: {

    drawOrderLine(orderStatic,HTMLElement) {
      let myChart = this.$echarts.init(HTMLElement)
      // 绘制图表
      var option = {
        title: {
          text: '订单统计'
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross',
            label: {
              backgroundColor: '#6a7985'
            }
          }
        },
        legend: {
          data: ['待发货', '未发货，退款成功', '已发货，待签收','已签收','已发货，退款成功',"已签收，退款成功"]
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [
          {
            type: 'category',
            boundaryGap: false,
            data: orderStatic.time
          }
        ],
        yAxis: [
          {
            type: 'value'
          }
        ],
        series: [
          {
            name: '待发货',
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            emphasis: {
              focus: 'series'
            },
            data:  orderStatic.daifahuoCount
          },
          {
            name: '未发货，退款成功',
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            emphasis: {
              focus: 'series'
            },
            data:  orderStatic.weifatuikuanCount
          },
          {
            name: '已发货，待签收',
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            emphasis: {
              focus: 'series'
            },
            data: orderStatic.yifaCount
          },
          {
            name: '已发货，退款成功',
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            emphasis: {
              focus: 'series'
            },
            data: orderStatic.yifatuikuanCount
          },
          {
            name: '已签收',
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            emphasis: {
              focus: 'series'
            },
            data: orderStatic.yiqianCount
          },
          {
            name: '已签收，退款成功',
            type: 'line',
            stack: 'Total',
            areaStyle: {},
            emphasis: {
              focus: 'series'
            },
            data: orderStatic.yiqianshoutuikuanCount
          },

        ]
      };
      myChart.setOption(option);
    },

    drawOrderClass(orderClassStatic,HTMLElement){
      let myChart = this.$echarts.init(HTMLElement)
      var option;

      option = {
        title: {
          text: '7天内产品分类',
          subtext: '7天内产品分类',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            name: 'Access From',
            type: 'pie',
            radius: '50%',
            data:orderClassStatic,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      };
      myChart.setOption(option);
    },
    submitForm() {
      this.$refs['elForm'].validate(valid => {
        if (!valid) return
        // TODO 提交表单
        drawOrderLine()
      })
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },

    getBizOrderMasterStatistics() {
      this.loading = true;
      selectBizOrderMasterStatistics({"type":this.formData.field114}).then(response => {
        this.drawOrderLine(response.data, document.getElementById('orderChart'));
        this.loading = false;
      });
    },

    getBizOrderClass(){
      this.loading = true;
      selectBizOrderClass({"type":this.formData.field114}).then(response => {

        this.orderClassList =response.data;
        this.drawOrderClass(response.data, document.getElementById('orderClassChart'));
        this.loading = false;
      });
    }
  }
}

</script>
<style>
</style>
