<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="库区编号" prop="storageNo">
        <el-input
          v-model="queryParams.storageNo"
          placeholder="请输入库区编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="货架编号" prop="shelfNo">
        <el-input
          v-model="queryParams.shelfNo"
          placeholder="请输入货架编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="货架名称" prop="shelfName">
        <el-input
          v-model="queryParams.shelfName"
          placeholder="请输入货架名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="货架类型" prop="shelfType">
        <el-select v-model="queryParams.shelfType" placeholder="请选择货架类型" clearable size="small">
          <el-option
            v-for="dict in shelfTypeOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="货架状态" prop="shelfStatus">
        <el-select v-model="queryParams.shelfStatus" placeholder="请选择货架状态" clearable size="small">
          <el-option
            v-for="dict in shelfStatusOptions"
            :key="dict.dictValue"
            :label="dict.dictLabel"
            :value="dict.dictValue"
          />
        </el-select>
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
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:shelfMenu:add']"
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
          v-hasPermi="['system:shelfMenu:edit']"
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
          v-hasPermi="['system:shelfMenu:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:shelfMenu:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shelfMenuList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="自增主键" align="center" prop="id" />-->
      <el-table-column label="id" align="center" type="index" width="50" />
      <el-table-column label="库区编号" align="center" prop="storageNo" />
      <el-table-column label="货架编号" align="center" prop="shelfNo" />
      <el-table-column label="货架名称" align="center" prop="shelfName" />
      <el-table-column label="货架类型" align="center" prop="shelfType" :formatter="shelfTypeFormat" />
      <el-table-column label="货架状态" align="center" prop="shelfStatus" :formatter="shelfStatusFormat" />
      <el-table-column label="货架层数" align="center" prop="shelfRow" />
      <el-table-column label="货架列数" align="center" prop="shelfCol" />
      <el-table-column label="货架规格" align="center" prop="shelfSpec" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:shelfMenu:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:shelfMenu:remove']"
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

    <!-- 添加或修改货架管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="库区编号" prop="storageNo">
          <el-input v-model="form.storageNo" placeholder="请输入库区编号" />
        </el-form-item>
        <el-form-item label="货架编号" prop="shelfNo">
          <el-input v-model="form.shelfNo" placeholder="请输入货架编号" />
        </el-form-item>
        <el-form-item label="货架名称" prop="shelfName">
          <el-input v-model="form.shelfName" placeholder="请输入货架名称" />
        </el-form-item>
        <el-form-item label="货架类型" prop="shelfType">
          <el-select v-model="form.shelfType" placeholder="请选择货架类型">
            <el-option
              v-for="dict in shelfTypeOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="货架状态" prop="shelfStatus">
          <el-select v-model="form.shelfStatus" placeholder="请选择货架状态">
            <el-option
              v-for="dict in shelfStatusOptions"
              :key="dict.dictValue"
              :label="dict.dictLabel"
              :value="parseInt(dict.dictValue)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="货架层数" prop="shelfRow">
          <el-input v-model="form.shelfRow" placeholder="请输入货架层数" />
        </el-form-item>
        <el-form-item label="货架列数" prop="shelfCol">
          <el-input v-model="form.shelfCol" placeholder="请输入货架列数" />
        </el-form-item>
        <el-form-item label="货架规格" prop="shelfSpec">
          <el-input v-model="form.shelfSpec" placeholder="请输入货架规格" />
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
import { listShelfMenu, getShelfMenu, delShelfMenu, addShelfMenu, updateShelfMenu, exportShelfMenu } from "@/api/system/shelfMenu";

export default {
  name: "ShelfMenu",
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
      // 货架管理表格数据
      shelfMenuList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 货架类型字典
      shelfTypeOptions: [],
      // 货架状态字典
      shelfStatusOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        storageNo: null,
        shelfNo: null,
        shelfName: null,
        shelfType: null,
        shelfStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        storageNo: [
          { required: true, message: "库区编号不能为空", trigger: "blur" }
        ],
        shelfNo: [
          { required: true, message: "货架编号不能为空", trigger: "blur" }
        ],
        shelfName: [
          { required: true, message: "货架名称不能为空", trigger: "blur" }
        ],
        shelfType: [
          { required: true, message: "货架类型不能为空", trigger: "change" }
        ],
        shelfStatus: [
          { required: true, message: "货架状态不能为空", trigger: "change" }
        ],
        shelfRow: [
          { required: true, message: "货架层数不能为空", trigger: "blur" }
        ],
        shelfCol: [
          { required: true, message: "货架列数不能为空", trigger: "blur" }
        ],
        shelfSpec: [
          { required: true, message: "货架规格不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
    this.getDicts("shelf_type").then(response => {
      this.shelfTypeOptions = response.data;
    });
    this.getDicts("status").then(response => {
      this.shelfStatusOptions = response.data;
    });
  },
  methods: {
    /** 查询货架管理列表 */
    getList() {
      this.loading = true;
      listShelfMenu(this.queryParams).then(response => {
        this.shelfMenuList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 货架类型字典翻译
    shelfTypeFormat(row, column) {
      return this.selectDictLabel(this.shelfTypeOptions, row.shelfType);
    },
    // 货架状态字典翻译
    shelfStatusFormat(row, column) {
      return this.selectDictLabel(this.shelfStatusOptions, row.shelfStatus);
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
        storageNo: null,
        shelfNo: null,
        shelfName: null,
        shelfType: null,
        shelfStatus: null,
        shelfRow: null,
        shelfCol: null,
        shelfSpec: null,
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
      this.reset();
      this.open = true;
      this.title = "添加货架管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getShelfMenu(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改货架管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateShelfMenu(this.form).then(response => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addShelfMenu(this.form).then(response => {
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
      this.$confirm('是否确认删除货架管理编号为"' + ids + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delShelfMenu(ids);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有货架管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportShelfMenu(queryParams);
        }).then(response => {
          this.download(response.msg);
        })
    }
  }
};
</script>
