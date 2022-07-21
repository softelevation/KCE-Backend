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
  app.get('/api/categories', [authJwt.verifyToken], controller.allCategories);
  app.post('/api/experiences', [authJwt.verifyToken], controller.getExperience);
};
