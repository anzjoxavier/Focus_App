const mongoose=require("mongoose");
const connection=mongoose.createConnection('mongodb://127.0.0.1:27017/focusapp').on("error",()=>{
    console.log("Connection Error");
}).on('open',()=>{
    console.log("Connection Successful");
});
module.exports=connection;