<template>
    <div class="list-box">
        <div class="list-add">
            路面损害情况
            <el-button type="success" @click="addEvent">添加路面损坏记录单</el-button>
        </div>
        <el-table
            :data="list"
            border
            class="table"
            ref="multipleTable"
            stripe
            header-cell-class-name="table-header"
            header-row-class-name="list-top"
        >
            <!-- <el-table-column  width="100" align="center"></el-table-column> -->
            <el-table-column prop="hao" label="路面损坏情况记录单号" width="200" align="center"></el-table-column>
            <el-table-column prop="dhao" label="道路编号" align="center"></el-table-column>
            <el-table-column prop="dname" label="道路名称" align="center"></el-table-column>
            <el-table-column prop="xhao" label="巡查员编号" align="center"></el-table-column>
            <el-table-column prop="xname" label="巡查员姓名" align="center"></el-table-column>
            <el-table-column prop="chang" label="检查总长(m)" align="center"></el-table-column>
            <el-table-column prop="kuan" label="检查总宽(m)" align="center"></el-table-column>
            <el-table-column prop="class" label="损坏类型" align="center"></el-table-column>
            <el-table-column prop="xchang" label="损坏长" align="center"></el-table-column>
            <el-table-column prop="xkuan" label="损坏宽" align="center"></el-table-column>
            <el-table-column prop="xgao" label="损坏高" align="center"></el-table-column>
            <el-table-column prop="mian" label="损坏面积(m^2)" align="center"></el-table-column>
            <el-table-column label="操作" width="100" align="center">
                <template slot-scope="scope">
                    <el-button
                        type="text"
                        class="list-look"
                        @click="handleEdit(scope.$index, scope.row)"
                    >修改</el-button>
                    <el-button
                        type="text"
                        class="list-change"
                        @click="handleDelete(scope.row.id)"
                    >删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <el-dialog :title="title" :visible.sync="editVisible" width="35%" >
            <div class="values">
                <!-- <div>
                    路面损坏情况记录单号<el-input v-model="values.hao" placeholder="路面损坏情况记录单号"></el-input>
                </div> -->
                <!-- <div>
                    道路编号<el-input v-model="values.dhao" placeholder="道路编号"></el-input>
                </div> -->
                  <div>
                    道路名称 <el-select v-model="values.dname" placeholder="请选择" @change="getShlx">
                         <el-option
                         v-for="item in listDname"
                         :key="item.name"
                         :label="item.name"
                         :value="item.name">
                         </el-option>
                         </el-select>
                </div>
                <!-- <div>
                    巡查员编号<el-input v-model="values.xhao" placeholder="巡查员编号"></el-input>
                </div> -->
                  <div>
                    巡查员姓名 <el-select v-model="values.xname" placeholder="请选择">
                         <el-option
                         v-for="item in listXname"
                         :key="item.xname"
                         :label="item.xname"
                         :value="item.xname">
                         </el-option>
                         </el-select>
                </div>
                <div>
                    检查总长(m)<el-input v-model="values.chang" placeholder="检查总长"></el-input>
                </div>
                <div>
                    检查总宽(m)<el-input v-model="values.kuan" placeholder="检查总宽"></el-input>
                </div>
                 <div>
                    损坏类型 <el-select v-model="values.class" placeholder="请选择">
                         <el-option
                         v-for="item in listShlx"
                         :key="item.shlx_name"
                         :label="item.shlx_name"
                         :value="item.shlx_name">
                         </el-option>
                         </el-select>
                </div>
                <div>
                    损坏长<el-input v-model="values.xchang" placeholder="损坏长"></el-input>
                </div>
                <div>
                    损坏宽<el-input v-model="values.xkuan" placeholder="损坏宽"></el-input>
                </div>
                <div>
                    损坏高<el-input v-model="values.xgao" placeholder="损坏高"></el-input>
                </div>
            </div>
            
            <span slot="footer" class="dialog-footer">
                <el-button @click="quxiao">取 消</el-button>
                <el-button type="primary" @click="saveEdit">{{con}}</el-button>
            </span>
        </el-dialog>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[
                
            ],
            listXname:[

            ],
            listDname:[

            ],
            listShlx:[

            ],
            editVisible:false,
            title:"添加路面信息",
            values:{
                // hao:"",
                // dhao:"",
                dname:"",
                // xhao:"",
                xname:"",
                chang:"",
                kuan:"",
                class:"",
                xchang:"",
                xkuan:"",
                xgao:"",
            },
            temp:{
                // hao:"",
                // dhao:"",
                dname:"",
                // xhao:"",
                xname:"",
                chang:"",
                kuan:"",
                class:"",
                xchang:"",
                xkuan:"",
                xgao:"",
            },
            con:"确认添加",
            is:true,
            id:0
        }
    },
    methods:{
        addEvent(){
            this.chushihuaVakues();
            this.editVisible=true;
            this.is=true;
            this.title="添加路面损坏情况调查单单"
        },
         handleEdit(index,list){

            this.editVisible=true;
            this.title="修改路面损坏情况单信息"
            this.con="确认修改"
            this.is=false;
            this.values=list;
            this.id=list.id
        },
        chushihuaVakues(){
            this.values=this.temp;
             for(let key in this.values)
               this.values[key]="";
        },
         quxiao(){
             this.editVisible=false;
            this.chushihuaVakues(); 
            this.listEvent();
        },
       
        saveEdit(){
            for(let i in this.values ) if(!this.values[i])return this.$message.error("请填写完整");
            if(this.is)
            this.axios({
                path:"/user/addLm",
                data:{
                    ...this.values
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("添加成功")
            })
            .catch(err=>{this.$message.error("请输入正确的数据格式")})
           if(!this.is)
            this.axios({
                path:"/user/lmChange",
                data:{
                    ...this.values,
                    id:this.id
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("修改成功");
                this.chushihuaVakues();
            })
            .catch(err=>{this.$message.error("请输入正确的数据格式")})
        },
        listEvent(){
            this.axios({
                path:"/user/seleLm"
            }).then(res=>{
                this.list=res;
            })
        },
      getDnname(){
           this.axios({
                path:"/user/seleDname"
            }).then(res=>{
                this.listDname=res;
            }) 
        
        },
        getXname(){
           this.axios({
                path:"/user/seleXname"
            }).then(res=>{
                this.listXname=res;
            }) 
        
        },
        getShlx(){
           this.axios({
                path:"/user/seleShlx",
                data:{
                    ...this.values
                }
            }).then(res=>{
                this.listShlx=res;
            }) 
        
        },
        handleDelete(id){
            this.$confirm("确定删除此路面信息吗？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({
                    path:"/user/deleLm",
                    data:{
                        id
                    }
                }).then(()=>{
                    this.listEvent();
                    this.$message.success("成功删除！");
                })
                .catch(err=>{this.$message.error(err.message)})
            });
        }
    },
    created(){
        this.listEvent();
        this.getDnname();
        this.getXname();
        // this.getShlx();
    }
}
</script>
<style lang="scss">
    .list-add{
        display: flex;
        font-size: 18px;
        font-weight: bold;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 10px;
        span{
            color: #fff;
        }
    }
    .list-box{
        .table-header{
            background: #428bca;
            border: none;
        }
        .el-table th>.cell{
            color: #fff;
        }
        .list-look{
            background: #7bc78c;
            padding:10px;
            margin:0 0 0 0px;
            span{
                color: #fff;
            }
            
        }
        .list-change{
            padding:10px;
            margin:0 0 0 0px;
            background: #d9534f;
            span{
                color: #fff;
            }
        }
    }
    .values>div{
        margin-top: 15px;
        font-weight: bold;
    } 
</style>