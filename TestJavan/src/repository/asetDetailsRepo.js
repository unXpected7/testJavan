const { AsetDetail } = require('../models')

class AsetDetailRepo {
    constructor() {
        this.AsetDetailModel = AsetDetail;
     
    }

    async getAll(fillter) {
        const result = await this.AsetDetailModel.findAll(fillter)
        return result;
    }

    async getById(id) {
        const result = await this.AsetDetailModel.findOne({
            where: {
                id
            }
        })
        return result
    }

    async getByAsetId(asetId) {
        const result = await this.AsetDetailModel.findAll({
            where: {
                asetId
            }
        })
        return result
    }

    async create(aset) {
        const result = await this.AsetDetailModel.create(aset)
        return result
    }

    async update(aset, id) {
        const result = await this.AsetDetailModel.update(aset, {
            where : {
                id
            }
        })
        return result
    }
    
    async delete(id) {
        const result = await this.AsetDetailModel.destroy({
            where : {
                id
            }
        })
        return result
    }

}

module.exports = AsetDetailRepo;