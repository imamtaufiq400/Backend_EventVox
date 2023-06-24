import express from "express";
import {
  getVolunteers,
  getVolunteersById,
  createVolunteers,
  updateVolunteers,
  deleteVolunteers,
} from "../controller/Volunteer.js";
import { verifyUser } from "../middleware/AuthUser.js";
import imageFilter from "../middleware/multer.js";

const router = express.Router();

router.get("/volunteers", verifyUser, getVolunteers);
router.get("/volunteers/:id", verifyUser, getVolunteersById);
router.post("/volunteers", verifyUser, imageFilter, createVolunteers);
router.patch("/volunteers/:id", verifyUser, updateVolunteers);
router.delete("/volunteers/:id", verifyUser, deleteVolunteers);

export default router;
