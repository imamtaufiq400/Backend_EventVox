import Events from "../models/EventModel.js";
import Ticket from "../models/TicketEventModel.js";
import User from "../models/UserModel.js";
import Pemesanan from "../models/PemesananModel.js";
import { Op } from "sequelize";

export const getPemesanan = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await Pemesanan.findAll({
        attributes: ["kodePemesanan", "eventId", "eventPrice", "jumlahTicket"],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Pemesanan.findAll({
        attributes: ["kodePemesanan", "eventId", "eventPrice", "jumlahTicket"],
        where: {
          userId: req.session.me,
        },
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    }
    res.status(200).json(response);
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const getPemesananById = async (req, res) => {
  const { id } = req.params;
  try {
    const pemesanan = await Pemesanan.findOne({
      where: {
        kodePemesanan: id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!pemesanan)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    let response;
    if (user.role === "admin") {
      response = await Pemesanan.findOne({
        attributes: ["kodePemesanan", "eventId", "eventPrice", "jumlahTicket"],
        where: {
          kodePemesanan: id,
        },
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Pemesanan.findOne({
        attributes: ["kodePemesanan", "eventId", "eventPrice", "jumlahTicket"],
        where: {
          [Op.and]: [{ kodePemesanan: id }, { userId: req.userId }],
        },
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    }
    res.status(200).json(response);
  } catch (error) {
    console.log(error);
    res.status(400).json({ msg: error.message });
  }
};

export const createPemesanan = async (req, res) => {
  if (req.file === undefined) {
    return res.status(400).json({ msg: "Tidak ada file yang di upload" });
  }
  const { originalname: buktiPembayaran, size } = req.file;
  const { jumlahTicket } = req.body;
  const { id } = req.params;
  const fileSize = size;
  const imageUrl = `${process.cwd()}\\images\\${buktiPembayaran}`;
  if (fileSize > 5000000) {
    return res
      .status(422)
      .json({ msg: "Gambar harus berukuran kurang dari 5MB" });
  }
  try {
    const event = await Events.findOne({
      where: { uuid: id },
    });
    // tambah validasi
    if (!event) return res.status(400).json({ msg: "Data Invalid" });
    const totalPrice = jumlahTicket * event.price;
    console.log(totalPrice);
    await Pemesanan.create({
      jumlahTicket: jumlahTicket,
      buktiPembayaran: buktiPembayaran,
      eventId: event.id,
      eventPrice: event.price,
      totalPrice: totalPrice,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Pemesanan Berhasil di Dapatkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updatePemesanan = async (req, res) => {
  const { id } = req.params;
  try {
    const pemesanan = await Pemesanan.findOne({
      where: {
        kodePemesanan: id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!pemesanan)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const { jumlahTicket } = req.body;
    if (user.role === "admin") {
      await Pemesanan.update(
        { jumlahTicket },
        {
          where: {
            kodePemesanan: id,
          },
        }
      );
      return res.status(200).json({ msg: "Pemesanan Berhasil di Update" });
    } else {
      if (pemesanan.userId !== req.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Pemesanan.update(
        { jumlahTicket },
        {
          where: {
            [Op.and]: [{ kodePemesanan: id }, { userId: req.userId }],
          },
        }
      );
    }
    return res.status(200).json({ msg: "Pemesanan Berhasil di Update" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const deletePemesanan = async (req, res) => {
  try {
    const pemesanan = await Pemesanan.findOne({
      where: {
        kodePemesanan: req.params.id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!pemesanan)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (user.role === "admin") {
      await Ticket.destroy({
        where: {
          kodePemesanan: req.params.id,
        },
      });
    } else {
      if (req.userId !== pemesanan.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Ticket.destroy({
        where: {
          [Op.and]: [{ kodePemesanan: req.params.id }, { userId: req.userId }],
        },
      });
    }
    res.status(200).json({ msg: "Ticket Berhasil di Delete" });
  } catch (error) {
    console.log(error);
    res.status(400).json({ msg: error.message });
  }
};
