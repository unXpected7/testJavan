"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert(
      "People",
      [
        {
          name: "Bani",
          gender: "male",
          parentId: null,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Budi",
          gender: "male",
          parentId: 1,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Nida",
          gender: "male",
          parentId: 1,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Andi",
          gender: "male",
          parentId: 1,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Sigit",
          gender: "male",
          parentId: 1,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Hari",
          gender: "male",
          parentId: 2,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Siti",
          gender: "female",
          parentId: 2,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Bila",
          gender: "female",
          parentId: 3,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Lesti",
          gender: "female",
          parentId: 3,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Diki",
          gender: "male",
          parentId: 4,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Doni",
          gender: "male",
          parentId: 5,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: "Toni",
          gender: "male",
          parentId: 5,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      ],
      {}
    );
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("People", null, {});
  },
};
