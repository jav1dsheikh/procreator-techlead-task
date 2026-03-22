const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json());

app.use("/auth", require("./routes/auth"));
app.use("/services", require("./routes/services"));
app.use("/bookings", require("./routes/bookings"));

app.listen(3000, "0.0.0.0", () => console.log("Server running on port 3000"));