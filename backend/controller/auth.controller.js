const httpStatus = require('http-status')
// const APIError=require('../errors/api-error')
 const services=require('../services/auth.service')
// const { isEmpty } = require('lodash');


module.exports={

    register_traveler:async(req,res)=>{
        var data=req.body
        
        var result=await services.register_traveler(data)
        if(result.response){
            res.status(httpStatus.OK).json({
                "message":"Traveler created"
            })
        }else{
            res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                "message":result.error
            })
        }

    },
    register_agency: async (req, res) => {
        var data = req.body

        var result = await services.register_agency(data)
        if (result.response) {
            res.status(httpStatus.OK).json({
                "message": "Agency created"
            })
        } else {
            res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                "message": result.error
            })
        }

    },



    login:async(req,res)=>{
        var data=req.body

        var result=await services.login(data)
        if(result.response){
            console.log(result)
            console.log("Logged in"),
            res.status(httpStatus.OK).json({
                
                "message":"user logged-in",
                data:result.data
            })
        }else{
            res.status(httpStatus.NOT_FOUND).json({
                "message":result.message
            })
        }

    }



}