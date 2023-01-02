class ProductUseCase {
    constructor (productRepo) {
        this.ProductRepo = productRepo;
    }

    async getAllProduct(filter) {
        let result = {
            isSuccess: true,
            statusCode: 200,
            data: null
        }

        let product = await this.ProductRepo.getAll(filter)
        result.data = product;
        return result;
    }

    async getProductById(id) {
        let result = {
            isSuccess: false,
            statusCode: 404,
            reason: '',
            data: null
        }

        let product = await this.ProductRepo.getById(id)
        if (product === null) {
            result.reason = 'product not found';
            return result;
        }
        result.isSuccess = true;
        result.statusCode = 200;
        result.data = product;
        return result;
    }
}

module.exports = ProductUseCase;