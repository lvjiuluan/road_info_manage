<template>
    <div>
        <div class="index-chart">
            <div id="tjtu"  :style="{width: '100%', height: '400px'}"></div>
        </div>
       <div>
           
           <home></home>
       </div>
       <div>
           
           <bing></bing>
       </div>
    </div>
</template>

<script>
import home from '@/pages/index/dltj';
import bing from '@/pages/index/bing';
import echarts from 'echarts';
export default {
    components:{
          home,bing
    },
    data(){
        return{

        }
    },
    methods:{
        async listEvent(){
            return this.axios({
                path:"/user/tj"
            }).then(res=>{
                return res
            })
        },
        async drawLine(){
            // 基于准备好的dom，初始化echarts实例
            let tjtu = echarts.init(document.getElementById('tjtu'));
            let arr=await this.listEvent();
             console.log(arr)
            // console.log(arr)
            // 绘制图表
            let option =  {
                    color: ['#ec9bad'],
                    title: {
                        text: '工单统计',
                        left: 'center',
                        top: 10,
                        textStyle: {
                            color: '#ec9bad',
                            fontSize:"26"
                        }
                    },
                    tooltip: {
                        trigger: 'item',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: arr.map(t=>t.name),
                            axisTick: {
                                // alignWithLabel: true,
                                show:false
                            },
                            axisLine: {  //这是x轴文字颜色
                                lineStyle: {
                                    color: "#999",
                                }
                            }
                                                    
                        },
                         
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '',
                            type: 'bar',
                            barWidth: '40%',
                            data: arr.map(t=>t.count),
                            label:{
                                show:true
                            }
                        }
                        
                    ]
                };
            tjtu.setOption(option);
        }
    },
    mounted(){this.drawLine()}
}
</script>
<style lang="scss" scoped>
    .index-text .indexs{
        background:#ec9bad;
        color: #fff;
        font-size: 25px;
        padding: 20px;
        margin-top: 20px;
        text-align: center;
        border-radius: 10px;
        letter-spacing: 10px;
    }
    .index-text span{
        color: cornflowerblue;
        font-weight: bold;
    }
    #tjtu{
        width: 800px;
        height: 500px;
    }
    .index-chart{
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>