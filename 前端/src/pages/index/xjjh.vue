<template>
  <div class>
    <el-breadcrumb>
      <el-breadcrumb-item >巡检计划</el-breadcrumb-item>
      <el-breadcrumb-item>人员排班</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 列表 -->
    <el-card class="box-card">
      <div class="search">
        <el-button type="info" @click="lastweek">上一周</el-button>
        <el-button  type="primary" @click="dialogVisible = true" class="addbtn">新增排班</el-button>
        <el-button type="info" @click="nextweek">下一周</el-button>
        
        <div>
          <span>{{nextMonday}}</span>
          <span>星期一</span>
          <span>~</span>
          <span>{{lastsunday}}</span>
          <span>星期天</span>
        </div>
      </div>
      <!-- 信息 <template slot-scope="scope">{{scope.row.nurse.nurseName}}</template>-->
      <el-table :data="tableData" stripe border @selection-change="handleSelectionChange">
<el-table-column 
show-overflow-tooltip
 label="员工" 
 prop="nurseName" 
 align="center">
          
        </el-table-column>
<el-table-column 
show-overflow-tooltip
 label="负责路段" 
 prop="dname" 
 align="center">
          
        </el-table-column>
        
<el-table-column
          show-overflow-tooltip
          :label="monday1"
          prop="mondayStatus"
          align="center"
          
        ></el-table-column>
        <el-table-column
          show-overflow-tooltip
          :label="thursday1"
          prop="thursdayStatus"
          align="center"
         
        ></el-table-column>
        <el-table-column
          show-overflow-tooltip
          :label="wednesday1"
          prop="wednesdayStatus"
          align="center"
         
        ></el-table-column>
        <el-table-column
          show-overflow-tooltip
          :label="thuesday1"
          prop="thuesdayStatus"
          align="center"
         
        ></el-table-column>
        <el-table-column
          show-overflow-tooltip
          :label="friday1"
          prop="fridayStatus"
          align="center"
       
        ></el-table-column>
        <el-table-column
          show-overflow-tooltip
          :label="saturday1"
          prop="saturdayStatus"
          align="center"
         
        ></el-table-column>
        <el-table-column
          show-overflow-tooltip
          :label="sunday1"
          prop="sundayStatus"
          align="center"
        ></el-table-column>
        <el-table-column show-overflow-tooltip label="操作" align="center">
          <template slot-scope="scope">
            <el-button type="text" size="small" @click="showEditDialog(scope.row)">修改</el-button>
            <el-button type="text" size="small" @click="removeUserById(scope.row.id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页功能 -->
      <el-pagination
        background
        layout="total, prev, pager, next,jumper"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pagenum"
        :page-size="queryInfo.pagesize"
        :total="total"
      ></el-pagination>
    </el-card>
    <!-- 添加信息 -->
    <el-dialog :title="title" :visible.sync="dialogVisible" width="55%" @close="dialogClosed">
      <el-form label-width="120px" :model="form" :rules="formRules" ref="formRef">
        <el-form-item label="排班起始日期" prop="schedulingDay">
          <el-date-picker
            v-model="this.dateFormat2"
            value-format="yyyy-MM-dd 00:00:00"
            type="date"
            editable
            disabled
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="排班结束日期">
          <el-date-picker
            v-model="this.dateFormat8"
            value-format="yyyy-MM-dd 00:00:00"
            type="date"
            editable
            disabled
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="员工" prop="nurseName">
          <el-select v-model="form.nurseName" placeholder="员工">
            <el-option v-for="item in workers" :key="item.xname" :label="item.xname" :value="item.xname"></el-option>
          </el-select>
        </el-form-item>
         <el-form-item label="负责路段" prop="dname">
          <el-select v-model="form.dname" placeholder="负责路段">
            <el-option v-for="item in listDname" :key="item.name" :label="item.name" :value="item.name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期一" prop="mondayStatus">
           <el-select v-model="form.mondayStatus" placeholder="星期一工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期二" prop="thursdayStatus">
          <el-select v-model="form.thursdayStatus" placeholder="星期二工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期三" prop="wednesdayStatus">
           <el-select v-model="form.wednesdayStatus" placeholder="星期三工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期四" prop="thuesdayStatus">
           <el-select v-model="form.thuesdayStatus" placeholder="星期四工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期五" prop="fridayStatus">
          <el-select v-model="form.fridayStatus" placeholder="星期五工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期六" prop="saturdayStatus">
           <el-select v-model="form.saturdayStatus" placeholder="星期六工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="星期日" prop="sundayStatus">
           <el-select v-model="form.sundayStatus" placeholder="星期日工作安排">
            <el-option v-for="item in listPname" :key="item.pbzt_name" :label="item.pbzt_name" :value="item.pbzt_name"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
      </span>
    </el-dialog>
    <!-- end -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      base: "",
      monday: "",
      today: "",
      dateFormat2: "",
      dateFormat8: "",
      nextMonday: "",
      lastsunday: "",
      queryInfo: {
        query: "",
        pagenum: 1,
        pagesize: 10
      },
      role: false,
      homes: [],
      workers: [],
      listWork:[],
      listDname:[],
      listPname:[],
      total: 0,
      id:0,
      tableData: [],
      title: "新增",
      dialogVisible: false,
      form: {
        nurseName:"",
        dname:"",
        mondayStatus:"",
        thursdayStatus:"",
        wednesdayStatus:"",
        thuesdayStatus:"",
        fridayStatus:"",
        saturdayStatus:"",
        sundayStatus:""
      },
      formRules: {
      }
    };
  },
  components: {},
  created() {},
  watch: {},
  mounted() {
    this.getDnname();
    this.getPnname();
    this.getTotal();
    this.getTableList();
    this.getworkers();
    this.getTime();
  },
  methods: {

  getTotal(){

   this.axios({
     path:"/user/seleTotal"

      }).then(res=>{
         this.total=res[0].num;
       })
  },
    getDnname(){
           this.axios({
                path:"/user/seleDname"
            }).then(res=>{
                this.listDname=res;
            }) 
        
        },
     getPnname(){
           this.axios({
                path:"/user/selePname"
            }).then(res=>{
                this.listPname=res;
            }) 
        
        },

    lastweek() {
      this.getBeforNday(this.base, 7);
      console.log(this.dateFormat2);
      this.getTableList();
    },
    nextweek() {
      this.getBeforNday(this.base, -7);
      console.log(this.dateFormat2);
      this.getTableList();
    },
    getTime() {
      var myDate = new Date();
      var year = myDate.getFullYear();
      var month = myDate.getMonth() + 1;
      var date = myDate.getDate();
      var str = myDate.getDay();
      console.log(str, 888);
      if (str == 1) {
        this.getBeforNday(myDate, 1);
      }
      if (str == 2) {
        this.getBeforNday(myDate, 2);
      }
      if (str == 3) {
        this.getBeforNday(myDate, 3);
      }
      if (str == 4) {
        this.getBeforNday(myDate, 4);
      }
      if (str == 5) {
        this.getBeforNday(myDate, 5);
      }
      if (str == 6) {
        this.getBeforNday(myDate, 6);
      }
      if (str == 0) {
        this.getBeforNday(myDate, 0);
      }
    },
    getBeforNday(date, n) {
      var todays = date.getTime();
      var today = new Date();
      this.today = today.setTime(todays);

      var yesterday_milliseconds = date.getTime() - n * 1000 * 60 * 60 * 24;
      var yesterday = new Date();

      yesterday.setTime(yesterday_milliseconds);

      var strYear = yesterday.getFullYear();
      var strDay = yesterday.getDate();
      var strMonth = yesterday.getMonth() + 1;
      var strdate = yesterday.getDay();

      if (strdate == 0) {
      }
      if (strMonth < 10) {
        strMonth = "0" + strMonth;
      }
      let datastr = strYear + "年" + strMonth + "月" + strDay + "日";
      let md = strMonth + "-" + strDay;
      this.sunday = md;
      this.lastsunday = datastr;
      this.dateFormat1 = strYear + "-" + strMonth + "-" + strDay;
      this.base = yesterday;
      this.getotherday(yesterday, -1);
      this.getotherday(yesterday, -2);
      this.getotherday(yesterday, -3);
      this.getotherday(yesterday, -4);
      this.getotherday(yesterday, -5);
      this.getotherday(yesterday, -6);
      this.getotherday(yesterday, -7);
    },
    getotherday(date, n) {
      var yesterday_milliseconds = date.getTime() - n * 1000 * 60 * 60 * 24;
      var yesterday = new Date();
      yesterday.setTime(yesterday_milliseconds);

      var strYear = yesterday.getFullYear();
      var strDay = yesterday.getDate();
      var strMonth = yesterday.getMonth() + 1;
      var strdate = yesterday.getDay();
      if (strMonth < 10) {
        strMonth = "0" + strMonth;
      }
      if (strDay < 10) {
        strDay = "0" + strDay;
      }
 if (n == -1) {
        this.monday = strMonth + "." + strDay;
        this.monday1 =
          "星期一" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.nextMonday = strYear + "年" + strMonth + "月" + strDay + "日";
        this.dateFormat2 =
          strYear + "-" + strMonth + "-" + strDay + " " + "00:00:00";
      }
      if (n == -2) {
        this.thursday = strMonth + "." + strDay;
        this.thursday1 =
          "星期二" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.dateFormat3 = strYear + "-" + strMonth + "-" + strDay;
      }
      if (n == -3) {
        this.wednesday = strMonth + "." + strDay;
        this.wednesday1 =
          "星期三" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.dateFormat4 = strYear + "-" + strMonth + "-" + strDay;
      }
      if (n == -4) {
        this.thuesday = strMonth + "." + strDay;
        this.thuesday1 =
          "星期四" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.dateFormat5 = strYear + "-" + strMonth + "-" + strDay;
      }
      if (n == -5) {
        this.friday = strMonth + "." + strDay;
        this.friday1 =
          "星期五" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.dateFormat6 = strYear + "-" + strMonth + "-" + strDay;
      }
      if (n == -6) {
        this.saturday = strMonth + "." + strDay;
        this.saturday1 =
          "星期六" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.dateFormat7 = strYear + "-" + strMonth + "-" + strDay;
      }
      if (n == -7) {
        this.sunday = strMonth + "." + strDay;
        this.sunday1 =
          "星期天" + "(" + strYear + " / " + strMonth + " / " + strDay + ")";
        this.lastsunday = strYear + "年" + strMonth + "月" + strDay + "日";
        this.dateFormat8 =
          strYear + "-" + strMonth + "-" + strDay + " " + "00:00:00";
      }
    },

    handleChange_1(data) {
      console.log(data);
    },
    handleChange_2(data) {
      console.log(data, 123);
    },
    dialogClosed() {
      this.form = {};
      this.title = "新增";
    },
    //获取workers
    async getworkers() {
      this.axios({
                path:"/user/seleWorks"
            }).then(res=>{
                this.workers=res;
            })
    },
    async getTableList() {
      this.getTotal();
     this.axios({
                path:"/user/seleXjjh"
            }).then(res=>{
                res.forEach(t=>t.schedulingDay=new Date(t.schedulingDay).toLocaleString());
                this.tableData=res;
            })
    },
    async removeUserById(id) {
      // 弹框询问用户是否删除数据
      const confirmResult = await this.$confirm(
        "此操作将永久删除该数据, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      ).catch(err => err);

      // 如果用户确认删除，则返回值为字符串 confirm
      // 如果用户取消了删除，则返回值为字符串 cancel
      // console.log(confirmResult)
      if (confirmResult !== "confirm") {
        return this.$message.info("已取消删除");
      }
       this.axios({
         path:"/user/deleXjjh",
         data:{
               id
          }
         }).then(()=>{
           this.getTableList();
           this.$message.success("成功删除！");
          })
     
    },
    //添加or修改
    showEditDialog(row) {
      this.form = row;
      this.title = "修改排班";
      this.dialogVisible = true;
      this.id=row.id;
    },
    async handleSubmit() {
      
        if (this.title === "修改排班") {
          this.axios({
                path:"/user/xjjhChange",
                data:{
                    ...this.form,
                    id:this.id
                }
            }).then(()=>{
                this.getTableList();
                this.$message.success("修改成功")
            });
        } 
        else
         {
          this.axios({
                path:"/user/insertXjjh",
                data:{
                    ...this.form
                }
            }).then(()=>{
               this.getTableList();
               this.$message.success("添加数据成功！");
            });
          
        }
        this.dialogVisible = false;
    },
    handleSelectionChange(val) {
      this.checkedList = val;
    },
    handleCurrentChange(newPage) {
      this.queryInfo.pagenum = newPage;
      this.getTableList();
    }
  }
};
</script>