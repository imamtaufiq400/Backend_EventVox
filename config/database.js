import { Sequelize } from "sequelize";

const db = new Sequelize("auth_db", "root", "", {
  host: "Localhost",
  dialect: "mysql",
});

export default db;
