
<template>

  <!-- <div class="login-title">系统登录</div> -->
    <div class="loginTop" :style="conTop">
       <div class="login-box">
           <div class="login-input-box">
              <span class="spanC">系统登陆</span>
               <el-input
                    placeholder="请输入内容"
                    suffix-icon="el-icon-s-custom"
                    class="login-input"
                    style="margin-top:42px"
                    v-model="name">
                </el-input>
               <el-input
                    class="login-input"
                    placeholder="请输入内容"
                    suffix-icon="el-icon-s-cooperation"
                    v-model="pwd"
                    show-password>
                </el-input>
                 <el-button type="primary" class="login-but" @click="login">登录</el-button>
           </div>
       </div>
    </div>
    
</template>


<script>
export default {
    data(){
        return {
            name:"",
            pwd:"",
            conTop: {
                // backgroundImage:'url(' + require('@/assets/imgs/001.jpg') + ')',
                // backgroundRepeat:'no-repeat',
                // backgroundSize:'100% 100%'
            }
        }
    },
    created(){

    },
    methods:{
        login(){
            this.axios({
                path:"/user/login",
                method:"POST",
                data:{
                    name:this.name,
                    pwd:this.pwd
                }
            }).then(res=>{
                if(res.is===0) return this.$message.error("请输入正确的账号和密码");
                let user=res.user;
                window.sessionStorage.setItem("user",JSON.stringify(user))
                this.$message.success("登录成功");
                this.$router.push("/home");
            })
        }
    },
   
}
</script>

<style  lang="scss" type="text/css" >
  .spanC{
      position: relative;
     left: 100px;
    top: 20px;
    font-size: 19px;
      color: white;
  }

    .loginTop{
        width: 100%;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        .login-box{
          width: 310px;
           height: 283px;
            // border-radius: 5px;
            // overflow: hidden;
            // box-shadow: 0px 0px 5px 0px #666;
            .login-title{
                padding: 25px 207px;
                // background: 	#160f74;
                color:	white;
                // font-size: 30px;
                // font-weight: bold;
            }
            .login-input-box{
                background: rgba(255, 255, 255, 0.363);
                height: 100%;
                padding: 10px 20px 30px;

                .login-input{
                    margin-top: 20px;
                    input{
                        background: rgba(255, 255, 255, 0.74);
                        color: #333;
                    }
                }
                .login-but{
                    margin: 40px auto 0;
                    display: block;
                    background: 	#4169E1;
                     border: 1px solid #666;
                    span{
                        color: #fff;
                    }
                }
            }
        }
    }
</style>