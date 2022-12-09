const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const cors = require("cors");
const documentRouter = require("./routes/document");
const PORT = process.env.PORT | 3001;

const app = express();

app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);
// const DB =
//   "mongodb+srv://sadid:123456abc@cluster0.uisqkkk.mongodb.net/?retryWrites=true&w=majority";
const DB = "mongodb://127.0.0.1:27017/docClone";

mongoose
  .connect(DB)
  .then(() => {
    console.log(`Connection Successful`);
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
  console.log("Hey ");
});
