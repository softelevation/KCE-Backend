module.exports = (sequelize, Sequelize) => {
  const Experience = sequelize.define('experiences', {
    category_id: {
      type: Sequelize.INTEGER,
    },
    title: {
      type: Sequelize.STRING,
    },
    image: {
      type: Sequelize.STRING,
    },
    description: {
      type: Sequelize.TEXT,
      allowNull: true,
    },
  });

  return Experience;
};
