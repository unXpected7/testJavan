const resData = require("../helper/response");

module.exports = {
  getAsetByPersonId: async (req, res, next) => {
    /*
      #swagger.tags = ['Aset']
    */
    try {
      const { id } = req.params;
      const result = await req.asetUC.getAsetByPersonId(id);
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

  createAset: async (req, res, next) => {
    /*
      #swagger.tags = ['Aset']
    */
    try {
      const { personId } = req.query;
      const { items } = req.body;

      const result = await req.asetUC.createAset(personId, items);

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

  deletAsetDetail: async (req, res, next) => {
    /*
      #swagger.tags = ['Aset']
    */
    try {
      const { id } = req.params;

      const result = await req.asetUC.DeleteAsetDetailById(id);

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
};
