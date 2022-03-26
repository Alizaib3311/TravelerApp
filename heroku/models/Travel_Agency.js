const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Travel_Agency', {
    agency_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    email: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    city: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    phone: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    password: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    cnic: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    registration: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    auth_pkey: {
      type: DataTypes.INTEGER,
      allowNull: true,
      references: {
        model: 'Authentication',
        key: 'auth_id'
      }
    }
  }, {
    sequelize,
    tableName: 'Travel_Agency',
    schema: 'tour',
    timestamps: false,
    indexes: [
      {
        name: "Travel_Agency_pkey",
        unique: true,
        fields: [
          { name: "agency_id" },
        ]
      },
    ]
  });
};
