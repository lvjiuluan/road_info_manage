<template>
    <div class="list-box">
        <div class="list-add">
            道路设施管理
            <el-button type="success" @click="addEvent">添加设施损害通知单</el-button>
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
            <el-table-column prop="hao" label="通知号" width="100" align="center"></el-table-column>
            <el-table-column prop="dhao" label="道路编号" align="center"></el-table-column>
            <el-table-column prop="dname" label="道路名称" align="center"></el-table-column>
            <el-table-column prop="xhao" label="巡查员编号" align="center"></el-table-column>
            <el-table-column prop="xname" label="巡查员名称" align="center"></el-table-column>
            <el-table-column prop="site" label="损坏位置" align="center"></el-table-column>
            <el-table-column prop="wei" label="损坏部位" align="center"></el-table-column>
            <el-table-column prop="bz" label="备注" align="center"></el-table-column>
            <el-table-column label="操作" width="200" align="center">
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
                    通知号<el-input v-model="values.hao" placeholder="通知号"></el-input>
                </div> -->
                <!-- <div>
                    道路编号<el-input v-model="values.dhao" placeholder="道路编号"></el-input>
                </div> -->
                 <div>
                    道路名称 <el-select v-model="values.dname" placeholder="请选择">
                         <el-option
                         v-for="item in listDname"
                         :key="item.name"
                         :label="item.name"
                         :value="item.name">
                         </el-option>
                         </el-select>
                </div>
                <!-- <div>
                    巡查员编号<el-input v-model="values.xhao" placeholder="巡查编号"></el-input>
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
                    损坏位置<el-input v-model="values.site" placeholder="损坏位置"></el-input>
                </div>
                <div>
                    损坏部位<el-input v-model="values.wei" placeholder="损坏部位"></el-input>
                </div>
                <div>
                    备注<el-input v-model="values.bz" placeholder="备注"></el-input>
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
            editVisible:false,
            title:"添加设备",
            values:{
                // hao:"",
                // dhao:"",
                dname:"",
                // xhao:"",
                xname:"",
                site:"",
                wei:"",
                bz:"",
            },
            temp:{
                // hao:"",
                // dhao:"",
                dname:"",
                // xhao:"",
                xname:"",
                site:"",
                wei:"",
                bz:"",
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
            this.title="添加设施损坏通知单"
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
        handleEdit(index,list){

            this.editVisible=true;
            this.title="修改信息"
            this.con="确认修改"
            this.is=false;
            this.values=list;
            this.id=list.id
        },
        saveEdit(){
            for(let i in this.values ) if(!this.values[i] && i!='bz')return this.$message.error("请填写完整内容")
            if(this.is)           
           this.axios({
                path:"/user/addAdmin",
                data:{
                    ...this.values
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("添加成功")
            });
             if(!this.is)
            this.axios({
                path:"/user/adminChange",
                data:{
                    ...this.values,
                    id:this.id
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("修改成功")
                 this.chushihuaVakues();
            });
        },
        listEvent(){
            this.axios({
                path:"/user/seleAdmin"
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
        
        handleDelete(id){
            this.$confirm("确定删除此条通知单吗？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({
                    path:"/user/deleAdmin",
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
            margin: 0 10px;
            span{
                color: #fff;
            }
            
        }
        .list-change{
            padding:10px;
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