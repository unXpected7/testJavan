class AsetUseCase {
  constructor(asetRepo, asetDetailRepo, personRepo, productRepo) {
    this.AsetRepo = asetRepo;
    this.AsetDetailRepo = asetDetailRepo;
    this.PersonRepo = personRepo;
    this.ProductRepo = productRepo;
  }

  async getAsetByPersonId(personId) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };

    let person = await this.PersonRepo.getById(personId);
    let aset = await this.AsetRepo.getByPersonId(personId);
    if (aset === null) {
      result.reason = "aset not found";
      return result;
    }
    let asetDetail = await this.AsetDetailRepo.getByAsetId(aset.id);
    console.log(person)

    const products = [];
    let totalPrice = 0;
    for (const aset of asetDetail) {
      let product = await this.ProductRepo.getById(aset.productId);
      totalPrice += product.price;
      products.push(product);
    }

    const asetValue = {
      id: aset.id,
      personId: aset.personId,
      createdAt: aset.createdAt,
      updatedAt: aset.updatedAt,
      person,
      totalPrice,
      totalAset: products.length,
      asetDetail,
    };

    result.isSuccess = true;
    result.statusCode = 200;
    result.data = asetValue;
    return result;
  }

  async createAset(personId, items) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };
    if (personId === undefined) {
      result.reason = "please insert member";
      return result;
    }

    const getAset = await this.AsetRepo.getByPersonId(personId);
    if (getAset === null) {
      await this.AsetRepo.create({ personId: personId });
    }

    const personAset = await this.AsetRepo.getByPersonId(personId);
    await this.createAsetDetail(personAset.id, items);

    const aset = await this.AsetRepo.getByPersonId(personId);
    const asetDetail = await this.AsetDetailRepo.getByAsetId(aset.id);

    const createAsetValue = {
      id: aset.id,
      asetDetail,
    };

    result.isSuccess = true;
    result.statusCode = 200;
    result.data = createAsetValue;
    return result;
  }

  async createAsetDetail(asetId, items) {
    for (let i = 0; i < items.length; i += 1) {
      if (items[i].qty < 0) {
        continue;
      }
      let product = await this.ProductRepo.getById(items[i].id);
      if (product !== null) {
        let asetDetailsValue = {
          asetId,
          productId: product.id,
        };

        await this.AsetDetailRepo.create(asetDetailsValue);
      }
    }
  }

  async DeleteAsetDetailById(id) {
    let result = {
      isSuccess: false,
      statusCode: 404,
      reason: "",
      data: null,
    };
    let asetDetail = await this.AsetDetailRepo.getById(id);
    if (asetDetail === null) {
      result.reason = " AsetDetail not found";
      return result;
    }
    await this.AsetDetailRepo.delete(id);

    let aset = await this.AsetRepo.getById(asetDetail.asetId);
    let verifyAset = await this.AsetDetailRepo.getByAsetId(aset.id);

    if (verifyAset.length === 0) {
      await this.AsetRepo.delete(aset.id);
    }

    result.isSuccess = true;
    result.statusCode = 200;
    return result;
  }
}

module.exports = AsetUseCase;
