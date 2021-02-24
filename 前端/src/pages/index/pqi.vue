<template>
    <div>
        <div class="index-chart">
             <div id="chartPqi" :style="{width: '100%', height: '400px'}"></div>  
        </div>  
    </div>
</template>
<script>
import echarts from 'echarts';
export default {
    data(){
        return{
         arr:[
             
         ]  
        }
    },
    methods:{

        listenEvent(){
              this.axios({
                path:"/user/selePqr"
            }).then(res=>{
                res.forEach(t=>t.rq=new Date(t.rq).toLocaleString())
                this.arr=res;
            })
        },
         drawLine(){
                    // 基于准备好的dom，初始化echarts实例
                    let chartPqi = echarts.init(document.getElementById('chartPqi'))
                    // this.listenEvent(); 
                    // 绘制图表
                    chartPqi.setOption({
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
                            data: ['PQI'],
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
                            data:this.arr.map(t=>t.rq)
                        },
                        yAxis:[
                            {
                                name:'PQI',
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
                        ],
                        series: [
                            {
                                name: 'PQI',
                                type: 'line',
                                yAxisIndex: 0,
                                //smooth: true,
                                // data: [5,520,700]
                                data:this.arr.map(t=>t.pqi)
                            },
                        ]
                    });
                },
    },
     beforeMount(){
                
            },
    mounted(){
            this.axios({
                path:"/user/selePqr"
            }).then(res=>{
                res.forEach(t=>t.rq=new Date(t.rq).toLocaleString())
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
</style>