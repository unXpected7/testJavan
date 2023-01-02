class PersonUsecase {
  constructor(personRepo, asetRepo, asetDetailRepo, productRepo) {
    this.PersonRepo = personRepo;
    this.AsetRepo = asetRepo;
    this.AsetDetailRepo = asetDetailRepo;
    this.ProductRepo = productRepo;
  }

  async getAllPerson(filter) {
    let result = {
      isSuccess: true,
      statusCode: 200,
      data: null,
    };

    let persons = await this.PersonRepo.getAll(filter);
    result.data = persons;
    return result;
  }

  async getPersonById(id) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };

    let person = await this.PersonRepo.getById(id);
    if (person === null) {
      result.reason = "person not found";
      return result;
    }

    let aset = await this.AsetRepo.getByPersonId(id);
    if (aset === null) {
      result.isSuccess = true;
      result.statusCode = 200;
      result.data = person;
      return result;
    }

    let asetDetail = await this.AsetDetailRepo.getByAsetId(aset.id);

    const products = [];
    let totalPrice = 0;
    for (const aset of asetDetail) {
      let product = await this.ProductRepo.getById(aset.productId);
      totalPrice += product.price;
      products.push(product);
    }
    const personValue = {
      id: person.id,
      name: person.name,
      gender: person.gender,
      createdAt: aset.createdAt,
      updatedAt: aset.updatedAt,
      totalPrice,
      totalAset: products.length,
        asetDetail
    };

    result.isSuccess = true;
    result.statusCode = 200;
    result.data = personValue;
    return result;
  }

  async getPersonByParentId(parentId) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };

    let person = await this.PersonRepo.getByParentId(parentId);
    if (person === null) {
      result.reason = "person not found";
      return result;
    }
    result.isSuccess = true;
    result.statusCode = 200;
    result.data = person;
    return result;
  }

  async createPerson(dataPerson) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };

    let verifyParent = await this.PersonRepo.getById(dataPerson.parentId);
    if (verifyParent === null) {
      result.reason = "person not found";
      return result;
    }
    let person = await this.PersonRepo.create(dataPerson);
    result.isSuccess = true;
    result.statusCode = 200;
    result.data = person;
    return result;
  }

  async updatePerson(dataPerson, id) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };

    let person = await this.PersonRepo.getById(id);

    if (person === null) {
      result.reason = "person not found";
      return result;
    }

    await this.PersonRepo.update(dataPerson, id);
    const updatePerson = await this.PersonRepo.getById(id);

    result.isSuccess = true;
    result.data = updatePerson;
    result.statusCode = 200;
    return result;
  }

  async deletePerson(id) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };

    let person = await this.PersonRepo.getById(id);
    if (person === null) {
      result.reason = "person not found";
      return result;
    }

    await this.PersonRepo.delete(id);

    result.isSuccess = true;
    result.statusCode = 200;
    return result;
  }
}

module.exports = PersonUsecase;
