const { Person, Aset, AsetDetail } = require('../models')

class PersonRepo {
    constructor() {
        this.PersonRepo = Person;
        this.AsetModel = Aset;
        this.AsetDetailModel = AsetDetail;
    }

    async getAll(fillter) {
        const result = await this.PersonRepo.findAll(fillter)
        return result;
    }

    async getById(id) {
        const result = await this.PersonRepo.findOne({
            where: {
                id
            },
        })
        return result
    }

    async getByParentId(parentId) {
        const result = await this.PersonRepo.findAll({
            where: {
                parentId
            }
        })
        return result
    }

    async create(person) {
        const result = await this.PersonRepo.create(person)
        return result
    }

    async update(person, id) {
        const result = await this.PersonRepo.update(person, {
            where : {
                id
            }
        })
        return result
    }
    
    async delete(id) {
        const result = await this.PersonRepo.destroy({
            where : {
                id
            }
        })
        return result
    }

}

module.exports = PersonRepo;