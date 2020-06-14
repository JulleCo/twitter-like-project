const express = require("express");
const tweetController = require("../controllers/tweet");

const tweetRouter = express.Router();

tweetRouter.get("/", tweetController.findAll);

module.exports = tweetRouter;