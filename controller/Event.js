import Events from "../models/EventModel.js";
import User from "../models/UserModel.js";
import { Op } from "sequelize";

export const getEvents = async (req, res) => {
  try {
    let response;
    if (req.role === "admin") {
      response = await Events.findAll({
        attributes: [
          "uuid",
          "name",
          "price",
          "promotor",
          "jenisevent",
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
      response = await Events.findAll({
        attributes: [
          "uuid",
          "name",
          "price",
          "promotor",
          "jenisevent",
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
        attributes: [
          "uuid",
          "uuid",
          "name",
          "price",
          "promotor",
          "jenisevent",
          "lokasi",
          "linkmaplokasi",
          "tanggal",
          "quantity",
          "deskripsi",
        ],
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
        attributes: [
          "uuid",
          "name",
          "price",
          "promotor",
          "jenisevent",
          "lokasi",
          "linkmaplokasi",
          "tanggal",
          "quantity",
          "deskripsi",
        ],
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
  if (req.file === undefined) {
    return res.status(400).json({ msg: "Tidak ada file yang di upload" });
  }
  const { originalname: gambar, size } = req.file;
  const {
    name,
    price,
    promotor,
    jenisevent,
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
    await Events.create({
      name: name,
      gambar: gambar,
      price: price,
      promotor: promotor,
      jenisevent: jenisevent,
      lokasi: lokasi,
      linkmaplokasi: linkmaplokasi,
      tanggal: tanggal,
      quantity: quantity,
      deskripsi: deskripsi,
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
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!Event) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    const {
      name,
      price,
      promotor,
      jenisevent,
      lokasi,
      linkmaplokasi,
      tanggal,
      quantity,
      deskripsi,
    } = req.body;
    if (user.role === "admin") {
      await Events.update(
        {
          name,
          price,
          promotor,
          jenisevent,
          lokasi,
          linkmaplokasi,
          tanggal,
          quantity,
          deskripsi,
        },
        {
          where: {
            uuid: Event.uuid,
          },
        }
      );
      console.log(req.role);
      return res.status(200).json({ msg: "Event Berhasil di Update" });
    } else {
      if (req.userId !== Event.userId)
        return res.status(403).json({ msg: "Akses Terlarang" });
      await Events.update(
        {
          name,
          price,
          promotor,
          jenisevent,
          lokasi,
          linkmaplokasi,
          tanggal,
          quantity,
          deskripsi,
        },
        {
          where: {
            [Op.and]: [{ uuid: Event.uuid }, { userId: req.userId }],
          },
        }
      );
    }
    return res.status(200).json({ msg: "Event Berhasil di Update" });
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
    const user = await User.findOne({
      where: { uuid: req.session.userId },
    });
    if (!Event) return res.status(404).json({ msg: "Data tidak Ditemukan" });
    if (user.role === "admin") {
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
