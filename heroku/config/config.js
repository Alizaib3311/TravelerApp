const { Sequelize } = require("sequelize");
//---------------------------Schema name,username,password
//online DB
// module.exports=new Sequelize("ZHbVfdC3aa","ZHbVfdC3aa","Tyhy7p8EAK",{
//     host:"remotemysql.com",
//     dialect:"mysql",
//     define: {
//         timestamps: false
//     }
// });


//local DB
module.exports=new Sequelize("postgres","postgres","3311",{
    host:"127.0.0.1",
    dialect:"postgres",
    define: {
        timestamps: false
    }
});