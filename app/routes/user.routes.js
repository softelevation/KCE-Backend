const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "Origin, Content-Type, Accept"
    );
    next();
  });
  app.get('/api/profile', [authJwt.verifyToken], controller.profile);
  app.get('/api/category', [authJwt.verifyToken], controller.categoryList);
  app.get('/api/experience', [authJwt.verifyToken], controller.experienceList);
  app.get('/api/experience/:cat_id', [authJwt.verifyToken], controller.experienceList);
  app.post('/api/wishlist', [authJwt.verifyToken], controller.wishlistAdd);
};
