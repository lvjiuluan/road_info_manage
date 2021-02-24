<template>
    <div>
        <div class="index-top">
            <img src="@/assets/imgs/logo.png" alt="">
            <div class="index-title">
                <div style="color:	#000000">公路养护管理信息系统</div>
                <div style="color:	#000000">峡谷四金刚</div>
            </div>
            <transition name="el-fade-in-linear">
                <div class="index-user">
                    <div>您好！{{user.name}} 第今天是：{{time}}</div>
                    <div class="index-tui">
                        <!-- <div>{{user.name}}</div> -->
                        <img src="@/assets/imgs/tui.png" alt="">
                        <div @click="tcEvent">退出</div>
                    </div>
                </div>
            </transition>
        </div>
        <div class="index-item-box">
            <div  class="index-item" :class="index===0?'index-active':''" @click="indexEvent(0,'/')">
                <img src="@/assets/imgs/1.png" alt="">
                首页
            </div>

            <!-- <a href="https://www.amap.com">
                <div  class="index-item">
                    <img src="@/assets/imgs/2.png" alt="">
                    地图
                </div>
            </a> -->

            <div  class="index-item" :class="index===1?'index-active':''" @click="indexEvent(1,'/map')">
                <img src="@/assets/imgs/2.png" alt="">
                地图
            </div>



            <div  class="index-item" :class="index===2?'index-active':''" @click="indexEvent(2,'/list')">
                <img src="@/assets/imgs/3.png" alt="">
                数据中心
            </div>
            <div  class="index-item" :class="index===3?'index-active':''" @click="indexEvent(3,'/assess')">
                <img src="@/assets/imgs/4.png" alt="">
                评估中心
            </div>
            <div  class="index-item" :class="index===4?'index-active':''" @click="indexEvent(4,'/tj')">
                <img src="@/assets/imgs/5.png" alt="">
                数据统计
            </div>
            <!-- <div  class="index-item" :class="index===5?'index-active':''" @click="indexEvent(5,'/xjjh')">
                <img src="@/assets/imgs/jihua.png" alt="">
                巡检计划
            </div> -->
        </div>

        <div class="index-router-box">
            <div class="index-router-left">
                <div @click="leftEvent(0,'/admin')" :class="rightIndex===0?'right-active':''">设施损害通知单</div>
                <div @click="leftEvent(1,'/ren')" :class="rightIndex===1?'right-active':''">巡查员信息</div>
                <div @click="leftEvent(2,'/xren')" :class="rightIndex===2?'right-active':''">技术员信息</div>
                <div @click="leftEvent(3,'/ri')" :class="rightIndex===3?'right-active':''">日常巡查</div>
                <div @click="leftEvent(4,'/dq')" :class="rightIndex===4?'right-active':''">路面平整度检测</div>
                <div @click="leftEvent(5,'/lm')" :class="rightIndex===5?'right-active':''">路面损害情况记录</div>
                <div @click="leftEvent(6,'/zpg')" :class="rightIndex===6?'right-active':''">路面损坏调查单</div>
            </div>
            <div class="index-router-right">
                <el-collapse-transition>
                    <router-view></router-view>
                </el-collapse-transition>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            index:0,
            rightIndex:0,
            user:{},
            time:new Date().toLocaleString()
        }
    },
    methods:{
        indexEvent(i,path){
            this.index=i;
            this.$router.push(path)
        },
        leftEvent(i,path){
            this.rightIndex=i;
            this.$router.push(path)
        },
        tcEvent(){
            window.sessionStorage.removeItem('user');
            this.$router.push('/login');
        }
    },
    created(){
        this.user=JSON.parse(window.sessionStorage.getItem("user"))
    }
}
</script>
<style lang="scss" scoped>
    // .index-top{
    //     background:url("../../assets/imgs/beijing.png");
    //     display: flex;
    //     align-items: center;
    //     height: 100px;
    //     width: 100%;
    //     background: linear-gradient(to right, #3c8faf, #2ab08d);
    //     padding: 0 10px; 
    //     position: relative;
    //     >img{
    //         width: 70px;
    //         height: 70px;
    //         margin-right: 10px;
    //     }
    //     .index-title{
    //         div:nth-child(1){
    //             font-size: 26px;
    //             font-weight: bold;
    //             color: #fff;
    //         }
    //         div:nth-child(2){
    //             font-size: 12px;
    //             color: #fff;
    //             margin-top: 10px;
    //         }
    //     }
    //     .index-user{
    //         position: absolute;
    //         top: 0;
    //         right: 0;
    //         width: 700px;
    //         display: flex;
    //         align-items: center;
    //         justify-content: space-between;
    //         padding: 10px 10px 10px 40px;
    //         background: #acdbd7;
    //         border-bottom-left-radius: 10px;
    //         div{
    //             color: #fff;
    //         }
    //         .index-tui{
    //             display: flex;
    //             align-items: center;
    //             div:nth-child(1){
    //                 margin-right: 10px;
    //             }
    //             div{
    //                 color: #539ccc;
    //             }
    //         }
    //     }
    // }
    .index-item-box{
        display: flex;
        align-items: center;
        background: linear-gradient(to bottom, #cbcbcb, #f1f1f1);
        img{
            width: 20px;
            height: 20px;
            margin-right: 5px;
        }
        .index-item{
            display: flex;
            align-items: center;
            padding: 20px;
        }
        .index-active{
            background: #e7e7e7;
        }
    }
    @keyframes right-active{
        0%{
            transform: scale(1);
            margin: 0;
        }
        50%{
            margin: 20px 0;
        }
        100%{
            transform: scaleY(1.2);
            margin: 20px 0;
        }
    }
    .index-router-box{
        display: flex;
        margin-top: 10px;
        min-height: 800px;
        .index-router-left{
            div{
                // padding: 25px 35px;
                width: 130px;
                line-height: 70px;
                background: #f0f;
                text-align: center;
                color: #fff;
            }
            div:nth-child(2){
                background: #3071a9;
            }
            div:nth-child(3){
                background: #bbbbbb;
            }
            div:nth-child(4){
                background: #ddd;
            }
            div:nth-child(5){
                background: rgb(28, 209, 59);
            }
            div:nth-child(6){
                background: rgb(21, 193, 206);
            }
            div:nth-child(7){
                background: rgb(203, 68, 230);
            }
        }
        .index-router-right{
            padding: 10px 20px;
            flex-grow: 1;
        }
        .right-active{
            animation: right-active .5s;
            animation-fill-mode: forwards;
            font-weight: bold;
            box-shadow: 0px 0px 5px 0px #666;
        }
    }




  .index-top{
        background:url("../../assets/imgs/beijing.png")  no-repeat;
         background-position:center;
        display: flex;
        align-items: center;
        height: 100px;
        width: 100%;
        
        padding: 0 10px; 
        position: relative;
        >img{
            width: 70px;
            height: 70px;
            margin-right: 10px;
        }
        .index-title{
            div:nth-child(1){
                font-size: 26px;
                font-weight: bold;
                color: #fff;
            }
            div:nth-child(2){
                font-size: 12px;
                color: #fff;
                margin-top: 10px;
            }
        }
        .index-user{
            position: absolute;
            top: 0;
            right: 0;
            width: 459px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 10px 10px 40px;
            background: #acdbd7;
            border-bottom-left-radius: 10px;
            div{
                color: #fff;
            }
            .index-tui{
                width: 70px;
                display: flex;
                align-items: center;
                div:nth-child(1){
                    margin-right: 10px;
                }
                div{
                    color: #539ccc;
                }
            }
        }
    }
</style>