module.exports = (sequelize, Sequelize) => {
  const Role = sequelize.define('experiences', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    category_id: {
      type: Sequelize.INTEGER,
    },
    title: {
      type: Sequelize.STRING(111),
    },
    image: {
      type: Sequelize.STRING(111),
    },
    description: {
      type: Sequelize.TEXT,
    },
	rating: {
      type: Sequelize.INTEGER,
    },
	distance: {
      type: Sequelize.STRING(111),
    },
	location: {
      type: Sequelize.STRING(255),
    },
	country: {
      type: Sequelize.STRING(111),
    },
  });
  return Role;
};
