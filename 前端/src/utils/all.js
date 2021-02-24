class All{
    constructor(){}
    time(time){//当前时间
        return new Date(Number(time)).toLocaleString();
    }
    eliminate(text,is=false){//清除两边空格
        if(text===""||text===undefined) return ""
        text.toString().trim();
        if(text.toString().trim().length>0||is) return text.toString().trim();
        return false
    }
}
let newAll=new All();
export default{
    allTime:newAll.time,
    eliminate:newAll.eliminate
}