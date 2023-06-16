import Events from "../models/EventModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";

export const getEvents = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await Events.findAll({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Events.findAll({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        where: {
          id: req.session.userId,
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
    res.status(500).json({ msg: error.message });
  }
};

export const getEventsById = async (req, res) => {
  try {
    const Event = await Events.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Event) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    let response;
    if (req.role === "admin") {
      response = await Events.findOne({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        where: {
          uuid: Event.uuid,
        },
        // include: [
        //   {
        //     model: User,
        //     attributes: ["name", "email"],
        //   },
        // ],
      });
    } else {
      response = await Events.findOne({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        where: {
          [Op.and]: [{ uuid: Event.uuid }, { userId: req.userId }],
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
    res.status(500).json({ msg: error.message });
  }
};

export const createEvent = async (req, res) => {
  const { name, price, promotor, lokasi, tanggal } = req.body;
  try {
    await Events.create({
      name: name,
      price: price,
      promotor: promotor,
      lokasi: lokasi,
      tanggal: tanggal,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Event telah sukses dibuat" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updateEvent = async (req, res) => {
  try {
    const Event = await Events.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Event) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const { name, price, promotor, lokasi, tanggal } = req.body;
    if (req.role === "admin") {
      await Events.update(
        { name, price, promotor, lokasi, tanggal },
        {
          where: {
            uuid: Event.uuid,
          },
        }
      );
    } else {
      if (req.userId !== Event.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Events.update(
        { name, price, promotor, lokasi, tanggal },
        {
          where: {
            [Op.and]: [{ uuid: Event.uuid }, { userId: req.userId }],
          },
        }
      );
    }
    res.status(200).json({ msg: "Event Berhasil di Update" });
  } catch (error) {
    // console.log(error);
    res.status(500).json({ msg: error.message });
  }
};

export const deleteEvent = async (req, res) => {
  try {
    const Event = await Events.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Event) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (req.role === "admin") {
      await Events.destroy({
        where: {
          uuid: Event.uuid,
        },
      });
    } else {
      if (req.userId !== Event.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Events.destroy({
        where: {
          [Op.and]: [{ uuid: Event.uuid }, { userId: req.userId }],
        },
      });
    }
    res.status(200).json({ msg: "Event Berhasil di Delete" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ msg: error.message });
  }
};
