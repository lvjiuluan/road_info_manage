<template>
    <div class="list-box">
        <div class="list-add">
            路面损坏调查单
            <!-- <el-button type="success" @click="addEvent">添加路面损坏调查信息</el-button> -->
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
            <el-table-column prop="hao" label="路面损坏调查单号" width="200" align="center"></el-table-column>
             <el-table-column prop="fhao" label="来源单号"  align="center"></el-table-column>
            <el-table-column prop="dhao" label="道路编号" align="center"></el-table-column>
            <el-table-column prop="dname" label="道路名称" align="center"></el-table-column>
             <el-table-column prop="xhao" label="调查人员编号" align="center"></el-table-column>
            <el-table-column prop="xname" label="调查人员名称" align="center"></el-table-column>
            <!-- <el-table-column prop="jdao" label="路面损坏记录单号" align="center"></el-table-column> -->
            <el-table-column prop="mian" label="检查面积" align="center"></el-table-column>
            <el-table-column prop="class" label="损坏类型" align="center"></el-table-column>
            <el-table-column prop="xmian" label="损坏面积" align="center"></el-table-column>
            <el-table-column prop="xmi" label="损坏密度(%)" align="center"></el-table-column>
            <el-table-column prop="fen" label="单项扣分值" align="center"></el-table-column>
            <!-- <el-table-column label="操作" width="100" align="center">
                <template slot-scope="scope">
                    <el-button
                        type="text"
                        class="list-change"
                        @click="handleDelete(scope.row.id)"
                    >删除</el-button>
                </template>
            </el-table-column> -->
        </el-table>

        <el-dialog :title="title" :visible.sync="editVisible" width="35%" >
            <div class="values">
                <!-- <div>
                    路面损坏调查单号<el-input v-model="values.hao" placeholder="路面损坏调查单号"></el-input>
                </div> -->
                <div>
                    道路编号<el-input v-model="values.dhao" placeholder="道路编号"></el-input>
                </div>
                <div>
                    道路名称<el-input v-model="values.dname" placeholder="道路名称"></el-input>
                </div>
                <div>
                    路面损坏记录单号<el-input v-model="values.jdao" placeholder="路面损坏记录单号"></el-input>
                </div>
                <div>
                    检查面积<el-input v-model="values.mian" placeholder="检查面积"></el-input>
                </div>
                <div>
                    损坏类型<el-input v-model="values.class" placeholder="损坏类型"></el-input>
                </div>
                <div>
                    损坏面积<el-input v-model="values.xmian" placeholder="损坏面积"></el-input>
                </div>
                <div>
                    损坏密度<el-input v-model="values.xmi" placeholder="损坏密度"></el-input>
                </div>
                <div>
                    单项扣分值<el-input v-model="values.fen" placeholder="单项扣分值"></el-input>
                </div>
            </div>
            
            <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
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
            editVisible:false,
            title:"添加路面信息",
            values:{
                hao:"",
                dhao:"",
                dname:"",
                jdao:"",
                mian:"",
                class:"",
                xmian:"",
                xmi:"",
                fen:"",
            },
             temp:{
                hao:"",
                dhao:"",
                dname:"",
                jdao:"",
                mian:"",
                class:"",
                xmian:"",
                xmi:"",
                fen:"",
            },
            con:"确认添加",
            is:true,
            id:0
        }
    },
    methods:{
        addEvent(){
            this.editVisible=true;
        },
        saveEdit(){
            console.log( this.values)
            for(let i in this.values ) if(!this.values[i])return this.$message.error("请填写路面内容");
            let arr=[this.isNum(this.values.mian),this.isNum(this.values.xmian),this.isNum(this.values.xmi),this.isNum(this.values.fen)];
            //  //多重判断
            if(arr.includes(false)) return this.$message.error("长；宽；高；分请输入数字类型");
            this.axios({
                path:"/user/addZpg",
                data:{
                    ...this.values
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("添加成功")
            });
        },
        isNum(value){
            let reg = /^\d+$|^\d+[.]?\d+$/;
            return reg.test(value)
        },
        listEvent(){
            this.axios({
                path:"/user/seleZpg"
            }).then(res=>{
                this.list=res;
            })
        },
        handleDelete(id){
            this.$confirm("确定删除条信息吗？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({
                    path:"/user/deleZpg",
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