const express=require("express")
const router=express.Router();

const pool=require("../pool")

//账号登录接口
router.post("/login",(req,res)=>{
    var sql="SELECT * FROM user WHERE name=? AND pwd=?",obj=req.body;
    pool.query(sql,[obj.name,obj.pwd],(err,result)=>{
        if(err) return res.send({code:500,message:"请求失败",err});
        console.log(obj)
        if(result.length===0) return res.send({code:1,message:"登录失败",data:{is:0}})
        res.send({code:1,message:"登录成功",data:{is:1,user:result[0]}})
    });
});

//查询返回路面类型
router.get("/sellmlx",(req,res)=>{
    let sql="SELECT lmlx_name  FROM lmlx";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//添加道路数据
router.get("/addList",(req,res)=>{
    let sql="INSERT INTO list(name,lmlx_name,site,bsite,sjdw,ssxz,length,speed,yhdj,dllx_name) VALUES (?,?,?,?,?,?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.name,obj.lmlx_name,obj.site,obj.bsite,obj.sjdw,obj.ssxz,obj.length,obj.speed,obj.yhdj,obj.dllx_name],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});

//查询道路数据
router.get("/sele",(req,res)=>{
    let sql="SELECT * FROM list";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//查询道路名称
router.get("/seleDname",(req,res)=>{
    let sql="SELECT name FROM list";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});


//修改道路数据
router.get("/change",(req,res)=>{
    let sql="UPDATE list SET name=?,lmlx_name=?,site=?,bsite=?,sjdw=?,ssxz=?,length=?,speed=?,dllx_name=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.name,obj.lmlx_name,obj.site,obj.bsite,obj.sjdw,obj.ssxz,obj.length,obj.speed,obj.dllx_name,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});

//删除道路
router.get("/dele",(req,res)=>{
    let sql="DELETE FROM list WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});

//添加评估
router.get("/addPg",(req,res)=>{
    let sql="INSERT INTO pg(zb,pqi,dj,rqi,djj,pci,djjj) VALUES (?,?,?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.zb,obj.pqi,obj.dj,obj.rqi,obj.djj,obj.pci,obj.djjj],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});
//查询评估
router.get("/selePg",(req,res)=>{
    let sql="SELECT * FROM pg";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//删除评估
router.get("/delePg",(req,res)=>{
    let sql="DELETE FROM pg WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});

//统计
let lists=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT SUM(c) FROM ( SELECT COUNT(*) AS c FROM admin UNION ALL SELECT COUNT(*) AS c FROM dq UNION ALL SELECT COUNT(*) AS c FROM lm UNION ALL SELECT COUNT(*) AS c FROM pg UNION ALL SELECT COUNT(*) AS c FROM ri ) AS total";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["SUM(c)"]);
     });
    });
};
let tjs=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM pg";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};
let admin=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM admin";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};
let ren=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM ren";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};

//日常巡查工单
let ri=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM ri";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};
//路面平整度记录工单
let dq=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM dq";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};
//路面损害记录工单
let lm=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM lm";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};

router.get("/tj",async(req,res)=>{
    let result=await Promise.all([lists(),ri(),dq(),lm(),admin(),tjs()]);
    res.send({code:1,message:"查询成功",data:[
        
        {name:"工单总数",count:result[0]}, 
        {name:"日常巡查工单",count:result[1]},
        {name:"路面平整度记录工单",count:result[2]},
        {name:"路面损害记录工单",count:result[3]},
        {name:"设施损害通知工单",count:result[4]},
        {name:"路面总体评估工单",count:result[5]},
       
    ]})
});


let dlzs=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(1) FROM list";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(1)"]);
     });
    });
};

let Aji=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.pqi_dj='A'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

let Bji=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.pqi_dj='B'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let Cji=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.pqi_dj='C'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let Dji=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.pqi_dj='D'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

let K=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.dllx_name='快速路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let ZC=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.dllx_name='主干路' OR  list.dllx_name='次干路'  ";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

let Z=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.dllx_name='支路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

router.get("/dltj",async(req,res)=>{
    let result=await Promise.all([dlzs(),K(),ZC(),Z(),Aji(),Bji(),Cji(),Dji()]);
    res.send({code:1,message:"查询成功",data:[
        
        {name:"道路总数",count:result[0]}, 
        {name:"快速路",count:result[1]},
        {name:"主/次干路",count:result[2]},
        {name:"支路",count:result[3]},
        {name:"A级路面总数",count:result[4]},
        {name:"B级路面总数",count:result[5]},
        {name:"C级路面总数",count:result[6]},
        {name:"D级路面总数",count:result[7]},
       
    ]})
});



let A1=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*)  FROM list WHERE list.pqi_dj='A' AND list.dllx_name='快速路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

let B1=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*)  FROM list WHERE list.pqi_dj='B' AND list.dllx_name='快速路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let C1=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*)  FROM list WHERE list.pqi_dj='C' AND list.dllx_name='快速路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let D1=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.pqi_dj='D' AND list.dllx_name='快速路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};



router.get("/pie1",async(req,res)=>{
    let result=await Promise.all([A1(),B1(),C1(),D1()]);
    res.send({code:1,message:"查询成功",  data:[
        {value:result[0], name:'A'},
        {value:result[1], name:'B'},
         {value:result[2], name:'C'},
         {value:result[3], name:'D'},
    ]})
});























let A2=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*)  FROM list WHERE list.pqi_dj='A' AND list.dllx_name='支路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

let B2=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*)  FROM list WHERE list.pqi_dj='B' AND list.dllx_name='支路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let C2=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*)  FROM list WHERE list.pqi_dj='C' AND list.dllx_name='支路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let D2=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE list.pqi_dj='D' AND list.dllx_name='支路'";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};









router.get("/pie2",async(req,res)=>{
    let result=await Promise.all([A2(),B2(),C2(),D2()]);
    res.send({code:1,message:"查询成功",  data:[
        {value:result[0], name:'A'},
        {value:result[1], name:'B'},
         {value:result[2], name:'C'},
         {value:result[3], name:'D'},
    ]})
});









let A3=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE (list.pqi_dj='A' AND list.dllx_name='主干路') OR ( list.pqi_dj='A' AND list.dllx_name='次干路')";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};

let B3=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE (list.pqi_dj='B' AND list.dllx_name='主干路') OR ( list.pqi_dj='B' AND list.dllx_name='次干路')";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let C3=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE (list.pqi_dj='C' AND list.dllx_name='主干路') OR ( list.pqi_dj='C' AND list.dllx_name='次干路')";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};
let D3=()=>{
    return new Promise((resolve,reject)=>{
     let sql="SELECT COUNT(*) FROM list WHERE (list.pqi_dj='D' AND list.dllx_name='主干路') OR ( list.pqi_dj='D' AND list.dllx_name='次干路')";
     pool.query(sql,(err,res)=>{
         if(err) return resolve(0);
         resolve(res[0]["COUNT(*)"]);
     });
    });
};








router.get("/pie3",async(req,res)=>{
    let result=await Promise.all([A3(),B3(),C3(),D3()]);
    res.send({code:1,message:"查询成功",  data:[
        {value:result[0], name:'A'},
        {value:result[1], name:'B'},
         {value:result[2], name:'C'},
         {value:result[3], name:'D'},
    ]})
});


















//设备单信息添加
router.get("/addAdmin",(req,res)=>{
    let sql="INSERT INTO admin(dname,xname,site,wei,bz) VALUES (?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.dname,obj.xname,obj.site,obj.wei,obj.bz],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});
//设备单查询
router.get("/seleAdmin",(req,res)=>{
    let sql="SELECT * FROM admin";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//删除设备
router.get("/deleAdmin",(req,res)=>{
    let sql="DELETE FROM admin WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});
//设备巡查单修改
router.get("/adminChange",(req,res)=>{
    let sql="UPDATE admin SET dname=?,xname=?,site=?,wei=?,bz=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.dname,obj.xname,obj.site,obj.wei,obj.bz,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});

//巡查人员添加
router.get("/addRen",(req,res)=>{
    let sql="INSERT INTO ren(xname,xphone,xsex) VALUES (?,?,?)",obj=req.query;
    pool.query(sql,[obj.xname,obj.xphone,obj.xsex],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});

//巡查人员修改
router.get("/renChange",(req,res)=>{
    let sql="UPDATE ren SET xname=?,xsex=?,xphone=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.xname,obj.xsex,obj.xphone,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});

//巡查员查询
router.get("/seleRem",(req,res)=>{
    let sql="SELECT * FROM ren";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//巡查员姓名查询
router.get("/seleXname",(req,res)=>{
    let sql="SELECT xname FROM ren";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//巡查员删除
router.get("/deleRen",(req,res)=>{
    let sql="DELETE FROM ren WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});


//技术人员添加
router.get("/addJen",(req,res)=>{
    let sql="INSERT INTO xren(jname,jphone,jsex) VALUES (?,?,?)",obj=req.query;
    pool.query(sql,[obj.jname,obj.jphone,obj.jsex],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});

//技术人员修改
router.get("/xrenChange",(req,res)=>{
    let sql="UPDATE xren SET jname=?,jsex=?,jphone=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.jname,obj.jsex,obj.jphone,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});

//技术查询
router.get("/seleJem",(req,res)=>{
    let sql="SELECT * FROM xren";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});


//技术删除
router.get("/deleJen",(req,res)=>{
    let sql="DELETE FROM xren WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});


//日常添加
router.get("/addRi",(req,res)=>{
    let sql="INSERT INTO ri(xname,dname,time,site,bz) VALUES (?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.xname,obj.dname,obj.time,obj.site,obj.bz],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});
//日常查询
router.get("/seleRi",(req,res)=>{
    let sql="SELECT * FROM ri";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//日常删除
router.get("/deleRi",(req,res)=>{
    let sql="DELETE FROM ri WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});
//日常巡查单修改
router.get("/riChange",(req,res)=>{
    let sql="UPDATE ri SET xname=?,dname=?,time=?,site=?,bz=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.xname,obj.dname,obj.time,obj.site,obj.bz,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});


//定期添加
router.get("/addDq",(req,res)=>{
    let sql="INSERT INTO dq(dname,xhao,xname,time,iri,bz) VALUES (?,?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.dname,obj.xhao,obj.xname,obj.time,obj.iri,obj.bz],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});
//定期查询
router.get("/seleDq",(req,res)=>{
    let sql="SELECT * FROM dq";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//定期删除
router.get("/deleDq",(req,res)=>{
    let sql="DELETE FROM dq WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});
//定期检查单修改
router.get("/dqChange",(req,res)=>{
    let sql="UPDATE dq SET xname=?,dname=?,time=?,iri=?,bz=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.xname,obj.dname,obj.time,obj.iri,obj.bz,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});

//路面平整添加
router.get("/addLm",(req,res)=>{
    let sql="INSERT INTO lm(dname,xname,chang,kuan,class,xchang,xkuan,xgao) VALUES (?,?,?,?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.dname,obj.xname,obj.chang,obj.kuan,obj.class,obj.xchang,obj.xkuan,obj.xgao],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});
//路面平整查询
router.get("/seleLm",(req,res)=>{
    let sql="SELECT * FROM lm";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//路面平整度修改
router.get("/lmChange",(req,res)=>{
    let sql="UPDATE lm SET xname=?,dname=?,chang=?,kuan=?,class=?,xchang=?,xkuan=?,xgao=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.xname,obj.dname,obj.chang,obj.kuan,obj.class,obj.xchang,obj.xkuan,obj.xgao,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});


//路面平整删除
router.get("/deleLm",(req,res)=>{
    let sql="DELETE FROM lm WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});


//路面损坏添加
router.get("/addZpg",(req,res)=>{
    let sql="INSERT INTO zpg(dname,jdao,mian,class,xmian,xmi,fen) VALUES (?,?,?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.dname,obj.jdao,obj.mian,obj.class,obj.xmian,obj.xmi,obj.fen],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});
//路面损坏查询
router.get("/seleZpg",(req,res)=>{
    let sql="SELECT * FROM zpg";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//路面损坏删除
router.get("/deleZpg",(req,res)=>{
    let sql="DELETE FROM zpg WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});
module.exports=router;

//路面损害类型查询
router.get("/seleShlx",(req,res)=>{
    let sql="SELECT DISTINCT shlx_name FROM kfbz WHERE lmlx_name =(SELECT lmlx_name FROM list WHERE name=?)",obj=req.query;
    pool.query(sql,[obj.dname],(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//查询道路类型
router.get("/seldllx",(req,res)=>{
    let sql="SELECT * FROM dllx";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//道路评估信息生成insertPGg
router.get("/insertPg",(req,res)=>{
    let sql="INSERT INTO pg(name,dllx_name) VALUES (?,?)",obj=req.query;
    pool.query(sql,[obj.name,obj.dllx_name],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});

//查询评价过的道路
router.get("/getDname",(req,res)=>{
    let sql="SELECT DISTINCT dq.dname FROM dq,lm WHERE dq.dhao=lm.dhao";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//查询评估的 name PCI RQI/IRI
router.get("/getPci",(req,res)=>{
    let sql="SELECT name,pci,rqi_iri FROM pg";
    // let sql=" SELECT name,pci,rqi_iri FROM pg GROUP BY pci,rqi_iri ORDER BY name";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//查询巡检计划
router.get("/seleXjjh",(req,res)=>{
    let sql="SELECT * FROM xjjh";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//seleWorks
router.get("/seleWorks",(req,res)=>{
    let sql="SELECT xname FROM ren";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//添加巡检计划数据
router.get("/insertXjjh",(req,res)=>{
    let sql="INSERT INTO xjjh(nurseName,dname,mondayStatus,thursdayStatus,wednesdayStatus,thuesdayStatus,fridayStatus,saturdayStatus,sundayStatus) VALUES (?,?,?,?,?,?,?,?,?)",obj=req.query;
    pool.query(sql,[obj.nurseName,obj.dname,obj.mondayStatus,obj.thursdayStatus,obj.wednesdayStatus,obj.thuesdayStatus,obj.fridayStatus,obj.saturdayStatus,obj.sundayStatus],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});

//修改巡检计划数据//xjjhChange
router.get("/xjjhChange",(req,res)=>{
    let sql="UPDATE xjjh SET nurseName=?,dname=?,mondayStatus=?,thursdayStatus=?,wednesdayStatus=?,thuesdayStatus=?,fridayStatus=?,saturdayStatus=?,sundayStatus=? WHERE id=?",obj=req.query;
    pool.query(sql,[obj.nurseName,obj.dname,obj.mondayStatus,obj.thursdayStatus,obj.wednesdayStatus,obj.thuesdayStatus,obj.fridayStatus,obj.saturdayStatus,obj.sundayStatus,obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"修改失败",err});
        res.send({code:1,message:"修改成功"})
    });
});

//删除巡检计划数据deleXjjh
router.get("/deleXjjh",(req,res)=>{
    let sql="DELETE FROM xjjh WHERE id=?",obj=req.query;
    pool.query(sql,[obj.id],(err,result)=>{
        if(err) return res.send({code:500,message:"删除失败",err});
        res.send({code:1,message:"删除成功"})
    });
});
//查找多少条数据
router.get("/seleTotal",(req,res)=>{
    let sql="SELECT COUNT(id) as num FROM xjjh";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//查询排班名称
router.get("/selePname",(req,res)=>{
    let sql="SELECT pbzt_name FROM pbzt";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});
//inseTemp添加临时数据
router.get("/inseTemp",(req,res)=>{
    let sql="INSERT INTO temp(dname) VALUES (?)",obj=req.query;
    pool.query(sql,[obj.value],(err,result)=>{
        if(err) return res.send({code:500,message:"添加失败",err});
        res.send({code:1,message:"添加成功"})
    });
});

//seleTest查询list
router.get("/seleTest",(req,res)=>{
    let sql="SELECT ids,name,lmlx_name,site,bsite,dllx_name,sjdw,ssxz,length,speed,yhdj from list WHERE(name=(select dname FROM temp order by id desc limit 0,1))";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});


//查询kcsj
router.get("/seleJcsj",(req,res)=>{
    let sql="SELECT * from dq,zpg where(dq.dname=zpg.dname and dq.dname=(SELECT dname FROM temp ORDER BY id DESC LIMIT 0,1)) ";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        res.send({code:1,message:"查询成功",data:result})
    });
});

//查询lsdj
router.get("/seleLsdj",(req,res)=>{
    let sql="SELECT * FROM pg where(pg.name=(SELECT dname FROM temp ORDER BY id DESC LIMIT 0,1))";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});


//查询pqi
router.get("/selePqr",(req,res)=>{
    let sql="SELECT * FROM pg where(pg.name=(SELECT dname FROM temp ORDER BY id DESC LIMIT 0,1))";
    pool.query(sql,(err,result)=>{
        if(err) return res.send({code:500,message:"查询失败",err});
        if(result.length===0) return res.send({code:1,message:"查询成功",data:[]});
        res.send({code:1,message:"查询成功",data:result})
    });
});
