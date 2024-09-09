const mongoose = require("mongoose");
const playerSchema = require("./players");

const gameSchema = new mongoose.Schema({
  words: [
    // for each we have to check is we are typing it correct
    {
      type: String,
    },
  ],
  players: [playerSchema],
  isJoin: {
    type: Boolean,
    default: true,
  },
  isOver: {
    type: Boolean,
    default: false,
  },

  startTime: {
    type: Number,
  },
});

const gameModel = mongoose.model("Game", gameSchema);

module.exports = gameModel;
