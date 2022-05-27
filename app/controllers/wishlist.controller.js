const jwt = require('jsonwebtoken');
const config = require('../config/auth.config.js');
const db = require('../models');
const Wishlist = db.wishlist;

exports.getWishlist = async (req, res) => {
  const response = await Wishlist.findAll();
  console.log('response: ', response);
  res.status(200).send(response);
};
exports.addWishlist = async (req, res) => {
  try {
    const user = await Wishlist.create({
      country: req.body.country,
      city: req.body.city,
      image: req.body.image,
    });

    res.send(user);
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
};
