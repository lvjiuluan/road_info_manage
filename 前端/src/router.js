import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'//引入store(vuex)
Vue.use(Router)

// export default new Router({
//   routes: [
//       {path:'/',component:Home,
//       },
//       {path:"/detail",component:Detail,
//         children:[
//           {
//             path:"/a",
//             component:DetailA
//           },
//           {
//             path:"/b",
//             component:DetailB
//           }
//         ]
//       }
//   ]
// })

const router=new Router({
  routes: [
          {
            path:"/",
            redirect:"/login"
          },

          {
            path:'/index',
            name:"index",
            component:() => import('@/pages/index/index.vue'),
            meta:{
            },
            children:[
              {
                path:"/home",
                name:"home",
                component:() => import('@/pages/index/home.vue'),
              },
              {
                path:"/xjjh",
                name:"xjjh",
                component:() => import('@/pages/index/xjjh.vue'),
              },
              {
                path:"/test",
                name:"test",
                component:() => import('@/pages/index/test.vue'),
              },
              {
                path:"/jcsj",
                name:"jcsj",
                component:() => import('@/pages/index/jcsj.vue'),
              },
              {
                path:"/map",
                name:"map",
                component:() => import('@/pages/index/map.vue'),
              },
              {
                path:"/list",
                name:"list",
                component:() => import('@/pages/list/list.vue'),
              },
              {
                path:"/assess",
                name:"assess",
                component:() => import('@/pages/list/assess.vue'),
              },
              {
                path:"/tj",
                name:"tj",
                component:() => import('@/pages/index/tj.vue'),
              },
              {
                path:"/admin",
                name:"admin",
                component:() => import('@/pages/tabel/admin.vue'),
              },
              {
                path:"/ren",
                name:"ren",
                component:() => import('@/pages/tabel/ren.vue'),
              },
              {
                path:"/xren",
                name:"xren",
                component:() => import('@/pages/tabel/xren.vue'),
              },
              {
                path:"/ri",
                name:"ri",
                component:() => import('@/pages/tabel/ri.vue'),
              },
              {
                path:"/dq",
                name:"dq",
                component:() => import('@/pages/tabel/dq.vue'),
              },
              {
                path:"/lm",
                name:"lm",
                component:() => import('@/pages/tabel/lm.vue'),
              },
              {
                path:"/zpg",
                name:"zpg",
                component:() => import('@/pages/tabel/zpg.vue'),
              },
            ]
          },
          {
            path:"/login",
            name:"login",
            component:() => import('@/pages/login.vue'),
          }
      ]
})
// 1、to:即将要进入的目标路由对象；

//   2、from:当前导航即将要离开的路由对象；

//   3、next ：调用该方法后，才能进入下一个钩子函数（afterEach）。

//         next()//直接进to 所指路由
//         next(false) //中断当前路由
//         next('route') //跳转指定路由
//         next('error') //跳转错误路由
  router.beforeEach((to,from,next)=>{
    let user=window.sessionStorage.getItem("user");
    if(user&&to.path==="/login") return next("/home");
    next();
   
  })
 export default router;