var express=require('express')
var auth=require('./auth.routes')
var trips=require('./trip.routes')
var router=express.Router()

router.use('/auth',auth)
router.use('/trip',trips)

module.exports=router