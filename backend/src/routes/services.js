const express = require("express");
const { authMiddleware } = require("../middleware/auth");
const router = express.Router();

router.get("/", authMiddleware, (req, res) => {
    res.json([
        { id: 1, name: "Cleaning" },
        { id: 2, name: "Plumbing" }
    ]);
});

module.exports = router;