var DataTypes = require("sequelize").DataTypes;
var _Authentication = require("./Authentication");
var _Travel_Agency = require("./Travel_Agency");
var _booking = require("./booking");
var _customer = require("./customer");
var _trips = require("./trips");

function initModels(sequelize) {
  var Authentication = _Authentication(sequelize, DataTypes);
  var Travel_Agency = _Travel_Agency(sequelize, DataTypes);
  var booking = _booking(sequelize, DataTypes);
  var customer = _customer(sequelize, DataTypes);
  var trips = _trips(sequelize, DataTypes);

  Travel_Agency.belongsTo(Authentication, { as: "auth_pkey_Authentication", foreignKey: "auth_pkey"});
  Authentication.hasMany(Travel_Agency, { as: "Travel_Agencies", foreignKey: "auth_pkey"});
  customer.belongsTo(Authentication, { as: "auth_pkey_Authentication", foreignKey: "auth_pkey"});
  Authentication.hasMany(customer, { as: "customers", foreignKey: "auth_pkey"});
  trips.belongsTo(Travel_Agency, { as: "travelagency_pkey_Travel_Agency", foreignKey: "travelagency_pkey"});
  Travel_Agency.hasMany(trips, { as: "trips", foreignKey: "travelagency_pkey"});
  booking.belongsTo(customer, { as: "cust", foreignKey: "cust_id"});
  customer.hasMany(booking, { as: "bookings", foreignKey: "cust_id"});
  booking.belongsTo(trips, { as: "trip", foreignKey: "trip_id"});
  trips.hasMany(booking, { as: "bookings", foreignKey: "trip_id"});

  return {
    Authentication,
    Travel_Agency,
    booking,
    customer,
    trips,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
