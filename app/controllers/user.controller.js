const jwt = require('jsonwebtoken');
const {
  ReasonPhrases,
  StatusCodes,
  getReasonPhrase,
  getStatusCode,
} = require('http-status-codes');
const config = require('../config/auth.config.js');
const { obj_multi_select, filter_by_id, check_obj, merge_object } = require('../Helpers/index.js');
const db = require('../models');
var { Op } = require('sequelize');
const User = db.user;
const Category = db.category;
const Experience = db.experience;
const Wishlist = db.wishlist;

exports.profile = async (req, res) => {
  const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
  req.userData = jwt_token;
  const response = await User.findByPk(req.userData.id);
  res.status(200).send(obj_multi_select(response, ['id', 'first_name', 'last_name', 'email']));
};

exports.categoryList = async (req, res) => {
  const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
  const response = await Category.findAll({
    attributes: ['name'],
    raw : true
  });
  res.status(200).send(filter_by_id(response, 'name'));
};

exports.experienceList = async (req, res) => {
  const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
  let order_by = ['id', 'DESC'];
  let inputData = obj_multi_select(req.query, ['country', 'rating']);
  let response = [];
  const check_Wishlist = await Wishlist.findAll({
    where: {
      user_id: jwt_token.id,
    },
    attributes: ['experience_id'],
    raw: true,
  });
  let wishlist = filter_by_id(check_Wishlist, 'experience_id');
  const all_experiences = await Experience.findAll({
    where: inputData,
    order: [order_by],
  });
  for (let all_experience of all_experiences) {
    all_experience.setDataValue('is_wishlist', 0);
    if (wishlist.includes(all_experience.id)) {
      all_experience.setDataValue('is_wishlist', 1);
    }
    response.push(all_experience);
  }
  res.status(200).send(response);
};

exports.myExperienceList = async (req, res) => {
  const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
  let order_by = ['id', 'DESC'];
  let inputData = obj_multi_select(req.query, ['country', 'rating']);
  const check_Wishlist = await Wishlist.findAll({
    where: {
      user_id: jwt_token.id,
    },
    attributes: ['experience_id'],
    raw: true,
  });
  let wishlist = filter_by_id(check_Wishlist, 'experience_id');
  let where_query = {
      id: {
        [Op.in]: wishlist,
      },
    }
  where_query = merge_object(where_query, inputData);
  const response = await Experience.findAll({
    where: where_query,
    order: [order_by],
  });
  res.status(200).send(response);
};

exports.wishlistAdd = async (req, res) => {
  try {
    const jwt_token = await jwt.verify(
      req.headers.authorization,
      config.secret,
    );
    let message = '';
    let inputData = obj_multi_select(req.body, ['experience_id', 'action']);
    if (check_obj(inputData, 'action') && inputData.action === 'delete') {
      message = 'Wishlist remove successfully!';
      Wishlist.destroy({
        where: {
          user_id: jwt_token.id,
          experience_id: inputData.experience_id,
        },
      });
    } else {
      message = 'Wishlist add successfully!';
      Wishlist.create({
        user_id: jwt_token.id,
        experience_id: inputData.experience_id,
      });
    }
    return res.send({ message: message });
  } catch (error) {
    return res.status(500).send({ message: error.message });
  }
};

exports.wishlistGet = async (req, res) => {
  try {
    const jwt_token = await jwt.verify(req.headers.authorization, config.secret);
    const wishlist = await Wishlist.findAll({
      where: {
        user_id: jwt_token.id,
      },
      // attributes: ['experience_id'],
      raw: true,
    });
    return res.send(wishlist);
  } catch (error) {
    return res.status(500).send({ message: error.message });
  }
};

