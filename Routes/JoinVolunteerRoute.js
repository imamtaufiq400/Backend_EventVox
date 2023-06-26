import express from "express";
import {
  getJoinVolunteer,
  getJoinVolunteerById,
  createJoinVolunteer,
  updateJoinVolunteer,
  deleteJoinVolunteer,
} from "../controller/JoinVolunteer.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/joinvolunteer", verifyUser, getJoinVolunteer);
router.get("/joinvolunteer/:id", verifyUser, getJoinVolunteerById);
router.post("/joinvolunteer", verifyUser, createJoinVolunteer);
router.patch("/joinvolunteer/:id", verifyUser, updateJoinVolunteer);
router.delete("/joinvolunteer/:id", verifyUser, deleteJoinVolunteer);

export default router;
