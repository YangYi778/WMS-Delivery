<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="任务编号" prop="taskNo">
        <el-input
          v-model="queryParams.taskNo"
          placeholder="请输入任务编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务类型" prop="taskType">
        <el-select v-model="queryParams.taskType" placeholder="请选择任务类型" clearable size="small">
          <el-option
            v-for="dict in taskTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="任务状态" prop="taskStatus">
        <el-select v-model="queryParams.taskStatus" placeholder="请选择任务状态" clearable size="small">
          <el-option
            v-for="dict in taskStatusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="发布人编号" prop="publisherNo">
        <el-input
          v-model="queryParams.publisherNo"
          placeholder="请输入发布人编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发布人姓名" prop="publisherName">
        <el-input
          v-model="queryParams.publisherName"
          placeholder="请输入发布人姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接收人编号" prop="recipientNo">
        <el-input
          v-model="queryParams.recipientNo"
          placeholder="请输入接收人编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="接收人姓名" prop="recipientName">
        <el-input
          v-model="queryParams.recipientName"
          placeholder="请输入接收人姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="任务等级" prop="taskLevel">
        <el-select v-model="queryParams.taskLevel" placeholder="请选择任务等级" clearable size="small">
          <el-option
            v-for="dict in taskLevelOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="任务描述" prop="taskDesc">
        <el-input
          v-model="queryParams.taskDesc"
          placeholder="请输入任务描述"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-select v-model="taskModel" placeholder="请选择任务生成模式" style="width: 180px">
          <el-option
            v-for="dict in taskModelOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:taskMenu:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:taskMenu:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:taskMenu:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:taskMenu:remove']"
        >发布</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:taskMenu:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="taskMenuList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="自增主键" align="center" prop="id" />-->
      <el-table-column label="id" align="center" type="index" width="50" />
      <el-table-column label="任务编号" align="center" prop="taskNo" />
      <el-table-column label="任务类型" align="center" prop="taskType" :formatter="taskTypeFormat" />
      <el-table-column label="任务状态" align="center" prop="taskStatus" :formatter="taskStatusFormat" />
      <el-table-column label="发布人编号" align="center" prop="publisherNo" />
      <el-table-column label="发布人姓名" align="center" prop="publisherName" />
      <el-table-column label="接收人编号" align="center" prop="recipientNo" />
      <el-table-column label="接收人姓名" align="center" prop="recipientName" />
      <el-table-column label="任务等级" align="center" prop="taskLevel" :formatter="taskLevelFormat" />
      <el-table-column label="任务描述" align="center" prop="taskDesc" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:taskMenu:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:taskMenu:remove']"
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

    <!-- 添加或修改任务管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="任务编号" prop="taskNo">-->
<!--          <el-input v-model="form.taskNo" placeholder="请输入任务编号" />-->
<!--        </el-form-item>-->
        <el-form-item label="任务类型" prop="taskType">
          <el-select v-model="form.taskType" placeholder="请选择任务类型">
            <el-option
              v-for="dict in taskTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
        </el-form-item>
<!--        <el-form-item label="任务状态" prop="taskStatus">-->
<!--          <el-select v-model="form.taskStatus" placeholder="请选择任务状态">-->
<!--            <el-option-->
<!--              v-for="dict in taskStatusOptions"-->
<!--              :key="dict.dictValue"-->
<!--              :label="dict.dictLabel"-->
<!--              :value="parseInt(dict.dictValue)"-->
<!--            ></el-option>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="发布人编号" prop="publisherNo">-->
<!--          <el-input v-model="form.publisherNo" placeholder="请输入发布人编号" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="发布人姓名" prop="publisherName">-->
<!--          <el-input v-model="form.publisherName" placeholder="请输入发布人姓名" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="接收人编号" prop="recipientNo">-->
<!--          <el-input v-model="form.recipientNo" placeholder="请输入接收人编号" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="接收人姓名" prop="recipientName">-->
<!--          <el-input v-model="form.recipientName" placeholder="请输入接收人姓名" />-->
<!--        </el-form-item>-->
        <el-form-item label="任务等级" prop="taskLevel">
          <el-select v-model="form.taskLevel" placeholder="请选择任务等级">
            <el-option
              v-for="dict in taskLevelOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="关联信息" prop="relateInfo">
          <el-select v-model="form.relatedInfo" placeholder="请选择关联信息">
            <el-option
              v-for="dict in relatedInfoOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
              ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="任务描述" prop="taskDesc">
          <el-input v-model="form.taskDesc" placeholder="请输入任务描述" />
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
import { listTaskMenu, getTaskMenu, delTaskMenu, addTaskMenu, updateTaskMenu, getRelatedInfo, exportTaskMenu } from "@/api/system/taskMenu";

export default {
  name: "TaskMenu",
  components: {
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 任务管理表格数据
      taskMenuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 任务生成类型
      taskModel: "",
      // 任务类型字典
      taskTypeOptions: [],
      // 任务状态字典
      taskStatusOptions: [],
      // 任务等级字典
      taskLevelOptions: [],
      //关联信息字典
      relatedInfoOptions: [],
      //任务生成模式字典
      taskModelOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskNo: null,
        taskType: null,
        taskStatus: null,
        publisherNo: null,
        publisherName: null,
        recipientNo: null,
        recipientName: null,
        taskLevel: null,
        relatedInfo: null,
        taskDesc: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        taskNo: [
          { required: true, message: "任务编号不能为空", trigger: "blur" }
        ],
        taskType: [
          { required: true, message: "任务类型不能为空", trigger: "change" }
        ],
        taskStatus: [
          { required: true, message: "任务状态不能为空", trigger: "change" }
        ],
        publisherNo: [
          { required: true, message: "发布人编号不能为空", trigger: "blur" }
        ],
        publisherName: [
          { required: true, message: "发布人姓名不能为空", trigger: "blur" }
        ],
        recipientNo: [
          { required: true, message: "接收人编号不能为空", trigger: "blur" }
        ],
        recipientName: [
          { required: true, message: "接收人姓名不能为空", trigger: "blur" }
        ],
        taskLevel: [
          { required: true, message: "任务等级不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("task_type").then(response => {
      this.taskTypeOptions = response.data;
    });
    this.getDicts("task_status").then(response => {
      this.taskStatusOptions = response.data;
    });
    this.getDicts("task_level").then(response => {
      this.taskLevelOptions = response.data;
    });
    this.getDicts("task_model").then(response =>{
      this.taskModelOptions = response.data;
    });
  },
  methods: {
    /** 查询任务管理列表 */
    getList() {
      this.loading = true;
      listTaskMenu(this.queryParams).then(response => {
        this.taskMenuList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 任务类型字典翻译
    taskTypeFormat(row, column) {
      return this.selectDictLabel(this.taskTypeOptions, row.taskType);
    },
    // 任务状态字典翻译
    taskStatusFormat(row, column) {
      return this.selectDictLabel(this.taskStatusOptions, row.taskStatus);
    },
    // 任务等级字典翻译
    taskLevelFormat(row, column) {
      return this.selectDictLabel(this.taskLevelOptions, row.taskLevel);
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
        taskNo: null,
        taskType: null,
        taskStatus: null,
        publisherNo: null,
        publisherName: null,
        recipientNo: null,
        recipientName: null,
        taskLevel: null,
        taskDesc: null,
        createTime: null,
        createUser: null,
        updateTime: null,
        updateUser: null,
        yn: null,
        ts: null
      };
      this.resetForm("form");
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.handleRelatedInfo();
      this.reset();
      this.open = true;
      this.title = "添加任务管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getTaskMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改任务管理";
      });
    },
    /** 获取关联信息*/
    handleRelatedInfo(){
      const taskModel = this.taskModel;
      console.info("调用js方法之前：taskModel==" + taskModel)
      getRelatedInfo(taskModel).then(response =>{
        this.relatedInfoOptions = response.data;
        this.msgSuccess("获取关联信息成功");
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateTaskMenu(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTaskMenu(this.form).then(response => {
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
      this.$confirm('是否确认删除任务管理编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delTaskMenu(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有任务管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportTaskMenu(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
