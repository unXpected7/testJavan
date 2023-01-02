const express = require('express');
const personController = require('../controller/personController');

const router = express.Router();


router.get('/api/v1/person', personController.getAllPerson);
router.get('/api/v1/person/:id', personController.getPersonById);
router.get('/api/v1/person/parent/:id', personController.getPersonByParentId);
router.post('/api/v1/person', personController.createPerson);
router.put('/api/v1/person/:id', personController.updatePerson);
router.delete('/api/v1/person/:id', personController.deletePerson);

module.exports = router;