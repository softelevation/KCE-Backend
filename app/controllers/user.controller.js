const jwt = require('jsonwebtoken');
const {
  ReasonPhrases,
  StatusCodes,
  getReasonPhrase,
  getStatusCode,
} = require('http-status-codes');
const config = require('../config/auth.config.js');
const db = require('../models');
const { obj_multi_select } = require('../Helpers/index.js');
const User = db.user;
const Category = db.Category;
const Experience = db.Experience;

exports.profile = async (req, res) => {
  try {
    let token = req.headers.authorization;
    const jwt_token = await jwt.verify(token, config.secret);
    req.userData = jwt_token;
    const response = await User.findByPk(req.userData.id);
    return res.status(StatusCodes.OK).send(obj_multi_select(response, ['id', 'first_name', 'last_name', 'email']));
  } catch (err) {
    return res.status(200).json('Unauthorized!');
  }
};

exports.allCategories = async (req, res) => {
  try {
    const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
    const response = await Category.findAll();
    return res.status(StatusCodes.OK).send(response);
  } catch (err) {
    return res.status(200).json('Unauthorized!');
  }
};

exports.getExperience = async (req, res) => {
  try {
    const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
    let inputData = obj_multi_select(req.body, ['category_id']);
    console.log(inputData);
    const response = await Experience.findAll();
    return res.status(StatusCodes.OK).send(response);
  } catch (err) {
    return res.status(200).json('Unauthorized!');
  }
};
