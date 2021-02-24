<template>
    <div class="list-box">
        <div class="list-add">
            路面总体评估
            <!-- <el-button type="success" @click="addEvent">添加道路</el-button> -->
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
            <el-table-column prop="hao" label="路面总体评估单号" width="200px" align="center"></el-table-column>
            <el-table-column prop="ids" label="道路编码"  align="center"></el-table-column>
            <el-table-column prop="name" label="道路名称" align="center"></el-table-column>
            <el-table-column prop="dllx_name" label="道路类型" align="center"></el-table-column>
            <el-table-column prop="rq" label="评估日期" align="center"></el-table-column>
            <el-table-column prop="pqi" label="PQI" align="center"></el-table-column>
            <el-table-column prop="pqi_dj" label="等级" align="center"></el-table-column>
            <el-table-column prop="rqi_iri" label="RQI/IRI" align="center"></el-table-column>
            <el-table-column prop="rqi_dj" label="等级" align="center"></el-table-column>
            <el-table-column prop="pci" label="PCI" align="center"></el-table-column>
            <el-table-column prop="pci_dj" label="等级" align="center" ></el-table-column>
            <el-table-column label="操作" width="200" align="center">
                <template slot-scope="scope">
                     <el-button
                        type="text"
                        class="list-look"
                        @click="handleEdit(scope.$index, scope.row)"
                    >趋势</el-button>
                    <el-button
                        type="text"
                        class="list-change"
                        @click="handleDelete(scope.row.id)"
                    >删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    
    


    <el-dialog :title="title" :visible.sync="editVisible" width="35%">
  <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
   
   
   
    <el-tab-pane label="PQI走势" name="first">
      <pqi v-if="isFirst"/>
      </el-tab-pane>
    <el-tab-pane label="PCI走势" name="second">
      <pci v-if="isSecond"/>
      </el-tab-pane>
    <el-tab-pane label="RQI/IRI走势" name="third">
     <rqi v-if="isThird"/>
      </el-tab-pane>
      
  </el-tabs>
  </el-dialog>

    
    </div>
    
</template>


<script>
  import pqi from '@/pages/index/pqi';
   import pci from '@/pages/index/pci';
    import rqi from '@/pages/index/rqi';

export default {

    components:{
           pqi,
           pci,
           rqi
        },


    data(){
        return{

            list:[
                
            ],
            isShow:true,
            editVisible:false,
            activeName: 'first',
            isFirst:true,
            isSecond:false,
            isThird:false,
            title:""
        }
    },
    methods:{
         
       handleEdit(index,list){

       this.activeName='first';
       this.isFirst=false;
       this.isSecond=false;
       this.isThird=false;

         this.axios({
                    path:"/user/inseTemp",
                    data:{
                       value: list.name
                    }
                }).then(()=>{
                    // this.$message.success("成功添加！");
                     this.title=list.name;
                    this.editVisible=true;
                     this.isFirst=true;
                    this.isSecond=false;
                   this.isThird=false;
                })
        
       },

        handleClick(tab,event){
      if (tab.name === 'first')
       {
        this.isFirst = true
        this.isSecond = false
        this.isSecond=false
      }
       else if (tab.name === 'second')
     {
        this.isFirst = false
        this.isThird=false
        this.isSecond = true
      }
      else if(tab.name='third'){

        this.isFirst = false
        this.isThird=true
        this.isSecond = false

      }
         console.log(tab, event)
      },


        listEvent(){
            this.axios({
                path:"/user/selePg"
            }).then(res=>{
                res.forEach(t=>t.rq=new Date(t.rq).toLocaleString())
                this.list=res;
            })
        },
        handleDelete(id){
            this.$confirm("确定删除此道路信息？", '删除', {
                confirmButtonText: '确定删除',
                cancelButtonText: '取消',
                type: 'warning'
                }).then(() => {
                this.axios({
                    path:"/user/delePg",
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
     .tabs{
    position:absolute;
    left: 586px;
    top: 221px;
    z-index: 9999;
}
</style>