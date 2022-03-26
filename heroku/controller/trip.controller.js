const httpStatus = require('http-status')
// const APIError=require('../errors/api-error')
 const services=require('../services/trip.service')
// const { isEmpty } = require('lodash');

module.exports={

    createTrip:async(req,res)=>{
        var data=req.body
        data.start_date=new Date()
        data.end_date=new Date()
        var result=await services.create(data)
        if(result.response){
            res.status(httpStatus.OK).json({
                "message":"trip created"
            })
        }else{
            res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                "message":result.error
            })
        }

    },
    allTrips:async(req,res)=>{
        
        var result=await services.getAll()
        if(result.response){
            res.status(httpStatus.OK).json({
                data:result.data,
                "message":"trip created"
            })
        }else{
            res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                "message":result.error
            })
        }

    },
}