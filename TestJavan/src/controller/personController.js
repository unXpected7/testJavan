const resData = require("../helper/response");

module.exports = {
  getAllPerson: async (req, res, next) => {
    /*
      #swagger.tags = ['Person']
    */
    try {
      const result = await req.personUC.getAllPerson();

      return res.status(result.statusCode).json(resData.success(result.data));
    } catch (error) {
      next(error);
    }
  },

  getPersonById: async (req, res, next) => {
    /*
      #swagger.tags = ['Person']
    */
    try {
      const { id } = req.params;

      const result = await req.personUC.getPersonById(id);

      if (!result.isSuccess) {
        return res
          .status(result.statusCode)
          .json(resData.failed(result.reason));
      }

      return res.status(result.statusCode).json(resData.success(result.data));
    } catch (error) {
      next(error);
    }
  },

  getPersonByParentId: async (req, res, next) => {
    /*
      #swagger.tags = ['Person']
    */
    try {
      const { id } = req.params;

      const result = await req.personUC.getPersonByParentId(id);

      if (!result.isSuccess) {
        return res
          .status(result.statusCode)
          .json(resData.failed(result.reason));
      }

      return res.status(result.statusCode).json(resData.success(result.data));
    } catch (error) {
      next(error);
    }
  },

  createPerson: async (req, res, next) => {
    /*
      #swagger.tags = ['Person']
    */
    try {
      const dataPerson = {
        name: req.body.name,
        gender: req.body.gender,
        parentId: req.body.parentId,
      };

      const result = await req.personUC.createPerson(dataPerson);

      if (!result.isSuccess) {
        return res
          .status(result.statusCode)
          .json(resData.failed(result.reason));
      }

      return res.status(result.statusCode).json(resData.success(result.data));
    } catch (error) {
      next(error);
    }
  },

  updatePerson: async (req, res, next) => {
    /*
      #swagger.tags = ['Person']
    */
    try {
      const { id } = req.params;
      const dataPerson = {
        name: req.body.name,
        gender: req.body.gender,
        parentId: req.body.parentId,
      };

      const result = await req.personUC.updatePerson(dataPerson, id);

      if (!result.isSuccess) {
        return res
          .status(result.statusCode)
          .json(resData.failed(result.reason));
      }

      return res.status(result.statusCode).json(resData.success(result.data));
    } catch (error) {
      next(error);
    }
  },

  deletePerson: async (req, res, next) => {
    /*
      #swagger.tags = ['Person']
    */
    try {
      const { id } = req.params;

      const result = await req.personUC.deletePerson(id);

      if (!result.isSuccess) {
        return res
          .status(result.statusCode)
          .json(resData.failed(result.reason));
      }

      return res.status(result.statusCode).json(resData.success());
    } catch (error) {
      next(error);
    }
  },
};
