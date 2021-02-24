import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);
const state={//要设置的全局访问的state对象
    userInfo:{},//用户信息
    token:""
};
const getters={//读取值(this.$store.getters.isList)
    info(state){
        return state.userInfo
    },
    getToken(state){
        return state.token
    }
};
const mutations={//同步修改值(this.$store.commit("changeList",this.list2);)
    userInfo(state,value){
        state.userInfo=value
    },
    tokenMuta(state,value){
        state.token=value
    }
}
const actions={//异步修改值(this.$store.dispatch('actionChange',this.list3))
    userInfoChange(context,value){
        context.commit("userInfo",value)
    },
    tokenChange(context,value){
        context.commit("tokenMuta",value)
    }
}
const store = new Vuex.Store({
      state,
      getters,
      mutations,
      actions
   });

export default store;

// computed:{//监听vuex变化
//     listData(){
//         return this.$store.getters.readList
//     }
// },
// watch:{
//     listData(){
//         console.log(895)
//     },
   
// }