const resData = require("../helper/response");

module.exports = {
  getAllProduct: async (req, res, next) => {
    /*
  #swagger.tags = ['Product']
*/
    try {
      const result = await req.productUC.getAllProduct();

      return res.status(result.statusCode).json(resData.success(result.data));
    } catch (error) {
      next(error);
    }
  },

  getProductById: async (req, res, next) => {
       /*
  #swagger.tags = ['Product']
*/
    try {
      const { id } = req.params;

      const result = await req.productUC.getProductById(id);

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
