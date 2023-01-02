'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Product extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Product.init({
    title: DataTypes.STRING,
    description: DataTypes.TEXT,
    price: DataTypes.INTEGER,
    discountPercentage: DataTypes.INTEGER,
    rating: DataTypes.INTEGER,
    stock: DataTypes.INTEGER,
    brand: DataTypes.STRING,
    category: DataTypes.STRING,
    thumbnail: DataTypes.STRING,
    images: DataTypes.TEXT
  }, {
    sequelize,
    modelName: 'Product',
  });
  return Product;
};