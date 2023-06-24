import express from "express";
import {
  getEvents,
  getEventsById,
  createEvent,
  updateEvent,
  deleteEvent,
} from "../controller/Event.js";
import { verifyUser } from "../middleware/AuthUser.js";
import imageFilter from "../middleware/multer.js";

const router = express.Router();

router.get("/events", verifyUser, getEvents);
router.get("/events/:id", verifyUser, getEventsById);
router.post("/events", verifyUser, imageFilter, createEvent);
router.patch("/events/:id", verifyUser, updateEvent);
router.delete("/events/:id", verifyUser, deleteEvent);

export default router;
