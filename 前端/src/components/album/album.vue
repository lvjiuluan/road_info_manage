<template>
    <div class="album-box">
        <div>{{title}}</div>
        <div>
            <el-upload
                action="https"
                list-type="picture-card"
                :on-preview="handlePictureCardPreview"
                :multiple="true"
                :on-remove="handleRemove"
                drag
                :http-request="submitEvent"
                ref="album"
                :auto-upload="false"
                :limit="count"
            >
                <i class="el-icon-plus"></i>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible" size="tiny">
                <img width="100%" :src="dialogImageUrl" alt="预览">
            </el-dialog>
        </div>
        
    </div>
</template>
<script>
export default {
    props:{
        //上传参数（目前不可用）
        value:{
            type:Object,
            default:()=>{}
        },
        //标题
        title:{
            type:String,
            default:"上传图片"
        },
        //上传个数（默认不限制）
        count:{
            type:Number,
            default:0
        }
    },
    data(){
        return {
        dialogImageUrl: '',
        dialogVisible: false,
        formData:"",
        isEmpty:false
      };
    },
    methods: {
        /*
        父组件调用方法 子组件ref="album"
            //调用上传图片
            let res=this.$refs.album.parent();
            //child()上次函数,isEmpty是否添加图片(false为没添加图片)，stop()上传结束调用
            let {child,isEmpty,stop}=res;
            if(!isEmpty) return this.$message.error("请选择学生照片")
            child().then(()=>{
                stop()
            })
        */ 
        parent(){
            this.$refs.album.submit();
            //this.value此参数无法传到后端（bug）
            this.formData.append("value",this.value);
            let child=()=>{
                return this.axios({
                path:"/user/img",
                data:this.formData,
                method:"POST"
                });
            },isEmpty=this.isEmpty;
            this.isEmpty=false;
            return  {child,isEmpty,stop:()=>{
                this.formData = new FormData();
                this.$refs.album.clearFiles();
            }}
        },
        submitEvent(params){
            this.isEmpty=true;
            this.formData.append("file", params.file);
        },
        handleRemove(file, fileList) {
        },
        handlePictureCardPreview(file) {
            this.dialogImageUrl = file.url;
            this.dialogVisible = true;
        }
    },
    created(){
        this.formData = new FormData();
    }
}
</script>
<style>
    .album-box{
        text-align: center;
    }
    .album-box>div{
        padding: 5px;
        font-size: 14px;
        color: #666;
    }
    .el-upload-dragger{
        width: 146px !important;
        height: 146px !important;
    }
</style>
