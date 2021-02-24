<template>
    <div>
      <div>
      <el-table  :data="list"  border  stripe  header-cell-class-name="table-header"> 
           <el-table-column prop="rq" label="评估日期" align="center"></el-table-column>
            <el-table-column prop="pqi" label="PQI" align="center"></el-table-column>
            <el-table-column prop="pqi_dj" label="等级" align="center"></el-table-column>
            <el-table-column prop="rqi_iri" label="RQI/IRI" align="center"></el-table-column>
            <el-table-column prop="rqi_dj" label="等级" align="center"></el-table-column>
            <el-table-column prop="pci" label="PCI" align="center"></el-table-column>
            <el-table-column prop="pci_dj" label="等级" align="center" ></el-table-column>
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
                path:"/user/seleLsdj"
            }).then(res=>{
                res.forEach(t=>t.rq=new Date(t.rq).toLocaleString())
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