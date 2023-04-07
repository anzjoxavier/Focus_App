const mongoose=require("mongoose");
const db=require("../config/db"); 
const UserModel = require("./user.model");

const { Schema }=mongoose;

const todoSchema=new Schema({
    userid:{
        type:Schema.Types.ObjectId,
        ref:UserModel.modelName
    },
    title:{
        type:String,
        required:true
    },
    desc:{
        type:String,
        required:true
    }
});


const TodoModel=db.model('todo',todoSchema);

module.exports=TodoModel; 