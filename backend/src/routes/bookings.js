const express = require("express");
const router = express.Router();

let bookings = [];

router.post("/", (req, res) => {
    bookings.push(req.body);
    res.json({ message: "Booking created" });
});

router.get("/", (req, res) => {
    res.json(bookings);
});

module.exports = router;