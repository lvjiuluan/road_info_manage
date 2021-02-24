<template>
  <div >
    <div class="pie">
        <div id="pie1" class="pie1">
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="main1" style="float:left;width:100%;height: 300px"></div>
        </div>
        <div id="pie2" class="pie2">
            <div id="main2" style="float:left;width:100%;height: 300px"></div>
        </div>
        <div id="pie3" class="pie3">
            <div id="main3" style="float:left;width:100%;height: 300px"></div>
        </div>
    </div>
  </div>
</template>

<script>// 引入基本模板
let echarts = require('echarts/lib/echarts')
// 引入饼状图组件
require('echarts/lib/chart/pie')
// 引入提示框和title组件
require('echarts/lib/component/tooltip')
require('echarts/lib/component/title')


export default {
    data(){
        return{
            arr1:[

            ],
            arr2:[

            ],
            arr3:[

            ],
        }
    },
  created(){
  },
  mounted(){
      this.axios({
                path:"/user/pie1"
            }).then(res=>{
               this.arr1=res;
              
               this.axios({
                path:"/user/pie2"
            }).then(res=>{
               this.arr2=res; 
                 
                  this.axios({
                path:"/user/pie3"
            }).then(res=>{
               this.arr3=res;
               this.initData();
            })
    


            });
             

            });

           

           
  },
  methods:{
    //初始化数据
    initData() {
      // 基于准备好的dom，初始化echarts实例
      var bingChart1 = echarts.init(document.getElementById('main1'));
       var bingChart2 = echarts.init(document.getElementById('main2'));
       var bingChart3 = echarts.init(document.getElementById('main3'));
      // 绘制图表
      bingChart1.setOption({
          title : {
              text: '快速路路面等级分布',//主标题
              //subtext: '纯属虚构',//副标题
              x:'center',//x轴方向对齐方式
          },
          tooltip : {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
              orient: 'vertical',
              bottom: 'bottom',
            //   data: ['A','B','C','D']
            data:this.arr1.map(t=>t.name)
          },
          series : [
              {
                  name: '快速路',
                  type: 'pie',
                  radius : '55%',
                  center: ['50%', '60%'],
                //   data:[
                //       {value:335, name:'A'},
                //       {value:310, name:'B'},
                //       {value:234, name:'C'},
                //       {value:135, name:'D'},
                //   ],
                data:this.arr1,
                  itemStyle: {
                      emphasis: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                      }
                  }
              }
          ]
      });
      bingChart2.setOption({
          title : {
              text: '支路路路面等级分布',//主标题
              //subtext: '纯属虚构',//副标题
              x:'center',//x轴方向对齐方式
          },
          tooltip : {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
              orient: 'vertical',
              bottom: 'bottom',
              data:this.arr2.map(t=>t.name)
          },
          series : [
              {
                  name: '支路',
                  type: 'pie',
                  radius : '55%',
                  center: ['50%', '60%'],
                  data:this.arr2,
                  itemStyle: {
                      emphasis: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                      }
                  }
              }
          ]
      });
       bingChart3.setOption({
          title : {
              text: '主/次干路路面等级分布',//主标题
              //subtext: '纯属虚构',//副标题
              x:'center',//x轴方向对齐方式
          },
          tooltip : {
              trigger: 'item',
              formatter: "{a} <br/>{b} : {c} ({d}%)"
          },
          legend: {
              orient: 'vertical',
              bottom: 'bottom',
              data: this.arr3.map(t=>t.name)
          },
          series : [
              {
                  name: '主/次干路',
                  type: 'pie',
                  radius : '55%',
                  center: ['50%', '60%'],
                  data:this.arr3,
                  itemStyle: {
                      emphasis: {
                          shadowBlur: 10,
                          shadowOffsetX: 0,
                          shadowColor: 'rgba(0, 0, 0, 0.5)'
                      }
                  }
              }
          ]
      });
    },
  }
}
</script>

<style >
.pie{
    display: inline;
}
.pie1{
    float: left;
    width: 50%;
    height: 100%;
}
.pie2{
    float: left;
    width: 50%;
    height: 100%;
}
</style>