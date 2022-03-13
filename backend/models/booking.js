const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('booking', {
    book_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    cust_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'customer',
        key: 'cust_id'
      }
    },
    trip_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'trips',
        key: 'trip_id'
      }
    },
    seats: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'booking',
    schema: 'tour',
    timestamps: false,
    indexes: [
      {
        name: "booking_pkey",
        unique: true,
        fields: [
          { name: "book_id" },
        ]
      },
      {
        name: "fki_trip_id",
        fields: [
          { name: "trip_id" },
        ]
      },
    ]
  });
};
