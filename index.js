import express from "express";
import cors from "cors";
import session from "express-session";
import dotenv from "dotenv";
import db from "./config/database.js";
import SequelizeStore from "connect-session-sequelize";
import UserRoute from "./Routes/UserRoute.js";
import EventRoute from "./Routes/EventRoute.js";
import AuthRoute from "./Routes/AuthRoute.js";
import VolunteerRoute from "./Routes/VolunteerRoute.js";
import TicketEventRoute from "./Routes/TicketEventRoute.js";
dotenv.config();

const app = express();

const sessionStore = SequelizeStore(session.Store);

const store = new sessionStore({
  db: db,
});
// (async () => {
//   await db.sync();
// })();

app.use(
  session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
      secure: "auto",
    },
  })
);

app.use(
  cors({
    credentials: true,
    origin: "http://localhost:5173",
  })
);
app.use(express.json());
app.use(UserRoute);
app.use(EventRoute);
app.use(AuthRoute);
app.use(VolunteerRoute);
app.use(TicketEventRoute);

// store.sync();

app.listen(process.env.APP_PORT, () => {
  console.log("Server up and running.....");
});
