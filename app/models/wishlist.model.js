module.exports = (sequelize, Sequelize) => {
  const Wishlist = sequelize.define('wishlist', {
    country: {
      type: Sequelize.STRING,
    },
    city: {
      type: Sequelize.STRING,
    },
    rating: {
      type: Sequelize.STRING,
    },
    image: {
      type: Sequelize.STRING,
      allowNull: true,
    },
  });

  return Wishlist;
};
