const express = require("express");
const { authMiddleware } = require("../middleware/auth");
const router = express.Router();

let bookings = [];

router.post("/", authMiddleware, (req, res) => {
    bookings.push(req.body);
    res.json({ message: "Booking created" });
});

router.get("/", authMiddleware, (req, res) => {
    res.json(bookings);
});

module.exports = router;