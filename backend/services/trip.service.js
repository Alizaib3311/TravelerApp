var db=require('../config/config');
var initModels=require('../models/init-models');
var models=initModels(db)

module.exports={
    create:async(data)=>{
        try{
            await db.authenticate()
            await models.trips.create(data)
            
            return {
                response: true
            }

        }catch(error){
            return {
                response:false,
                error:error.message
            }
        }
        
    },
    getAll:async()=>{
        try{
            await db.authenticate()
            var result=await models.customer.findAll()
            if(result!=undefined){
                return {
                    response: true,
                    data:result
                }
            }else{
                return {
                    response: false,
                    message:"Invalid login"
                }
            }

        }catch(error){
            return {
                response:false,
                error:error.message
            }
        }
        
    }
}