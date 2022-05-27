const jwt = require('jsonwebtoken');
const config = require('../config/auth.config.js');
const db = require('../models');
const User = db.user;

exports.profile = async (req, res) => {
  let token =
    req.headers.authorization && req.headers.authorization.split(' ')[1];
  const jwt_token = await jwt.verify(token, config.secret);
  req.userData = jwt_token;
  const response = await User.findByPk(req.userData.id);
  res.status(200).send({
    id: response.id,
    first_name: response.first_name,
    last_name: response.last_name,
    email: response.email,
  });
};
