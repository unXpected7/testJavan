'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Person extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      this.hasOne(models.Aset, { foreignKey: "personId", as: "aset" });
    }
  }
  Person.init({
    name: DataTypes.STRING,
    gender: DataTypes.STRING,
    parentId: DataTypes.INTEGER,
  }, {
    sequelize,
    modelName: 'Person',
  });
  return Person;
};