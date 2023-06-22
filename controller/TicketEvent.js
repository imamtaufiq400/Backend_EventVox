import Events from "../models/EventModel.js";
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
          "number",
          "eventName",
          "eventLokasi",
          "eventTanggal",
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
          "number",
          "eventName",
          "eventLokasi",
          "eventTanggal",
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
  console.log(req.params);
  const { id } = req.params;
  try {
    const ticket = await Ticket.findOne({
      where: {
        uuid: id,
      },
    });
    if (!ticket) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    let response;
    if (req.role === "admin") {
      response = await Ticket.findOne({
        attributes: ["uuid", "number"],
        where: {
          uuid: Ticket.uuid,
        },
        include: [
          {
            model: User,
            attributes: ["name", "email"],
            model: Events,
            attributes: ["name", "promotor", "lokasi", "tanggal"],
          },
        ],
      });
    } else {
      response = await Ticket.findOne({
        attributes: ["uuid", "number"],
        where: {
          [Op.and]: [{ uuid: Ticket.uuid }, { userId: req.userId }],
        },
        include: [
          {
            model: User,
            attributes: ["name", "email"],
            model: Events,
            attributes: ["name", "promotor", "lokasi", "tanggal"],
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

export const createTicket = async (req, res) => {
  console.log(req.params);
  const { number } = req.body;
  const { id } = req.params;
  try {
    const event = await Events.findOne({
      where: { uuid: id },
    });
    console.log(event);
    // tambah validasi
    if (!event) return res.status(400).json({ msg: "Data Invalid" });
    await Ticket.create({
      number: number,
      eventName: event.name,
      eventLokasi: event.lokasi,
      eventTanggal: event.tanggal,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Ticket Berhasil di Dapatkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updateTicket = async (req, res) => {
  console.log(req.params);
  const { id } = req.params;
  try {
    const ticket = await Ticket.findOne({
      where: {
        uuid: id,
      },
    });
    if (!ticket) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const { number } = req.body;
    if (req.role === "admin") {
      await Ticket.update(
        { number },
        {
          where: {
            uuid: id,
          },
        }
      );
    } else {
      if (req.userId !== Ticket.id);
      console.log(Ticket.id);
      return res.status(403).json({ msg: "Akses Terlarang" });
      await Ticket.update(
        { number },
        {
          where: {
            [Op.and]: [{ uuid: id }, { userId: req.userId }],
          },
        }
      );
    }
    res.status(200).json({ msg: "Ticket Berhasil di Update" });
  } catch (error) {
    // console.log(error);
    res.status(400).json({ msg: error.message });
  }
};

export const deleteTicket = async (req, res) => {
  try {
    const Event = await Ticket.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Ticket) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (req.role === "admin") {
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
