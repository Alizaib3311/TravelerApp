var DataTypes = require("sequelize").DataTypes;
var _booking = require("./booking");
var _customer = require("./customer");
var _trips = require("./trips");

function initModels(sequelize) {
  var booking = _booking(sequelize, DataTypes);
  var customer = _customer(sequelize, DataTypes);
  var trips = _trips(sequelize, DataTypes);

  booking.belongsTo(customer, { as: "cust", foreignKey: "cust_id"});
  customer.hasMany(booking, { as: "bookings", foreignKey: "cust_id"});
  trips.belongsTo(customer, { as: "cust", foreignKey: "cust_id"});
  customer.hasMany(trips, { as: "trips", foreignKey: "cust_id"});
  booking.belongsTo(trips, { as: "trip", foreignKey: "trip_id"});
  trips.hasMany(booking, { as: "bookings", foreignKey: "trip_id"});

  return {
    booking,
    customer,
    trips,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
