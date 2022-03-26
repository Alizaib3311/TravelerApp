var db=require('../config/config');
var initModels=require('../models/init-models');
var models=initModels(db)

module.exports={
    register_traveler:async(data)=>{
        try{
            await db.authenticate()
            await models.customer.create(data)
            await models.Authentication.create(data)
            
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
    register_agency: async (data) => {
        try {
            await db.authenticate()
            await models.Travel_Agency.create(data)
            await models.Authentication.create(data)
            return {
                response: true
            }

        } catch (error) {
            return {
                response: false,
                error: error.message
            }
        }

    },




    login:async(data)=>{
        try{
            await db.authenticate()
            var result=await models.Authentication.findOne({where:{email:data.email,password:data.password}})
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