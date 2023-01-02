const { Aset, AsetDetail } = require('../models')

class AsetRepo {
    constructor() {
        this.AsetModel = Aset;
        this.AsetDetailModel = AsetDetail;
    }

    async getAll(fillter) {
        const result = await this.AsetModel.findAll(fillter)
        return result;
    }

    async getById(id) {
        const result = await this.AsetModel.findOne({
            where: {
                id
            }
        })
        return result
    }

    async getByPersonId(personId) {
        const result = await this.AsetModel.findOne({
            where: {
                personId
            }
        })
        return result
    }

    async create(aset) {
        const result = await this.AsetModel.create(aset)
        return result
    }

    async update(aset, id) {
        const result = await this.AsetModel.update(aset, {
            where : {
                id
            }
        })
        return result
    }
    
    async delete(id) {
        const result = await this.AsetModel.destroy({
            where : {
                id
            }
        })
        return result
    }

}

module.exports = AsetRepo;