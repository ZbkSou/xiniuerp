## 开发

```bash
# 克隆项目
git clone https://gitee.com/y_project/RuoYi-Vue

# 进入项目目录
cd ruoyi-ui

# 安装依赖
npm install

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev
```

浏览器访问 http://localhost:80

## 发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```


### 字典使用

增加字典
```
data() {
return {
// 状态数据字典
statusOptions: [],
```
created()增加字典请求
```
created() {
    this.getList();
    this.getDicts("biz_product_category_status").then(response => {
      this.statusOptions = response.data;
    });
  },
```

页面增加

```
单选
 <el-form-item label="分类状态">
          <el-radio-group v-model="form.categoryStatus" >
            <el-radio
              v-for="dict in statusOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>
下拉 
   <el-form-item label="角色">
              <el-select v-model="form.roleIds" multiple placeholder="请选择">
                <el-option
                  v-for="item in roleOptions"
                  :key="item.roleId"
                  :label="item.roleName"
                  :value="item.roleId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </el-form-item>
            
  表头
       <el-table-column label="分类状态" align="center" prop="categoryStatus" >
        <template slot-scope="scope">
          <dict-tag :options="statusOptions" :value="scope.row.status"/>
        </template>
      </el-table-column>
```