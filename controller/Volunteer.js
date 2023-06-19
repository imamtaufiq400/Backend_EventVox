import Volunteers from "../models/VolunteerModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";

export const getVolunteers = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await Volunteers.findAll({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Volunteers.findAll({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
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
    res.status(500).json({ msg: error.message });
  }
};

export const getVolunteersById = async (req, res) => {
  try {
    const Volunteer = await Volunteers.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Volunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    let response;
    if (req.role === "admin") {
      response = await Volunteers.findOne({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        where: {
          uuid: Volunteer.uuid,
        },
        // include: [
        //   {
        //     model: User,
        //     attributes: ["name", "email"],
        //   },
        // ],
      });
    } else {
      response = await Volunteers.findOne({
        attributes: ["uuid", "name", "price", "promotor", "lokasi", "tanggal"],
        where: {
          [Op.and]: [{ uuid: Volunteer.uuid }, { userId: req.userId }],
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

export const createVolunteers = async (req, res) => {
  const { name, price, promotor, lokasi, tanggal } = req.body;
  try {
    await Volunteers.create({
      name: name,
      price: price,
      promotor: promotor,
      lokasi: lokasi,
      tanggal: tanggal,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Recruitment Volunteer telah sukses dibuat" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updateVolunteers = async (req, res) => {
  try {
    const Volunteer = await Volunteers.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Volunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const { name, price, promotor, lokasi, tanggal } = req.body;
    if (req.role === "admin") {
      await Volunteers.update(
        { name, price, promotor, lokasi, tanggal },
        {
          where: {
            uuid: Volunteer.uuid,
          },
        }
      );
    } else {
      if (req.userId !== Volunteer.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Volunteers.update(
        { name, price, promotor, lokasi, tanggal },
        {
          where: {
            [Op.and]: [{ uuid: Volunteer.uuid }, { userId: req.userId }],
          },
        }
      );
    }
    res.status(200).json({ msg: "Volunteer Berhasil di Update" });
  } catch (error) {
    // console.log(error);
    res.status(500).json({ msg: error.message });
  }
};

export const deleteVolunteers = async (req, res) => {
  try {
    const Volunteer = await Volunteers.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    if (!Volunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (req.role === "admin") {
      await Volunteers.destroy({
        where: {
          uuid: Volunteer.uuid,
        },
      });
    } else {
      if (req.userId !== Volunteer.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Volunteers.destroy({
        where: {
          [Op.and]: [{ uuid: Volunteer.uuid }, { userId: req.userId }],
        },
      });
    }
    res.status(200).json({ msg: "Volunteer Berhasil di Delete" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ msg: error.message });
  }
};
