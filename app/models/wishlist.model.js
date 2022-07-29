module.exports = (sequelize, Sequelize) => {
  const Wishlist = sequelize.define('wishlist', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    user_id: {
      type: Sequelize.INTEGER,
    },
    experience_id: {
      type: Sequelize.INTEGER,
    },
  });

  return Wishlist;
};
