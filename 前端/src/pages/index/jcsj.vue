<template>
    <div>
      <div>
      <el-table  :data="list"  border  stripe  header-cell-class-name="table-header"> 
     <el-table-column prop="time" label="日期" align="center"></el-table-column>
    <el-table-column prop="xhao" label="巡查员编号" align="center"></el-table-column>
    <el-table-column prop="xname" label="巡查员姓名" align="center"></el-table-column>  
    <el-table-column prop="iri" label="IRI测量值" align="center"></el-table-column>
    <el-table-column prop="bz" label="备注" align="center"></el-table-column>
    </el-table>
      </div>


  <div>
    <el-table :data="list"  border  stripe  header-cell-class-name="table-header">
            <el-table-column prop="mian" label="检查面积" align="center"></el-table-column>
            <el-table-column prop="class" label="损坏类型" align="center"></el-table-column>
            <el-table-column prop="xmian" label="损坏面积" align="center"></el-table-column>
            <el-table-column prop="xmi" label="损坏密度" align="center"></el-table-column>
            <el-table-column prop="fen" label="单项扣分值" align="center"></el-table-column>
    </el-table>
  </div>

    </div>
</template>

<script>
  export default{
      data(){
          return{
            list:[],
          }
      },
     methods:{
       getList(){
           this.axios({
                path:"/user/seleJcsj"
            }).then(res=>{
                // res.forEach(t=>t.time=new Date(t.time).toLocaleString())
                this.list=res;
            })
       },
     },
     created(){
         
         this.getList();

      
     }
  }
</script>

<style>
.el-table th>.cell{
    color: grey;
  font-weight:bold;
}
</style>