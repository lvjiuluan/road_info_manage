<template>
    <div class="list-box">
        <div class="list-add">
            技术员信息
            <el-button type="success" @click="addEvent">添加技术员信息</el-button>
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
            <el-table-column prop="jhao" label="技术员编号" width="200" align="center"></el-table-column>
            <el-table-column prop="jname" label="技术员姓名" align="center"></el-table-column>
            <el-table-column prop="jsex" label="技术员性别" align="center"></el-table-column>
            <el-table-column prop="jphone" label="技术员电话" align="center"></el-table-column>
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
                    技术员编号<el-input v-model="values.jhao" placeholder="技术员编号"></el-input>
                </div> -->
                <div>
                    技术员姓名<el-input v-model="values.jname" placeholder="技术员姓名"></el-input>
                </div>
                <div>
                    技术员性别 <el-select v-model="values.jsex" placeholder="请选择">
                         <el-option
                         v-for="item in list2"
                         :key="item.sex"
                         :label="item.sex"
                         :value="item.sex">
                         </el-option>
                         </el-select>
                </div>
                <div>
                    技术员电话<el-input v-model="values.jphone" placeholder="技术员电话"></el-input>
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
             list2:[
                {
                    sex:'男'
                },
                {
                    sex:'女'
                }
            ],
            editVisible:false,
            title:"添加技术员信息",
            values:{
                // jhao:"",
                jname:"",
                jsex:"",
                jphone:"",
            },
             temp:{
                // jhao:"",
                jname:"",
                jsex:"",
                jphone:"",
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
            this.title="添加技术员信息"
        },
        handleEdit(index,list){

            this.editVisible=true;
            this.title="修改技术员信息"
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
            for(let i in this.values ) if(!this.values[i])return this.$message.error("请填写完整内容")
            if(this.is)
            this.axios({
                path:"/user/addJen",
                data:{
                    ...this.values
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("添加成功")
                this.chushihuaVakues();
            });
            if(!this.is)
            this.axios({
                path:"/user/xrenChange",
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
                path:"/user/seleJem"
            }).then(res=>{
                this.list=res;
            })
        },
        handleDelete(id){
            this.$confirm("确定删除此技术员信息吗？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({
                    path:"/user/deleJen",
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