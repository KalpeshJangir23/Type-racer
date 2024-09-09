const mongoose = require("mongoose");

const playerSchema = new mongoose.Schema({
  nickname: {
    type: String,
  },
  currentWordIndex: {
    // to now which player is no which word
    type: Number,
    default: 0, // everyPLayer start from zero
  },
  WPM: {
    type: Number,
    default: -1,
  },
  socketID: {
    type: String,
  },
  isPartyLeader: {
    type: Boolean,
    default: false,
  },
});

module.exports = playerSchema;
