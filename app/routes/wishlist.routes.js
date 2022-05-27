const { authJwt } = require('../middleware');
const controller = require('../controllers/wishlist.controller.js');

module.exports = function (app) {
  app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');
    next();
  });
  app.get('/api/wishlist', [authJwt.verifyToken], controller.getWishlist);
  app.post('/api/wishlist', [authJwt.verifyToken], controller.addWishlist);
};
