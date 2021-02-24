<template>
    <div class="list-box">
        <div class="list-add">
            道路
            <el-button type="success" @click="addEvent">添加道路</el-button>
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
            <el-table-column prop="ids" label="道路编码" width="100" align="center"></el-table-column>
            <el-table-column prop="name" label="道路名称" align="center"></el-table-column>
            <el-table-column prop="lmlx_name" label="路面类型" align="center"></el-table-column>
            <el-table-column prop="site" label="起始地址" align="center"></el-table-column>
            <el-table-column prop="bsite" label="结束地址" align="center"></el-table-column>
            <el-table-column prop="dllx_name" label="道路类型" align="center"></el-table-column>
            <el-table-column prop="sjdw" label="设计单位" align="center"></el-table-column>
            <el-table-column prop="ssxz" label="所属乡镇" align="center"></el-table-column>
            <el-table-column prop="length" label="道路总长(km)" align="center"></el-table-column>
            <el-table-column prop="speed" label="时速(km/h)" align="center" ></el-table-column>
            <el-table-column prop="yhdj" label="养护等级" align="center"></el-table-column>
            

            <el-table-column label="操作" width="200" align="center">
                <template slot-scope="scope">
                    <el-button
                        type="text"
                        class="list-Firstlook"
                        @click="pinggu(scope.$index, scope.row)"
                    >评估</el-button>
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

        <el-dialog :title="title" :visible.sync="editVisible" width="35%"  >
            <div class="values">
                <!-- <div>
                    道路编码<el-input v-model="values.ids" placeholder="请输入道路编码"></el-input>
                </div> -->
                <div>
                    道路名称<el-input v-model="values.name" placeholder="请输入道路名称"></el-input>
                </div>
                <div>
                    路面类型 <el-select v-model="values.lmlx_name" placeholder="请选择">
                         <el-option
                         v-for="item in list2"
                         :key="item.lmlx_name"
                         :label="item.lmlx_name"
                         :value="item.lmlx_name">
                         </el-option>
                         </el-select>
                </div>
                <div>
                    起始地址<el-input v-model="values.site" placeholder="请输入起始地址"></el-input>
                </div>
                <div>
                    结束地址<el-input v-model="values.bsite" placeholder="请输入结束地址"></el-input>
                </div>
                  <div>
                    道路类型 <el-select v-model="values.dllx_name" placeholder="请选择">
                         <el-option
                         v-for="item in listDllx"
                         :key="item.dllx_name"
                         :label="item.dllx_name"
                         :value="item.dllx_name">
                         </el-option>
                         </el-select>
                </div>
                <div>
                    设计单位<el-input v-model="values.sjdw" placeholder="请输入设计单位"></el-input>
                </div>
                <div>
                    所属乡镇<el-input v-model="values.ssxz" placeholder="请输入所属乡镇"></el-input>
                </div>
                <div>
                    道路总长(km)<el-input v-model="values.length" placeholder="请输入里程(km)"></el-input>
                </div>
                <div>
                    设计时速(km/h)<el-input v-model="values.speed" placeholder="请输入设计时速"></el-input>
                </div>
                 <div>
                    养护等级 <el-select v-model="values.yhdj" placeholder="请选择">
                         <el-option
                         v-for="item in listYhdj"
                         :key="item.name"
                         :label="item.name"
                         :value="item.name">
                         </el-option>
                         </el-select>
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
                
            ],
            listYhdj:[
                {
                    name:'I级'
                },
                {
                    name:'II级'
                }
            ],
            listDllx:[

            ],
            listDname:[

            ],
            editVisible:false,
            title:"添加道路",
            values:{
                name:"",
                lmlx_name:"",
                site:"",
                bsite:"",
                dllx_name:"",
                sjdw:"",
                ssxz:"",
                length:"",
                speed:"",
                yhdj:"",
            },
            temp:{
                name:"",
                lmlx_name:"",
                site:"",
                bsite:"",
                dllx_name:"",
                sjdw:"",
                ssxz:"",
                length:"",
                speed:"",
                yhdj:"",
            },
            listPanduan:[

            ],
            con:"确认添加",
            is:true,
            id:0,
            judge:false,
        }
    },
    methods:{

        addEvent(){
            this.chushihuaVakues();
            this.editVisible=true;
            this.title="添加道路"
            this.con="确认添加"
            this.is=true
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
            for(let i in this.values ) if(!this.values[i]) return this.$message.error("请填写完整内容")
            if(this.is)
            this.axios({
                path:"/user/addList",
                data:{
                    ...this.values
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("添加成功");
                this.chushihuaVakues();
            })
            .catch(err=>{this.$message.error("请输入正确的数据格式")})
            if(!this.is)
            this.axios({
                path:"/user/change",
                data:{
                    ...this.values,
                    id:this.id
                }
            }).then(()=>{
                this.editVisible=false;
                this.listEvent();
                this.$message.success("编辑成功")
                this.chushihuaVakues();
            })
            .catch(err=>{this.$message.error("请输入正确的数据格式")})
        },
        listEvent(){
            this.axios({
                path:"/user/sele"
            }).then(res=>{
                this.list=res;
            })
        },
        getLMLX(){
            this.axios({
                path:"/user/sellmlx"
            }).then(res=>{
                this.list2=res;
            })
        },
        getDllx(){
             this.axios({
                path:"/user/seldllx"
            }).then(res=>{
                this.listDllx=res;
            })
        },
        getDname(){
            this.axios({
                path:"/user/getDname"
            }).then(res=>{
                this.listDname=res;
            })
        },
        handleEdit(index,list){

            this.editVisible=true;
            this.title="修改道路"
            this.con="确认修改"
            this.is=false;
            this.values=list;
            this.id=list.id
        },
        pinggu(index,list){
        
        this.judge=false;
         for(let i in this.listDname) if(this.listDname[i].dname==list.name) this.judge=true;
         
         if(this.judge)
         this.axios({
          path:"/user/insertPg",
              data:{
                    ...list
                }
            }).then(()=>{
                this.$message.success("成功生成道路评估信息");
                this.$router.push('/assess');
            });

           else
         this.$message.error("信息不足无法生成评估信息");  
        },     

        handleDelete(id){
            this.$confirm("确定删除此道路信息？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({


                    path:"/user/dele",
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
        this.getLMLX();   
        this.getDllx();
        this.getDname();
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
          .list-Firstlook{
            background: #7bc78c;
            padding:9px;
            margin: 0 3px;
            span{
                color: #fff;
            }
            
        }
        .list-look{
            background: #7bc78c;
            padding:9px;
            margin: 0 5px;
            span{
                color: #fff;
            }
            
        }
       
        .list-change{
            padding:9px;
            margin: 0 0;
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