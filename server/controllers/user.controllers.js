const UserService=require("../services/user.services");

exports.register=async(req,res,next)=>{
    try{
    const {email,password}=req.body;
    const successRes=await UserService.registerUser(email,password);
    res.json({status:true,success:"User Register Successfully"});
    }catch(error){
        throw error;
    }
}

exports.login=async(req,res,next)=>{
    try{
    const {email,password}=req.body;
    const user=await UserService.checkUser(email);
    
    if(!user){
        throw new Error('User does not exist');
    }
    
    const isMatch=await user.comparePassword(password);
    if(isMatch==false){ 
        throw new Error('Wrong Password'); 
    } 
    let tokenData={_id:user._id,email:user.email}
    const token=await UserService.generateToken(tokenData,"secretkey",'1h');
    res.status(200).json({status:true,token:token});  

    }catch(error){
        throw error;
    }
}