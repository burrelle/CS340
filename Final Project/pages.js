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

app.get('/teams-insert', getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `teams`(`city`, `mascot`, `stadium`) VALUES (?, ?, ?)', [req.query.city, req.query.mascot, req.query.stadium], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * FROM teams', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.teams = rows;
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
});

app.get('/positionGroup-insert', getTeams, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `positionGroup`(`positionGroup`) VALUES (?)', [req.query.positionGroup], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * FROM positionGroup', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.positionGroup = rows;
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
});

app.get('/positions-insert', getTeams, getPositionGroups, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `positions` (`positionGroup`, `position`) VALUES  (?,?)', [req.query.positionGroup, req.query.position], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * FROM positions', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.positions = rows;
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
});

app.get('/player-insert', getTeams, getPositionGroups, getPositions, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `player`(`pNumber`, `firstName`, `lastName`, `age`, `team`, `positionGroup`, `position`) VALUES (?,?,?,?,?,?,?)', [req.query.pNumber, req.query.firstName, req.query.lastName, req.query.age, req.query.mascot, req.query.positionGroup, req.query.position], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * FROM player', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.players = rows;
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
});

app.get('/offsensiveStats-insert', getTeams, getPositionGroups, getPositions, getPlayers, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `offsensiveStats`(`playerNumber`, `passingAttempts`, `passesCompleted`, `passingYards`, `rushingYards`, `rushingAttempts`, `receptions`, `targets`,`receivingYards`)VALUES (?,?,?,?,?,?,?,?,?)', [req.query.playerNumber, req.query.passingAttempts, req.query.passesCompleted, req.query.passingYards, req.query.rushingYards, req.query.rushingAttempts, req.query.receptions, req.query.targets, req.query.receivingYards], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * FROM offsensiveStats', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.offsensiveStats = rows;
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
});

app.get('/defensiveStats-insert', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getSpecialTeamsStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `defensiveStats`(`playerNumber`, `sacks`, `tackles`,`forcedFumbles`,`interceptions`) VALUES (?,?,?,?,?)', [req.query.playerNumber, req.query.sacks, req.query.tackles, req.query.forcedFumbles, req.query.interceptions], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * defensiveStats', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.defensiveStats = rows;
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
});

app.get('/specialTeamsStats-insert', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, function(req, res, next) {
  mysql.pool.query('INSERT INTO `specialTeamsStats`(`playerNumber`, `fieldGoalAttempts`, `fieldGoalMade`,`punts`,`avergePuntYards`) VALUES (?,?,?,?,?)', [req.query.playerNumber, req.query.fieldGoalAttempts, req.query.fieldGoalMade, req.query.punts, req.query.avergePuntYards], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    mysql.pool.query('SELECT * FROM specialTeamsStats', function(err, rows, fields) {
      if (err) {
        next(err);
        return;
      }
      req.specialTeamsStats = rows;
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
});

//Update Functions
app.get('/teams-update', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  var context = {};
  mysql.pool.query("SELECT * FROM teams WHERE teamID=?", [req.query.teamID], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    if (result.length == 1) {
      var curVals = result[0];
      mysql.pool.query("UPDATE teams SET city=?, mascot=?, stadium=? WHERE teamID=?", [req.query.city || curVals.city, req.query.mascot || curVals.mascot, req.query.stadium || curVals.stadium, req.query.teamID], function(err, result) {
        if (err) {
          next(err);
          return;
        }
        mysql.pool.query('SELECT * FROM teams', function(err, rows, fields) {
          if (err) {
            next(err);
            return;
          }
          req.teams = rows;
          res.render('tables', {
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
    }
  });
});

//TODO UPDATE functions for all of the remaining tables
//Position Group Update
app.get('/positionGroup-update', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, function(req, res, next) {
  var context = {};
  mysql.pool.query("SELECT * FROM teams WHERE positionGroupID=?", [req.query.positionGroupID], function(err, result) {
    if (err) {
      next(err);
      return;
    }
    if (result.length == 1) {
      var curVals = result[0];
      mysql.pool.query("UPDATE teams SET positionGroup=? WHERE positionGroupID=?", [req.query.positionGroup || curVals.positionGroup, req.query.positionGroupID], function(err, result) {
        if (err) {
          next(err);
          return;
        }
        mysql.pool.query('SELECT * FROM positionGroup', function(err, rows, fields) {
          if (err) {
            next(err);
            return;
          }
          req.positionGroup = rows;
          res.render('tables', {
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
    }
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
