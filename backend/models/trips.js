const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('trips', {
    trip_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    location: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    price: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    start_date: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    end_date: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    total_seats: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    available_seats: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    bus_category: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    cust_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'customer',
        key: 'cust_id'
      }
    }
  }, {
    sequelize,
    tableName: 'trips',
    schema: 'tour',
    timestamps: false,
    indexes: [
      {
        name: "fki_cust_id",
        fields: [
          { name: "cust_id" },
        ]
      },
      {
        name: "trips_pkey",
        unique: true,
        fields: [
          { name: "trip_id" },
        ]
      },
    ]
  });
};
