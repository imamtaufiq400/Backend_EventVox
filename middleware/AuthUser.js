import User from "../models/UserModel.js";

export const verifyUser = async (req, res, next) => {
  if (!req.session.userId) {
    return res.status(401).json({ msg: " Mohon Login Ke Akun Anda" });
  }
  const user = await User.findOne({
    where: {
      uuid: req.session.userId,
    },
  });
  if (!user) return res.status(404).json({ msg: "User tidak ditemukan" });
  req.userId = user.id;
  req.id = user.id;
  next();
};

export const adminOnly = async (req, res, next) => {
  const user = await User.findOne({
    where: {
      uuid: req.session.userId,
    },
  });
  if (!user) return res.status(404).json({ msg: "User tidak ditemukan" });
  if (user.role !== "admin")
    return res.status(403).json({ msg: "Akses Terlarang" });
  next();
};
