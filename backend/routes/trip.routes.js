var express=require('express')
var router=express.Router()
var controller=require('../controller/trip.controller')

router.post('/',controller.createTrip)
router.get('/',controller.allTrips)

module.exports=router