const jwt = require('jsonwebtoken');
const config = require('../config/auth.config.js');
const db = require('../models');
const User = db.user;

exports.profile = async (req, res) => {
  let token = req.session.token;
  const jwt_token = await jwt.verify(token, config.secret);
  req.userData = jwt_token;
  const user = await User.findByPk(req.userData.id);
  res.status(200).send(user);
};
