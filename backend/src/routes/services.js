const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
    res.json([
        { id: 1, name: "Cleaning" },
        { id: 2, name: "Plumbing" }
    ]);
});

module.exports = router;