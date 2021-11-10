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
              <el-col :span="24">
                <el-form-item label="日期范围" prop="field105">
                  <el-date-picker type="daterange" v-model="formData.field105" format="yyyy-MM-dd"
                                  value-format="yyyy-MM-dd" :style="{width: '100%'}" start-placeholder="开始日期"
                                  end-placeholder="结束日期" range-separator="至" clearable></el-date-picker>
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
    <el-col :sm="24" :lg="12" style="padding-left: 50px">
      <div id="orderChart" :style="{width: '1000px', height: '600px'}"></div>
    </el-col>
  </div>
</template>
<script>
import {listMaster, selectBizOrderMasterStatistics} from "@/api/biz/master";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        field114: undefined,
        field105: null,
        field108: undefined,
      },
      rules: {
        field114: [{
          required: true,
          message: '1老店2新店',
          trigger: 'blur'
        }],
        field105: [{
          required: true,
          message: '日期范围不能为空',
          trigger: 'change'
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
  },
  methods: {
    drawOrderLine(orderStatic) {
      console.log(orderStatic)
      let myChart = this.$echarts.init(document.getElementById('orderChart'))
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
      selectBizOrderMasterStatistics().then(response => {
        this.drawOrderLine(response.data);
        this.loading = false;
      });
    },
  }
}

</script>
<style>
</style>
