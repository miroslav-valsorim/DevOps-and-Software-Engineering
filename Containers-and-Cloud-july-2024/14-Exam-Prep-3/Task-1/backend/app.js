const fs = require('fs');
const path = require('path');

const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const morgan = require('morgan');

const Game = require('./models/game');

const app = express();

const accessLogStream = fs.createWriteStream(
  path.join(__dirname, 'logs', 'access.log'),
  { flags: 'a' }
);

app.use(morgan('combined', { stream: accessLogStream }));

app.use(bodyParser.json());

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  next();
});

app.get('/games', async (req, res) => {
  console.log('TRYING TO FETCH GAMES');
  try {
    const games = await Game.find();
    res.status(200).json({
      games: games.map((game) => ({
        id: game.id,
        text: game.text,
      })),
    });
    console.log('FETCHED GAMES');
  } catch (err) {
    console.error('ERROR FETCHING GAMES');
    console.error(err.message);
    res.status(500).json({ message: 'Failed to load games.' });
  }
});

app.post('/games', async (req, res) => {
  console.log('TRYING TO STORE GAMES');
  const gameText = req.body.text;

  if (!gameText || gameText.trim().length === 0) {
    console.log('INVALID INPUT - NO TEXT');
    return res.status(422).json({ message: 'Invalid game name.' });
  }

  const game = new Game({
    text: gameText,
  });

  try {
    await game.save();
    res
      .status(201)
      .json({ message: 'Game saved', game: { id: game.id, text: gameText } });
    console.log('STORED NEW GAME');
  } catch (err) {
    console.error('ERROR FETCHING GAME');
    console.error(err.message);
    res.status(500).json({ message: 'Failed to save game.' });
  }
});

app.delete('/games/:id', async (req, res) => {
  console.log('TRYING TO DELETE GAME');
  try {
    await GAME.deleteOne({ _id: req.params.id });
    res.status(200).json({ message: 'Deleted game!' });
    console.log('DELETED GAME');
  } catch (err) {
    console.error('ERROR FETCHING GAMES');
    console.error(err.message);
    res.status(500).json({ message: 'Failed to delete game.' });
  }
});

mongoose.connect(
  `mongodb://max:secret@mongodb:27017/list-games?authSource=admin`,
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  },
  (err) => {
    if (err) {
      console.error('FAILED TO CONNECT TO MONGODB');
      console.error(err);
    } else {
      console.log('CONNECTED TO MONGODB!!');
      app.listen(80);
    }
  }
);
