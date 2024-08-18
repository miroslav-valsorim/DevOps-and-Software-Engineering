const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const gameSchema = new Schema({
  text: String
});

const GameModel = mongoose.model('Game', gameSchema);

module.exports = GameModel; 