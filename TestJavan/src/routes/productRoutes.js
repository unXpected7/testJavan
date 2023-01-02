const express = require('express');
const productController = require('../controller/productController');

const router = express.Router();


router.get('/api/v1/product', productController.getAllProduct);
router.get('/api/v1/product/:id', productController.getProductById);


module.exports = router;