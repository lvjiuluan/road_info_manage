//1.引入vue
import Vue from 'vue'
//2.引入axios库
import axiosP from 'axios';
import router from '../router';
import store from '@/store'//引入store(vuex)
import {config} from '@/utils/config'//引入公用文件
axiosP.defaults.timeout =3000;//请求超时时间

axiosP.interceptors.request.use(//请求拦截
    config => {
        // config.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        // let token =sessionStorage.getItem('token');
        // let token=store.getters.getToken;
        // if (token) {//如果有token给请求头加上
        //     config.headers.common['token'] =token
        // }
        return config
    },

    err => {
        return Promise.reject(err);
    }

)

axiosP.interceptors.response.use(response => {//相应拦截
    // try{
    //     let {token}=response.data;
    //     if(token){//将登陆的返回的token保存下来
    //         store.dispatch('tokenChange',token);
    //     }
        
    // }catch(err){
    //     console.log("在相应拦截这边其他请求不需要取token",err)
    // };
  
    // if(response.data.code==10001||response.data.code==402){//如果token为空或者过期，跳到登录
    //     store.dispatch('tokenChange',"");
    //     router.push({path:"/login"});
       
    // }
    return response;
}
    ,err=>{
        return Promise.reject(err)
    }
);
// axiosP.defaults.baseURL=""
const axios=function({path,method="GET",data={}}={}){
    return new Promise((resolve,reject)=>{
        let datas={params:{...data}}
        if(method==="POST") datas={...{data}};
        axiosP({
            url:`${config.host}${path}`,
            method,
            ...datas
        }).then(res=>{
            if(res.data.code===1){
                resolve(res.data.data)
            }else{
                reject(res.data)
            }
        })
    })
};
// let adminEvents=()=>{//判断是否为高级会员
//     let user=store.getters.info;
//     if(user.admin) return false;
//     return true
// }
//3.设置跨域请求保护session
// axios.defaults.withCredentials=true;
//4.设置请求服务器基础路径

//5.将axios注册  Vue示例
Vue.prototype.axios=axios;
// Vue.prototype.adminEvents=adminEvents;
//7.在main.js 引入axios即可


