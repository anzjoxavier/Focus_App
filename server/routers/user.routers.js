const router =require("express").Router();
const UserController=require("../controllers/user.controllers");

router.post('/registration',UserController.register);

router.post('/login',UserController.login);

module.exports=router;