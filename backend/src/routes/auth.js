const express = require("express");
const jwt = require("jsonwebtoken");
const { SECRET_KEY } = require("../middleware/auth");
const router = express.Router();

router.post("/login", (req, res) => {
    const { email, password } = req.body;

    if (email === "admin@test.com" && password === "password123") {
        const token = jwt.sign({ email }, SECRET_KEY, { expiresIn: "1d" });
        return res.json({ token });
    }

    return res.status(401).json({ message: "Invalid credentials" });
});

module.exports = router;