module.exports = (sequelize, Sequelize) => {
  const Role = sequelize.define('categories', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    name: {
      type: Sequelize.STRING(111),
    },
  });
  return Role;
};
