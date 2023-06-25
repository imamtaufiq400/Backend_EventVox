import Volunteers from "../models/VolunteerModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";

export const getVolunteers = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await Volunteers.findAll({
        attributes: [
          "uuid",
          "name",
          "promotor",
          "jeniskegiatan",
          "lokasi",
          "linkmaplokasi",
          "tanggal",
          "quantity",
          "deskripsi",
        ],
        include: [
          {
            model: User,
            attributes: ["name", "email"],
          },
        ],
      });
    } else {
      response = await Volunteers.findAll({
        attributes: [
          "uuid",
          "name",
          "promotor",
          "jeniskegiatan",
          "lokasi",
          "linkmaplokasi",
          "tanggal",
          "quantity",
          "deskripsi",
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
        attributes: [
          "uuid",
          "name",
          "promotor",
          "jeniskegiatan",
          "lokasi",
          "linkmaplokasi",
          "tanggal",
          "quantity",
          "deskripsi",
        ],
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
        attributes: [
          "uuid",
          "name",
          "promotor",
          "jeniskegiatan",
          "lokasi",
          "linkmaplokasi",
          "tanggal",
          "quantity",
          "deskripsi",
        ],
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
  if (req.file === undefined) {
    return res.status(400).json({ msg: "Tidak ada file yang di upload" });
  }
  const { originalname: gambar, size } = req.file;
  const {
    name,
    promotor,
    jeniskegiatan,
    lokasi,
    linkmaplokasi,
    tanggal,
    quantity,
    deskripsi,
  } = req.body;
  const fileSize = size;
  const imageUrl = `${process.cwd()}\\images\\${gambar}`;
  if (fileSize > 5000000) {
    return res
      .status(422)
      .json({ msg: "Gambar harus berukuran kurang dari 5MB" });
  }
  try {
    await Volunteers.create({
      name: name,
      gambar: gambar,
      jeniskegiatan: jeniskegiatan,
      promotor: promotor,
      lokasi: lokasi,
      linkmaplokasi: linkmaplokasi,
      tanggal: tanggal,
      quantity: quantity,
      deskripsi: deskripsi,
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
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!Volunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const {
      name,
      promotor,
      jeniskegiatan,
      lokasi,
      linkmaplokasi,
      tanggal,
      quantity,
      deskripsi,
    } = req.body;
    if (user.role === "admin") {
      await Volunteers.update(
        {
          name,
          promotor,
          jeniskegiatan,
          lokasi,
          linkmaplokasi,
          tanggal,
          quantity,
          deskripsi,
        },
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
        {
          name,
          promotor,
          jeniskegiatan,
          lokasi,
          linkmaplokasi,
          tanggal,
          quantity,
          deskripsi,
        },
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
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!Volunteer)
      return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (user.role === "admin") {
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
