import Events from "../models/EventModel.js";
import Pemesanan from "../models/PemesananModel.js";
import Ticket from "../models/TicketEventModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";

export const getTicket = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await Ticket.findAll({
        attributes: [
          "uuid",
          "id",
          "kodePemesanan",
          "jumlahTicket",
          "eventName",
          "eventLokasi",
          "eventTanggal",
          "userName",
          "userEmail",
          "userNomorTelepon",
        ],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Ticket.findAll({
        attributes: [
          "uuid",
          "id",
          "kodePemesanan",
          "jumlahTicket",
          "eventName",
          "eventLokasi",
          "eventTanggal",
          "userName",
          "userEmail",
          "userNomorTelepon",
        ],
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

export const getTicketById = async (req, res) => {
  const { id } = req.params;
  try {
    const ticket = await Ticket.findOne({
      where: {
        uuid: id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    console.log(Ticket);
    if (!ticket) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    let response;
    if (user.role === "admin") {
      response = await Ticket.findOne({
        attributes: [
          "uuid",
          "id",
          "kodePemesanan",
          "jumlahTicket",
          "eventName",
          "eventLokasi",
          "eventTanggal",
          "userName",
          "userEmail",
          "userNomorTelepon",
        ],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Ticket.findOne({
        attributes: [
          "uuid",
          "id",
          "kodePemesanan",
          "jumlahTicket",
          "eventName",
          "eventLokasi",
          "eventTanggal",
          "userName",
          "userEmail",
          "userNomorTelepon",
        ],
        where: {
          [Op.and]: [{ uuid: id }, { userId: req.userId }],
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
    // console.log(error);
    res.status(400).json({ msg: error.message });
  }
};

export const createTicket = async (req, res) => {
  const eventId = req.params.eventId;
  const pemesananId = req.params.pemesananId;
  try {
    const event = await Events.findOne({
      where: { uuid: eventId },
    });
    console.log(event);
    const pemesanan = await Pemesanan.findOne({
      where: { kodePemesanan: pemesananId },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    // console.log(user);
    // console.log(event);
    // tambah validasi
    if (!event) return res.status(400).json({ msg: "Data Invalid" });
    await Ticket.create({
      kodePemesanan: pemesanan.kodePemesanan,
      jumlahTicket: pemesanan.jumlahTicket,
      eventName: event.name,
      eventLokasi: event.lokasi,
      eventTanggal: event.tanggal,
      eventId: event.id,
      userName: user.name,
      userEmail: user.email,
      userNomorTelepon: user.nomorTelepon,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Ticket Berhasil di Dapatkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updateTicket = async (req, res) => {
  const { id } = req.params;
  try {
    const ticket = await Ticket.findOne({
      where: {
        uuid: id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!ticket) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const { number } = req.body;
    if (user.role === "admin") {
      await Ticket.update(
        { jumlahTicket },
        {
          where: {
            uuid: id,
          },
        }
      );
      return res.status(200).json({ msg: "Ticket Berhasil di Update" });
    } else {
      if (req.userId !== ticket.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Ticket.update(
        { jumlahTicket },
        {
          where: {
            [Op.and]: [{ uuid: id }, { userId: req.userId }],
          },
        }
      );
    }
    return res.status(200).json({ msg: "Ticket Berhasil di Update" });
  } catch (error) {
    // console.log(error);
    res.status(400).json({ msg: error.message });
  }
};

export const deleteTicket = async (req, res) => {
  try {
    const ticket = await Ticket.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!ticket) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (user.role === "admin") {
      await Ticket.destroy({
        where: {
          uuid: Ticket.uuid,
        },
      });
    } else {
      if (req.userId !== Ticket.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Ticket.destroy({
        where: {
          [Op.and]: [{ uuid: Ticket.uuid }, { userId: req.userId }],
        },
      });
    }
    res.status(200).json({ msg: "Ticket Berhasil di Delete" });
  } catch (error) {
    console.log(error);
    res.status(400).json({ msg: error.message });
  }
};
