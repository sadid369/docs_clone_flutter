const express = require("express");
const User = require("../models/user");
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, profilePic } = req.body;
    //email already exists ?
    let user = await User.findOne({ email: email });
    if (!user) {
      user = new User({
        name,
        email,
        profilePic,
      });
      user = await user.save();
    }
    const token = jwt.sign({ id: user._id });
    res.json({ user, token });
    //store data
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
