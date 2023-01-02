const { Product } = require('../models')

class ProductRepo {
    constructor() {
        this.ProductModel = Product;
    }

    async getAll(fillter) {
        const result = await this.ProductModel.findAll(fillter)
        return result;
    }

    async getById(id) {
        const result = await this.ProductModel.findOne({
            where: {
                id
            }
        })
        return result
    }

}

module.exports = ProductRepo;