<template>
    <div class="list-box">
        <div class="list-add">
            日常检查
            <el-button type="success" @click="addEvent">添加日常检查信息</el-button>
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
            <el-table-column prop="rhao" label="日常巡查单号" width="200" align="center"></el-table-column>
            <el-table-column prop="xhao" label="巡查员编号" align="center"></el-table-column>
            <el-table-column prop="xname" label="巡查员名字" align="center"></el-table-column>
            <el-table-column prop="dhao" label="道路编号" align="center"></el-table-column>
            <el-table-column prop="dname" label="道路名称" align="center"></el-table-column>
            <el-table-column prop="time" label="日期" align="center"></el-table-column>
            <el-table-column prop="site" label="损坏位置及描述" align="center"></el-table-column>
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
                    日常巡查单号<el-input v-model="values.rhao" placeholder="日常巡查单号"></el-input>
                </div> -->
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
                <div>
                    日期
                    <el-date-picker
                        v-model="values.time"
                        type="date"
                        placeholder="选择日期">
                        </el-date-picker>
                </div>
                <div>
                    损坏位置及描述<el-input v-model="values.site" placeholder="损坏位置及描述"></el-input>
                </div>
                <div>
                    备注<el-input v-model="values.bz" placeholder="备注"></el-input>
                </div>
               
            </div>
            
            <span slot="footer" class="dialog-footer">
                <!-- <el-button @click="editVisible = false">取 消</el-button> -->
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
            title:"添加日常检查信息",
            values:{
                // rhao:"",
                // xhao:"",
                xname:"",
                // dhao:"",
                dname:"",
                time:"",
                site:"",
                bz:"",
            },
             temp:{
                // rhao:"",
                // xhao:"",
                xname:"",
                // dhao:"",
                dname:"",
                time:"",
                site:"",
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
            this.title="添加日常巡查单"
        },
        handleEdit(index,list){

            this.editVisible=true;
            this.title="修改日常巡查单信息"
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
            for(let i in this.values ) if(!this.values[i] && i!='bz')return this.$message.error("请填写日常检查内容");
            if(this.is)
           this.axios({
                path:"/user/addRi",
                data:{
                    ...this.values
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("添加成功")
                console.log(this.values[time]);
                this.chushihuaVakues();
            });
            if(!this.is)
            this.axios({
                path:"/user/riChange",
                data:{
                    ...this.values,
                    id:this.id
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("修改成功");
                this.chushihuaVakues();
            });
        },
        listEvent(){
            this.axios({
                path:"/user/seleRi"
            }).then(res=>{
                // res.forEach(t=>t.time=new Date(t.time).toLocaleString())
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
            this.$confirm("确定删除此技术员信息吗？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({
                    path:"/user/deleRi",
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