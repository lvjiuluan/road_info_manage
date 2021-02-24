<template>
    <div>
       <div class="tabs-box">
            <div v-for="(t,i) in list" :key="i" @click="tabsEvent(i)">
                <img :src="index===i?t.url:t.urlNo" alt="tabs">
                {{t.name}}
            </div>
       </div>
    </div>
</template>
<script>
export default {
    name:"tabs",
    props:{
        //默认显示第几个
        index:{
            type:Number,
            default:0
        }
    },
    data(){
        return{
            list: [
                {
                    name: "主页",
                    url: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/tab1.png",
                    urlNo: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/notab1.png"
                },
                {
                    name: "学生",
                    url: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/tab2.png",
                    urlNo: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/notab2.png"
                },
                {
                    name:"留言",
                    url: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/tab3.png",
                    urlNo: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/notab3.png"
                },
                {
                    name: "我的",
                    url: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/tab4.png",
                    urlNo: "https://lovers-1300783623.cos.ap-shanghai.myqcloud.com/web/tab/notab4.png"
                }
            ],
        }
    },
    methods:{
        tabsEvent(index){
            //传达修改tab
            this.$emit("tabs",{index});
        }
    }
}
</script>
<style lang="scss" scoped>

    .tabs-box{
        display: flex;
        justify-content: space-between;
        align-items: center;
        text-align: center;
        padding: 5px 0;
        border-top: 1px solid $border;
        position: fixed;
        bottom: 0;
        width: 100%;
        z-index: 999;
        div{
            flex-grow: 1;
            font-size: 12px;
            color: #666;
        }
        img{
            width: 25px;
            height: 25px;
            margin: 0 auto;
            margin-bottom: 3px;
        }
    }
</style>