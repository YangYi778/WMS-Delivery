<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="波次号" prop="batchNo">
        <el-input
          v-model="queryParams.batchNo"
          placeholder="请输入波次号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入订单号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单类型" prop="orderType">
        <el-select v-model="queryParams.orderType" placeholder="请选择订单类型" clearable size="small">
          <el-option
            v-for="dict in orderTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="订单状态" prop="orderStatus" v-show="false">
        <el-select v-model="queryParams.orderStatus" placeholder="请选择订单状态"  clearable size="small">
          <el-option
            v-for="dict in orderStatusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="订单来源" prop="orderOrigin">
        <el-select v-model="queryParams.orderOrigin" placeholder="请选择订单来源" clearable size="small">
          <el-option
            v-for="dict in orderOriginOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="订单等级" prop="orderLevel">
        <el-select v-model="queryParams.orderLevel" placeholder="请选择订单等级" clearable size="small" style="width: 150px">
          <el-option
            v-for="dict in orderLevelOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="客户编码" prop="custNo">
        <el-input
          v-model="queryParams.custNo"
          placeholder="请输入客户编码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户名称" prop="custName">
        <el-input
          v-model="queryParams.custName"
          placeholder="请输入客户名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="防重码" prop="uuid">
        <el-input
          v-model="queryParams.uuid"
          placeholder="请输入防重码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="交接部门名称" prop="hodeptName">-->
<!--        <el-input-->
<!--          v-model="queryParams.hodeptName"-->
<!--          placeholder="请输入交接部门名称"-->
<!--          clearable-->
<!--          size="small"-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="任务单号" prop="taskNo">
        <el-input
          v-model="queryParams.taskNo"
          placeholder="请输入任务单号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单优先级" prop="orderPriority" label-width="82px">
        <el-select v-model="queryParams.orderPriority" placeholder="请选择订单优先级" clearable size="small" style="width: 170px">
          <el-option
            v-for="dict in orderPriorityOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="计划出库时间" prop="planDeliveryTime">
        <el-date-picker clearable size="small"
          v-model="queryParams.planDeliveryTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择计划出库时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="时间范围" prop="field101">
        <el-time-picker v-model="queryParams.dateTimeRange" is-range format="HH:mm:ss" value-format="HH:mm:ss"
                        :style="{width: '100%'}" start-placeholder="开始时间" end-placeholder="结束时间" range-separator="至"
                        clearable>
        </el-time-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-s-check"
          size="mini"
          :disabled="multiple"
          @click="handleConfirm"
          v-hasPermi="['system:innerOrderMenu:confirm']"
        >确认受理</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="multiple"
          @click="handleUpdate"
          v-hasPermi="['system:innerOrderMenu:edit']"
        >订单转接</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:innerOrderMenu:remove']"
        >打印入库任务单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:innerOrderMenu:remove']"
        >打印入库验收报告</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:innerOrderMenu:export']"
        >导出</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleGenerate"
          v-hasPermi="['system:orderMenu:generate']"
        >生成批次</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderMenuList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
<!--      <el-table-column label="id" align="center" type="index" width="50" />-->
      <el-table-column label="波次号" align="center" prop="batchNo" />
      <el-table-column label="订单号" align="center" prop="orderNo" />
      <el-table-column label="订单类型" align="center" prop="orderType" :formatter="orderTypeFormat" />
      <el-table-column label="订单状态" align="center" prop="orderStatus" :formatter="orderStatusFormat" />
      <el-table-column label="订单来源" align="center" prop="orderOrigin" :formatter="orderOriginFormat" />
      <el-table-column label="订单等级" align="center" prop="orderLevel" :formatter="orderLevelFormat" />
      <el-table-column label="客户编码" align="center" prop="custNo" />
      <el-table-column label="客户名称" align="center" prop="custName" />
      <el-table-column label="订单总体积" align="center" prop="totalVolume" />
      <el-table-column label="订单总重量" align="center" prop="totalWeight" />
      <el-table-column label="防重码" align="center" prop="uuid" />
      <el-table-column label="收货人" align="center" prop="receName" />
      <el-table-column label="收货人联系电话" align="center" prop="recePhone" />
      <el-table-column label="收货人地址" align="center" prop="receAddress" />
      <el-table-column label="交接部门名称" align="center" prop="hodeptName" />
      <el-table-column label="交接部门编码" align="center" prop="hodeptNo" />
      <el-table-column label="交接人姓名" align="center" prop="houserName" />
      <el-table-column label="任务单号" align="center" prop="taskNo" />
      <el-table-column label="订单优先级" align="center" prop="orderPriority" :formatter="orderPriorityFormat" />
      <el-table-column label="计划出库时间" align="center" prop="planDeliveryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.planDeliveryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:innerOrderMenu:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:innerOrderMenu:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改订单管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="波次号" prop="batchNo">
          <el-input v-model="form.batchNo" placeholder="请输入波次号" />
        </el-form-item>
        <el-form-item label="订单号" prop="orderNo">
          <el-input v-model="form.orderNo" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="订单类型" prop="orderType">
          <el-select v-model="form.orderType" placeholder="请选择订单类型">
            <el-option
              v-for="dict in orderTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单状态" prop="orderStatus">
          <el-select v-model="form.orderStatus" placeholder="请选择订单状态">
            <el-option
              v-for="dict in orderStatusOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单来源" prop="orderOrigin">
          <el-select v-model="form.orderOrigin" placeholder="请选择订单来源">
            <el-option
              v-for="dict in orderOriginOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单等级" prop="orderLevel">
          <el-select v-model="form.orderLevel" placeholder="请选择订单等级">
            <el-option
              v-for="dict in orderLevelOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="dict.dictValue"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="客户编码" prop="custNo">
          <el-input v-model="form.custNo" placeholder="请输入客户编码" />
        </el-form-item>
        <el-form-item label="客户名称" prop="custName">
          <el-input v-model="form.custName" placeholder="请输入客户名称" />
        </el-form-item>
        <el-form-item label="订单总体积" prop="totalVolume">
          <el-input v-model="form.totalVolume" placeholder="请输入订单总体积" />
        </el-form-item>
        <el-form-item label="订单总重量" prop="totalWeight">
          <el-input v-model="form.totalWeight" placeholder="请输入订单总重量" />
        </el-form-item>
        <el-form-item label="防重码" prop="uuid">
          <el-input v-model="form.uuid" placeholder="请输入防重码" />
        </el-form-item>
        <el-form-item label="收货人" prop="receName">
          <el-input v-model="form.receName" placeholder="请输入收货人" />
        </el-form-item>
        <el-form-item label="收货人联系电话" prop="recePhone">
          <el-input v-model="form.recePhone" placeholder="请输入收货人联系电话" />
        </el-form-item>
        <el-form-item label="收货人地址" prop="receAddress">
          <el-input v-model="form.receAddress" placeholder="请输入收货人地址" />
        </el-form-item>
        <el-form-item label="交接部门名称" prop="hodeptName">
          <el-input v-model="form.hodeptName" placeholder="请输入交接部门名称" />
        </el-form-item>
        <el-form-item label="交接部门编码" prop="hodeptNo">
          <el-input v-model="form.hodeptNo" placeholder="请输入交接部门编码" />
        </el-form-item>
        <el-form-item label="交接人姓名" prop="houserName">
          <el-input v-model="form.houserName" placeholder="请输入交接人姓名" />
        </el-form-item>
        <el-form-item label="任务单号" prop="taskNo">
          <el-input v-model="form.taskNo" placeholder="请输入任务单号" />
        </el-form-item>
        <el-form-item label="订单优先级" prop="orderPriority">
          <el-select v-model="form.orderPriority" placeholder="请选择订单优先级">
            <el-option
              v-for="dict in orderPriorityOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="计划出库时间" prop="planDeliveryTime">
          <el-date-picker clearable size="small"
            v-model="form.planDeliveryTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择计划出库时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 批次生成对话框 -->
    <el-dialog :title="batchTitle" :visible.sync="batchOpen" width="500px" append-to-body>
      <el-form ref="batchForm" :model="batchForm" size="medium" label-width="100px">

        <el-form-item label="批次号" prop="batchNo">
          <el-input v-model="batchForm.batchNo" placeholder="请输入批次号" readonly clearable
                    :style="{width: '100%'}"></el-input>
        </el-form-item>

        <el-form-item label="关联订单" prop="orderNos">
          <el-select v-model="batchForm.orderNos" placeholder="请选择关联订单" clearable
                     :style="{width: '100%'}">
            <el-option
              v-for="item in orderNoList"
              :key="item"
              :label="item"
              :value="item"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="波次规则" prop="field106">
          <el-select v-model="batchForm.batchRuleList" placeholder="请选择波次规则" clearable
                     :style="{width: '100%'}">
            <el-option v-for="(item, index) in batchRuleOptions" :key="index" :label="item.label"
                       :value="item.value" :disabled="item.disabled"></el-option>
          </el-select>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrderMenu, getOrderMenu, delOrderMenu, orderConfirm, orderBatchGenerate, addOrderMenu, updateOrderMenu, exportOrderMenu } from "@/api/system/innerOrderMenu";

export default {
  name: "InnerOrderMenu",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 批量操作订单号
      orders: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单管理表格数据
      orderMenuList: [],
      // 弹出层标题
      title: "",
      //批次生成弹出层标题
      batchTitle: "",
      // 是否显示弹出层
      open: false,
      // 是否显示批次生成弹出层
      batchOpen: false,
      // 订单类型字典
      orderTypeOptions: [],
      // 订单状态字典
      orderStatusOptions: [],
      // 订单来源字典
      orderOriginOptions: [],
      // 订单等级字典
      orderLevelOptions: [],
      // 订单优先级字典
      orderPriorityOptions: [],
      // 批次规则字典
      batchRuleOptions: [],
      //波次关联订单列表
      orderNoList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        batchNo: null,
        orderNo: null,
        orderType: null,
        orderStatus: null,
        orderOrigin: null,
        orderLevel: null,
        custNo: null,
        custName: null,
        uuid: null,
        hodeptName: null,
        taskNo: null,
        orderPriority: null,
        planDeliveryTime: null,
        dateTimeRange: null
      },
      // 表单参数
      form: {},
      //波次表单
      batchForm: {},
      // 表单校验
      rules: {
        batchNo: [
          { required: true, message: "波次号不能为空", trigger: "blur" }
        ],
        orderNo: [
          { required: true, message: "订单号不能为空", trigger: "blur" }
        ],
        orderType: [
          { required: true, message: "订单类型不能为空", trigger: "change" }
        ],
        orderStatus: [
          { required: true, message: "订单状态不能为空", trigger: "change" }
        ],
        orderOrigin: [
          { required: true, message: "订单来源不能为空", trigger: "change" }
        ],
        orderLevel: [
          { required: true, message: "订单等级不能为空", trigger: "change" }
        ],
        custNo: [
          { required: true, message: "客户编码不能为空", trigger: "blur" }
        ],
        custName: [
          { required: true, message: "客户名称不能为空", trigger: "blur" }
        ],
        uuid: [
          { required: true, message: "防重码不能为空", trigger: "blur" }
        ],
        receName: [
          { required: true, message: "收货人不能为空", trigger: "blur" }
        ],
        recePhone: [
          { required: true, message: "收货人联系电话不能为空", trigger: "blur" }
        ],
        receAddress: [
          { required: true, message: "收货人地址不能为空", trigger: "blur" }
        ],
        hodeptName: [
          { required: true, message: "交接部门名称不能为空", trigger: "blur" }
        ],
        hodeptNo: [
          { required: true, message: "交接部门编码不能为空", trigger: "blur" }
        ],
        houserName: [
          { required: true, message: "交接人姓名不能为空", trigger: "blur" }
        ],
        taskNo: [
          { required: true, message: "任务单号不能为空", trigger: "blur" }
        ],
        orderPriority: [
          { required: true, message: "订单优先级不能为空", trigger: "change" }
        ],
        planDeliveryTime: [
          { required: true, message: "计划出库时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("order_type").then(response => {
      this.orderTypeOptions = response.data;
    });
    this.getDicts("order_status").then(response => {
      this.orderStatusOptions = response.data;
    });
    this.getDicts("order_origin").then(response => {
      this.orderOriginOptions = response.data;
    });
    this.getDicts("order_level").then(response => {
      this.orderLevelOptions = response.data;
    });
    this.getDicts("order_priority").then(response => {
      this.orderPriorityOptions = response.data;
    });
  },
  methods: {
    /** 查询订单管理列表 */
    getList() {
      this.loading = true;
      listOrderMenu(this.queryParams).then(response => {
        this.orderMenuList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 订单类型字典翻译
    orderTypeFormat(row, column) {
      return this.selectDictLabel(this.orderTypeOptions, row.orderType);
    },
    // 订单状态字典翻译
    orderStatusFormat(row, column) {
      return this.selectDictLabel(this.orderStatusOptions, row.orderStatus);
    },
    // 订单来源字典翻译
    orderOriginFormat(row, column) {
      return this.selectDictLabel(this.orderOriginOptions, row.orderOrigin);
    },
    // 订单等级字典翻译
    orderLevelFormat(row, column) {
      return this.selectDictLabel(this.orderLevelOptions, row.orderLevel);
    },
    // 订单优先级字典翻译
    orderPriorityFormat(row, column) {
      return this.selectDictLabel(this.orderPriorityOptions, row.orderPriority);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        batchNo: null,
        orderNo: null,
        orderType: null,
        orderStatus: null,
        orderOrigin: null,
        orderLevel: null,
        custNo: null,
        custName: null,
        totalVolume: null,
        totalWeight: null,
        uuid: null,
        receName: null,
        recePhone: null,
        receAddress: null,
        hodeptName: null,
        hodeptNo: null,
        houserName: null,
        createTime: null,
        createUser: null,
        updateTime: null,
        updateUser: null,
        yn: null,
        ts: null,
        taskNo: null,
        orderPriority: null,
        planDeliveryTime: null
      };
      this.resetForm("form");
    },
    batchFormReset() {
      this.form = {
        batchNo: null,
        orderNos: null,
        batchRuleList: null
      };
      this.resetForm("batchForm");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.orders = selection.map(item => item.orderNo)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrderMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrderMenu(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrderMenu(this.form).then(response => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$confirm('是否确认删除订单管理编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delOrderMenu(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 确认受理按钮 */
    handleConfirm() {
      console.info(this.orders);
      const orders = this.orders;
      this.$confirm('是否确认受理订单编号为"' + orders + '"的订单？', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return orderConfirm(orders);
      }).then(() => {
        this.getList();
        this.msgSuccess("受理成功");
      })
    },
    /** 批次生成 */
    handleGenerate() {
      console.info(this.orders);
      const orders = this.orders;
      this.$confirm('是否将订单编号为"' + orders + '"的订单绑定为同一批次？', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function () {
        return orderBatchGenerate(orders);
      }).then(() => {
        this.getList();
        this.msgSuccess("绑定成功");
      })
    },

    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有订单管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportOrderMenu(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
