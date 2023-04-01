const app=require("./app");
const db=require("./config/db");
const UserModel=require("./models/user.model");
const port=3100;

app.get('/',(req,res)=>{
    res.send("Hello world!!");
})

app.listen(port,()=>{
    console.log(`Server listening on Port http://localhost:${port}`);
})