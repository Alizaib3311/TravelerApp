var express=require('express')
var router=express.Router()
var controller=require('../controller/auth.controller')

router.post('/registerTraveler',controller.register_traveler)
router.post('/registerAgency', controller.register_agency)
router.post('/login',controller.login)

module.exports=router