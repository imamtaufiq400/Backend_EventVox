import Volunteers from "../models/VolunteerModel.js";
import User from "../models/UserModel.js";
import JoinVolunteer from "../models/JoinVolunteerModel.js";
import { Op } from "sequelize";

export const getJoinVolunteer = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await JoinVolunteer.findAll({
        attributes: [
          "uuid",
          "namaLengkap",
          "jenisKelamin",
          "umur",
          "email",
          "alamatLengkap",
          "nomorTelepon",
          "divisi",
        ],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await JoinVolunteer.findAll({
        attributes: [
          "uuid",
          "namaLengkap",
          "jenisKelamin",
          "umur",
          "email",
          "alamatLengkap",
          "nomorTelepon",
          "divisi",
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

export const getJoinVolunteerById = async (req, res) => {
  const { id } = req.params;
  try {
    const joinvolunteer = await JoinVolunteer.findOne({
      where: {
        uuid: id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!joinvolunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    let response;
    if (user.role === "admin") {
      response = await JoinVolunteer.findOne({
        attributes: [
          "uuid",
          "namaLengkap",
          "jenisKelamin",
          "umur",
          "email",
          "alamatLengkap",
          "nomorTelepon",
          "divisi",
        ],
        where: {
          uuid: id,
        },
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await JoinVolunteer.findOne({
        attributes: [
          "uuid",
          "namaLengkap",
          "jenisKelamin",
          "umur",
          "email",
          "alamatLengkap",
          "nomorTelepon",
          "divisi",
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
    console.log(error);
    res.status(400).json({ msg: error.message });
  }
};

export const createJoinVolunteer = async (req, res) => {
  const {
    namaLengkap,
    jenisKelamin,
    umur,
    email,
    nomorTelepon,
    alamatLengkap,
    divisi,
  } = req.body;
  try {
    // tambah validasi
    await JoinVolunteer.create({
      namaLengkap: namaLengkap,
      jenisKelamin: jenisKelamin,
      umur: umur,
      email: email,
      nomorTelepon: nomorTelepon,
      alamatLengkap: alamatLengkap,
      divisi: divisi,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Berhasil Daftar Volunteer" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updateJoinVolunteer = async (req, res) => {
  const { id } = req.params;
  try {
    const joinvolunteer = await JoinVolunteer.findOne({
      where: {
        uuid: id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!joinvolunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const {
      namaLengkap,
      jenisKelamin,
      umur,
      email,
      nomorTelepon,
      alamatLengkap,
      divisi,
    } = req.body;
    if (user.role === "admin") {
      await Pemesanan.update(
        {
          namaLengkap,
          jenisKelamin,
          umur,
          email,
          nomorTelepon,
          alamatLengkap,
          divisi,
        },
        {
          where: {
            uuid: id,
          },
        }
      );
      return res.status(200).json({ msg: "Daftar Volunteer telah di update" });
    } else {
      if (joinvolunteer.userId !== req.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await JoinVolunteer.update(
        {
          namaLengkap,
          jenisKelamin,
          umur,
          email,
          nomorTelepon,
          alamatLengkap,
          divisi,
        },
        {
          where: {
            [Op.and]: [{ uuid: id }, { userId: req.userId }],
          },
        }
      );
    }
    return res.status(200).json({ msg: "Daftar Volunteer telah di Update" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const deleteJoinVolunteer = async (req, res) => {
  try {
    const joinvolunteer = await JoinVolunteer.findOne({
      where: {
        uuid: req.params.id,
      },
    });
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!joinvolunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (user.role === "admin") {
      await JoinVolunteer.destroy({
        where: {
          uuid: req.params.id,
        },
      });
    } else {
      if (req.userId !== joinvolunteer.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await JoinVolunteer.destroy({
        where: {
          [Op.and]: [{ uuid: req.params.id }, { userId: req.userId }],
        },
      });
    }
    res.status(200).json({ msg: "Daftar Volunteer berhasil di Delete" });
  } catch (error) {
    console.log(error);
    res.status(400).json({ msg: error.message });
  }
};
