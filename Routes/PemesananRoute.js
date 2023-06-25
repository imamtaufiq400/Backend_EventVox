import express from "express";
import {
  getPemesanan,
  getPemesananById,
  createPemesanan,
  updatePemesanan,
  deletePemesanan,
} from "../controller/Pemesanan.js";
import { verifyUser } from "../middleware/AuthUser.js";
import imageFilter from "../middleware/multerPembayaran.js";

const router = express.Router();

router.get("/pemesanan", verifyUser, getPemesanan);
router.get("/pemesanan/:id", verifyUser, getPemesananById);
router.post("/events/:id/pemesanan", verifyUser, imageFilter, createPemesanan);
router.patch("/pemesanan/:id", verifyUser, updatePemesanan);
router.delete("/pemesanan/:id", verifyUser, deletePemesanan);

export default router;
