'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Aset extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      this.hasMany(models.AsetDetail, { foreignKey: "asetId", as: "asetDetail" });
    }
  }
  Aset.init({
    personId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Aset',
  });
  return Aset;
};