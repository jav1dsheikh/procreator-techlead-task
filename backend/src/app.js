const express = require("express");
const app = express();

app.use(express.json());

app.use("/auth", require("./routes/auth"));
app.use("/services", require("./routes/services"));
app.use("/bookings", require("./routes/bookings"));

app.listen(3000, () => console.log("Server running on port 3000"));