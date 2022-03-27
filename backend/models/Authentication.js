const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Authentication', {
    auth_id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    email: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    password: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    type: {
      type: DataTypes.INTEGER,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'Authentication',
    schema: 'tour',
    timestamps: false,
    indexes: [
      {
        name: "Authentication_pkey",
        unique: true,
        fields: [
          { name: "auth_id" },
        ]
      },
    ]
  });
};
