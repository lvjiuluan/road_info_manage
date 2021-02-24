<template>
    <div>
        <div class="index-chart">
             <div id="myChart" :style="{width: '100%', height: '400px'}"></div>  
              <xjjh></xjjh>
        </div> 
        <div :style="{width:'100%'}" >
      <!-- <bing></bing> -->
     
      </div> 
    </div>
</template>
<script>
import echarts from 'echarts';
import bing from '@/pages/index/bing';
import xjjh from '@/pages/index/xjjh';
export default {
   
   
    components:{
        bing,xjjh
    },
   
   data(){
        return{
         arr:[
             
         ]  
        }
    },
    methods:{

        listenEvent(){
              this.axios({
                path:"/user/getPci"
            }).then(res=>{
                this.arr=res;
            })
        },
         drawLine(){
                    // 基于准备好的dom，初始化echarts实例
                    let myChart = echarts.init(document.getElementById('myChart'))
                    // this.listenEvent(); 
                    // 绘制图表
                    myChart.setOption({
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'cross',
                                label: {
                                    backgroundColor: '#00BDBE'
                                }
                            }
                        },
                        legend: {
                            data: ['PCI', 'RQI/IRI'],
                        },
                        grid: {
                            top: 40,
                            bottom: 20,
                            right: 35
                        },
                        color:['#00BDBE','#2B97FB', '#FF9500', '#FFCC00', '#FF3B30'],
                        xAxis: {
                            axisLine: {
                                lineStyle: {
                                    color: '#E8E8E8'
                                },
                            },
                            axisLabel: {
                                color: '#494949'
                            },
                            // 坐标轴刻度
                            axisTick: {
                                show: false,
                            },
                            // data: ['快速路', '主/次干路', '支路']
                            data:this.arr.map(t=>t.name)
                        },
                        yAxis:[
                            {
                                name:'PCI',
                                type: 'value',
                                nameTextStyle:{
                                    color:'#00BDBE'
                                },
                                axisLine: {
                                    show: true,
                                    lineStyle: {
                                        color: '#E8E8E8'
                                    }
                                },
                                axisLabel: {
                                    color: '#494949'
                                },
                                // x轴对应的竖线
                                splitLine: {
                                    show: true,
                                    lineStyle: {
                                        color: '#E8E8E8'
                                    }
                                },
                                // 坐标轴刻度
                                axisTick: {
                                    show: false,
                                },
                            },
                            {
                                name: 'RQI/IRI',
                                nameLocation: 'start',
                                nameTextStyle:{
                                    color:'#2B97FB'
                                },
                                type: 'value',
                                inverse: true, //是否反向
                                axisLine: {
                                    show: true,
                                    lineStyle: {
                                        color: '#E8E8E8'
                                    }
                                },
                                axisLabel: {
                                    color: '#494949'
                                },
                                // x轴对应的竖线
                                splitLine: {
                                    show: true,
                                    lineStyle: {
                                        color: '#E8E8E8'
                                    }
                                },
                                // 坐标轴刻度
                                axisTick: {
                                    show: false,
                                },
                                min:1,
                            }
                        ],
                        series: [
                            {
                                name: 'PCI',
                                type: 'line',
                                yAxisIndex: 0,
                                //smooth: true,
                                // data: [5,520,700]
                                data:this.arr.map(t=>t.pci)
                            },
                            {
                                name: 'RQI/IRI',
                                type: 'line',
                                yAxisIndex: 1,
                                //smooth: true,
                                // data: [100,80,5]
                                data:this.arr.map(t=>t.rqi_iri)
                            },
                        ]
                    });
                },
    },
     beforeMount(){
                
            },
    mounted(){
            this.axios({
                path:"/user/getPci"
            }).then(res=>{
                this.arr=res;
                this.drawLine();
            })
               
            },
            watch:{
                'message'(){
                    
                }
            },
}
</script>


<style lang="scss" scoped>
.home-img{
    width: 1000px;
    height: 500px;
    margin: 50px auto;
    object-fit: cover;
    display: block;
}
.index-chart{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .secondDiv{
        background:url("../../assets/imgs/index.png")  no-repeat;
    }
</style>