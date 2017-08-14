var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');
var squel = require("squel");

var app = express();
var handlebars = require('express-handlebars').create({
  defaultLayout: 'main'
});
app.use(bodyParser.urlencoded({
  extended: false
}))
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', 3000);
app.use(express.static('public'));

//Handlebars helper function [https://stackoverflow.com/questions/22103989/adding-offset-to-index-when-looping-through-items-in-handlebars]
var Handlebars = require('handlebars');

Handlebars.registerHelper("inc", function(value, options) {
  return parseInt(value) + 1;
});


function getTeams(req, res, next) {
  mysql.pool.query('SELECT * FROM teams', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.teams = rows;
    return next();
  });
}

function getPositionGroups(req, res, next) {
  mysql.pool.query('SELECT * FROM positionGroup', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.positionGroup = rows;
    return next();
  });
}

function getPositions(req, res, next) {
  mysql.pool.query('SELECT * FROM positions', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.positions = rows;
    return next();
  })
}

function getPlayers(req, res, next) {
  mysql.pool.query('SELECT * FROM player', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.players = rows;
    return next();
  })
}

function getOffensiveStats(req, res, next) {
  mysql.pool.query('SELECT * from offsensiveStats', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.offsensiveStats = rows
    return next();
  })
}

function getDefensiveStats(req, res, next) {
  mysql.pool.query('SELECT * from defensiveStats', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.defensiveStats = rows
    return next();
  })
}

function getSpecialTeamsStats(req, res, next) {
  mysql.pool.query('SELECT * from specialTeamsStats', function(err, rows, fields) {
    if (err) {
      next(err);
      return;
    }
    req.specialTeamsStats = rows
    return next();
  })
}

function renderTablePage(req, res) {
  res.render('tables', {
    teams: req.teams,
    positionGroup: req.positionGroup,
    positions: req.positions,
    players: req.players,
    offsensiveStats: req.offsensiveStats,
    defensiveStats: req.defensiveStats,
    specialTeamsStats: req.specialTeamsStats
  });
}

app.get('/tables', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, renderTablePage);


//TODO Finish making a page of insert into table into correct routes
app.use('/insert', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res) {
  res.render('insert', {
    teams: req.teams,
    positionGroup: req.positionGroup,
    positions: req.positions,
    players: req.players,
    offsensiveStats: req.offsensiveStats,
    defensiveStats: req.defensiveStats,
    specialTeamsStats: req.specialTeamsStats
  });
});

//Demo to try and insert a team.
app.get('/teams-insert', function(req, res, next) {
  mysql.pool.query('INSERT INTO `teams`(`city`, `mascot`, `stadium`) VALUES (?, ?, ?)', [req.query.city, req.query.mascot, req.query.stadium], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    //TODO Figure out how to redirect page after inserting.
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});

app.get('/positionGroup-insert', function(req, res, next) {
  mysql.pool.query('INSERT INTO `positionGroup`(`positionGroup`) VALUES (?)', [req.query.positionGroup], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});


//TODO Positions Insert specifically dealing with the foreign key
app.get('/positions-insert', function(req, res, next) {
  mysql.pool.query('INSERT INTO `positions` (`positionGroup`, `position`) VALUES  (?,?)', [req.query.positionGroup, req.query.position], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});

app.get('/player-insert', function(req, res, next) {
  mysql.pool.query('INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `position`) VALUES (?,?,?,?,?,?,?)', [req.query.pNumber, req.query.firstName, req.query.lastName, req.query.age, req.query.mascot, req.query.positionGroup, req.query.position], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});

app.get('/offsensiveStats-insert', function(req, res, next) {
  mysql.pool.query('INSERT INTO `offsensiveStats`(`playerNumber`, `passingAttempts`, `passesCompleted`, `passingYards`, `rushingYards`, `rushingAttempts`, `receptions`, `targets`,`receivingYards`)VALUES (?,?,?,?,?,?,?,?,?)', [req.query.playerNumber, req.query.passingAttempts, req.query.passesCompleted, req.query.passingYards, req.query.rushingYards, req.query.rushingAttempts, req.query.receptions, req.query.targets, req.query.receivingYards], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});

app.get('/defensiveStats-insert', function(req,res,next){
  mysql.pool.query('INSERT INTO `defensiveStats`(`playerNumber`, `sacks`, `tackles`,`forcedFumbles`,`interceptions`) VALUES (?,?,?,?,?)', [req.query.playerNumber, req.query.sacks, req.query.tackles, req.query.forcedFumbles, req.query.interceptions], function(err,result){
    if (err) {
      next(err);
      return;
    }
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});

app.get('/specialTeamsStats-insert', function(req,res,next){
  mysql.pool.query('INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`,`punts`,`avergePuntYards`) VALUES (?,?,?,?,?)', [req.query.playerNumber, req.query.fieldGoalAttempts, req.query.fieldGoalMade, req.query.punts, req.query.avergePuntYards], function(err,result){
    if (err) {
      next(err);
      return;
    }
    res.render('insert', {
      teams: req.teams,
      positionGroup: req.positionGroup,
      positions: req.positions,
      players: req.players,
      offsensiveStats: req.offsensiveStats,
      defensiveStats: req.defensiveStats,
      specialTeamsStats: req.specialTeamsStats
    });
  });
});


//Homepage
app.get('/', function(req, res) {
  res.render('home');
})

//404 Page
app.use(function(req, res) {
  res.status(404);
  res.render('404');
});

//500 Page
app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.type('plain/text');
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function() {
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
