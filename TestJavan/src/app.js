require("dotenv").config();
const express = require('express')
const swaggerUi = require('swagger-ui-express');
const serverError = require('./middleware/serverError');

const app = express()

const personRouter = require('./routes/personRoutes')
const productsRouter = require('./routes/productRoutes')
const asetRouter = require('./routes/asetRoutes')

const PersonRepo = require('./repository/personRepo')
const ProductRepo = require('./repository/productRepo')
const AsetRepo = require('./repository/asetRepo')
const AsetDetailRepo = require('./repository/asetDetailsRepo')

const PersonUseCase = require('./usecase/personUseCase')
const ProductUseCase = require('./usecase/productUseCase')
const AsetUseCase = require('./usecase/asetUseCase')

const personUC = new PersonUseCase(new PersonRepo(), new AsetRepo(), new AsetDetailRepo(), new ProductRepo())
const productUC = new ProductUseCase(new ProductRepo())
const asetUC = new AsetUseCase(new AsetRepo(), new AsetDetailRepo(), new PersonRepo(), new ProductRepo())



app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.get('/',(req, res) => {
    res.json('hello Javan')
})

app.use((req, res, next) => {
    req.personUC = personUC;
    req.productUC = productUC;
    req.asetUC = asetUC;

    next();
  });

app.use('/', personRouter);
app.use('/', productsRouter);
app.use('/', asetRouter);

app.use(serverError);

const swaggerDocument = require('./docs/docs.json');

app.use(
  '/docs',
  swaggerUi.serveFiles(swaggerDocument),
  swaggerUi.setup(swaggerDocument),
);
module.exports = app;