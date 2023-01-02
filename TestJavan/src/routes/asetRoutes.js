const express = require('express');
const asetController = require('../controller/asetController');

const router = express.Router();


router.get('/api/v1/aset/:id', asetController.getAsetByPersonId);
router.post('/api/v1/aset', asetController.createAset);
router.delete('/api/v1/aset/detail/:id', asetController.deletAsetDetail);


module.exports = router;