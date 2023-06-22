import express from "express";
import {
  getTicket,
  getTicketById,
  createTicket,
  updateTicket,
  deleteTicket,
} from "../controller/TicketEvent.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/ticket", verifyUser, getTicket);
router.get("/events/:id/ticket/:id", verifyUser, getTicketById);
router.post("/events/:id/ticket", verifyUser, createTicket);
router.patch("/events/:id/ticket/:id", verifyUser, updateTicket);
router.delete("/events/:id/ticket/:id", verifyUser, deleteTicket);

export default router;
