const body_parser = require('body-parser');
const express=require("express");
const userRouter=require("./routers/user.routers");
const todoRouter=require("./routers/todo.routers");

const app=express();
app.use(body_parser.json());
app.use('/',userRouter);
app.use('/',todoRouter);
module.exports=app;