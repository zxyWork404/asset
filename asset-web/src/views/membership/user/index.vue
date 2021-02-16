<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px">
      <el-form-item label="机构代码/身份证" prop="codeCard">
        <el-input
          v-model="queryParams.codeCard"
          placeholder="请输入机构代码/身份证"
          :maxlength="18"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="名称/姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入用户名称/姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系方式" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入用户联系方式"
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
    <el-table
      v-loading="loading"
      :data="list.slice((pageNum-1)*pageSize,pageNum*pageSize)"
      style="width: 100%;"
    >
      <el-table-column label="序号" type="index" align="center">
        <template slot-scope="scope">
          <span>{{(pageNum - 1) * pageSize + scope.$index + 1}}</span>
        </template>
      </el-table-column>
      <el-table-column label="机构代码/身份证" align="center" prop="codeCard" :show-overflow-tooltip="true" />
      <el-table-column label="名称/姓名" align="center" prop="name" :show-overflow-tooltip="true" />
      <el-table-column label="联系方式" align="center" prop="phone" />
      <el-table-column label="入会是否审核通过" align="center" prop="resultType">
        <template scope="scope">
          <p v-if="scope.row.resultType=='1'">
            已审核
          </p>
          <p v-if="scope.row.resultType=='2'">
            <el-button
              size="mini"
              type="danger"
              icon="el-icon-edit"
              @click="handleExamine(scope.row)"
              v-hasPermi="['monitor:online:forceLogout']"
            >审核</el-button>
          </p>
          <p v-if="scope.row.resultType==''">
            <el-button
              size="mini"
              type="danger"
              icon="el-icon-edit"
              @click="handleExamine(scope.row)"
              v-hasPermi="['monitor:online:forceLogout']"
            >审核</el-button>
          </p>
        </template>
      </el-table-column>
      <el-table-column label="会员是否正常" align="center" prop="resultType">
        <template scope="scope">
          <p v-if="scope.row.isNoCancellation=='1'">
            正常
          </p>
          <p v-if="scope.row.isNoCancellation=='2'">
            注销
          </p>
          <p v-if="scope.row.isNoCancellation=='0'">
            审核中
          </p>
        </template>
      </el-table-column>
      <el-table-column label="入会人属性" align="center" prop="registerType" >
        <template scope="scope">
          <p v-if="scope.row.registerType=='1'">
            备案机构
          </p>
          <p v-if="scope.row.registerType=='2'">
            管理人
          </p>
          <p v-if="scope.row.registerType=='3'">
            发行人
          </p>
          <p v-if="scope.row.registerType=='4'">
            担保人
          </p>
          <p v-if="scope.row.registerType=='5'">
            投资人
          </p>
          <p v-if="scope.row.registerType=='6'">
            个人
          </p>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="memberCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.memberCreateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleInfo(scope.row)"
            v-hasPermi="['register:user:info']"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-circle-check"
            @click="handleExamineInfo(scope.row)"
            v-hasPermi="['register:user:examine']"
          >查看审核流程</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="pageNum" :limit.sync="pageSize" />

    <!--审核流程-->
    <el-dialog :title="title" :visible.sync="open" width="60rem" append-to-body>
      <!--<div style="width: 85%;margin-left: 10%;margin-bottom: 3%;">
        <h4>审核进度：</h4>
        <el-progress :text-inside="true" :stroke-width="26" :percentage="percentage"></el-progress>
      </div>-->
      <div class="block">
        <el-timeline>
          <el-timeline-item
            v-for="(item, index) in examinelist"
            :key="index"
            :timestamp="formatDate1(item.createTime)"
            placement="top">
            <el-card>
              <h4>入会审核流程： </h4>
              <h4 v-if="item.resultType=='0'">

                审核结果：审核已提交

                <span v-if="examinelist.length == '1'">
                      <el-button
                        plain
                        type="danger"
                        size="small"
                        @click="sendMessage(item)"
                        v-hasPermi="['membership:user:notice']">
                        催办
                      </el-button>
                    </span>

              </h4>
              <h4 v-if="item.resultType=='1'">
                审核结果：<span>审核通过</span>
              </h4>
              <h4 v-if="item.resultType=='2'">
                审核结果： <span>审核不通过（{{item.resultContent}}）</span>
              </h4>
              <h4>入会申请人：{{item.name}} </h4>
              <h4>审核人：{{item.nick_name}} </h4>
            </el-card>
          </el-timeline-item>
        </el-timeline>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!--详情-->
    <el-dialog :title="info.title" :visible.sync="info.open" width="40rem" append-to-body>
      <el-row :gutter="15">
        <el-form ref="elForm"  size="medium" label-width="100px">
          <el-col :span="17">
            <el-form-item label="机构/身份证" prop="cardno">
              <el-input v-model="info.cardno" placeholder="机构/身份证" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="名称/姓名" prop="name">
              <el-input v-model="info.name" placeholder="名称/姓名" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="联系方式" prop="phone">
              <el-input v-model="info.phone" placeholder="联系方式" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="用户属性" prop="openid">
              <el-input v-model="info.openid" placeholder="用户属性" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="小程序属性" prop="appid">
              <el-input v-model="info.appid" placeholder="小程序属性" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
        </el-form>
      </el-row>
      <div slot="footer" class="dialog-footer">
        <el-button @click="info.open = false">取 消</el-button>
      </div>
    </el-dialog>

    <!--审核-->
    <el-dialog :title="examine.title" :visible.sync="examine.open" width="40rem" append-to-body>
      <el-row :gutter="15">
        <el-form ref="elForm"  size="medium" label-width="100px">
          <el-col :span="17">
            <el-form-item label="机构/身份证" prop="cardno">
              <el-input v-model="examine.cardno" placeholder="机构/身份证" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="名称/姓名" prop="name">
              <el-input v-model="examine.name" placeholder="名称/姓名" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="联系方式" prop="phone">
              <el-input v-model="examine.phone" placeholder="联系方式" readonly :disabled='true' clearable
                        :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="申请文件" prop="phone">
              <el-button
                plain
                type="primary"
                size="small"
                @click="handleEdit()"
                v-hasPermi="['examine:user:word']">
                申请文件.word
              </el-button>
            </el-form-item>
          </el-col>
          <el-col :span="17">
            <el-form-item label="审核结果" prop="resultContent">
              <el-input  v-model="examine.resultContent" type="textarea" placeholder="请输入审核结果" :maxlength="100"
                         :autosize="{minRows: 5, maxRows: 5}" :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-col>
        </el-form>
      </el-row>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleExaminePass(examine.rows)">审核通过</el-button>
        <el-button type="primary" @click="handleExamineNo(examine.rows)">审核不通过</el-button>
        <el-button @click="examine.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {sendMessage,saveExamine,listExamine} from "@/api/register/user";
import {list} from "@/api/membership/member";

import { formatDate } from '@/utils/index'
import { parseTime } from '@/utils/ruoyi'
export default {
  name: "Online",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 表格数据
      list: [],
      examinelist: [],
      pageNum: 1,
      pageSize: 10,
      // 查询参数
      queryParams: {
        phone: "",
        name: "",
        codeCard:"",
        id:"",
        type:""
      },
      // 弹出层标题
      title: "",
      info: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        cardno:"",
        phone:""
      },
      examine: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        resultContent:""
      },
      examineParams: {
        codeId: "",
        type: "",
        resultType:"",
        resultContent:"",
        openid:"",
        appid:""
      },
      // 是否显示弹出层
      open: false,
      percentage: 20,
    };
  },
  created() {
    this.getList();
  },
  filters:{
    formatDate (time){
      return parseTime(formatDate(time)) //年-月-日 时分
    }
  },
  methods: {
    formatDate1(cellValue) {
      if (cellValue == null || cellValue == "") return "";
      var date = new Date(cellValue)
      var year = date.getFullYear()
      var month = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1
      var day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()
      var hours = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
      var minutes = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
      var seconds = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds()
      return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds
    },
    /** 查询登录日志列表 */
    getList() {
      this.loading = true;
      list(this.queryParams).then(response => {
        this.list = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 强退按钮操作 */
    handleForceLogout(row) {
      this.$confirm('是否确认强退名称为"' + row.userName + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(function() {
        return forceLogout(row.tokenId);
      }).then(() => {
        this.getList();
        this.msgSuccess("强退成功");
      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.resetForm("form");
    },
    //入会人员详情
    handleInfo(row){
      this.info.title = "入会人员详情：";
      this.info.open = true;
      this.info.cardno = row.codeCard;
      this.info.name = row.name;
      this.info.phone = row.phone;
      this.info.openid = row.openid;
      this.info.appid = row.appid;
      this.canScroll()
    },
    //审核详细流程
    handleExamineInfo(row){
      this.title = "审核详细流程：";
      this.open = true;
      this.loading = true;
      this.queryParams.id=row.id;
      this.queryParams.type="2"
      listExamine(this.queryParams).then(response => {
        this.examinelist = response.rows;
        console.log(this.examinelist)
        this.loading = false;
      });
      this.canScroll()
    },
    //审核详情
    handleExamine(row){
      this.examine.title = "入会人员详情：";
      this.examine.open = true;
      this.examine.cardno = row.codeCard;
      this.examine.name = row.name;
      this.examine.phone = row.phone;
      this.examine.rows = row;
      this.canScroll()
    },
    //审核通过
    handleExaminePass(row){
      this.examineParams.appid = row.appid;
      this.examineParams.codeId = row.id;
      this.examineParams.openid = row.openid;
      this.examineParams.resultContent = this.examine.resultContent;
      this.examineParams.type = "2";
      this.examineParams.resultType = "1";
      this.$confirm('此操作入会审核, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        saveExamine(this.examineParams).then(response => {
          this.$notify({
            title: 'success',
            message: '入会审核通过',
            type: 'success'
          });
          this.loading = false;
          this.examine.open = false;
          //window.location.reload();
        });
      }).catch(() => {
        // this.$notify({
        //   title: 'info',
        //   message: '注册审核成功',
        //   type: 'success'
        // });
      });
    },
    //审核通过
    handleExamineNo(row){
      this.examineParams.appid = row.appid;
      this.examineParams.codeId = row.id;
      this.examineParams.openid = row.openid;
      this.examineParams.resultContent = this.examine.resultContent;
      this.examineParams.type = "2";
      this.examineParams.resultType = "2";
      this.$confirm('此操作入会审核, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        saveExamine(this.examineParams).then(response => {
          this.$notify({
            title: 'success',
            message: '入会审核不通过',
            type: 'success'
          });
          this.loading = false;
          this.examine.open = false;
          //window.location.reload();
        });
      }).catch(() => {
        // this.$notify({
        //   title: 'info',
        //   message: '注册审核成功',
        //   type: 'success'
        // });
      });
    },
    handleEdit() {
      ///Users/personal/Desktop/?id=E尽调.docx
      window.open(
        "https://view.officeapps.live.com/op/view.aspx?src=" + this.yuming + "/anli?id=" + row.id,
        "_blank"      );
      return false;
      /*if (!/\.(pdf|PDF)$/.test(row.wjYsmc)) {
        // 不是pdf格式
        window.open(
          "https://view.officeapps.live.com/op/view.aspx?src=" + this.yuming + "/zhengCe?id=" + row.id,
          "_blank"
        );
        return false;
      } else {
        // pdf 格式
        let url = this.yuming + "/anli?id=" + row.id
        this.viewVisible = true
        this.pdfsrc = url
      }*/
    },
    //提醒审核消息
    sendMessage(item) {
      console.log(item)
      sendMessage(this.queryParams).then(response => {
        this.$notify({
          title: '提醒审核',
          message: '提醒入会审核成功',
          type: 'success'
        });
        this.loading = false;
      });
    },
  }
};
</script>

