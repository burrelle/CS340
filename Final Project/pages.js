var express = require('express');
var mysql = require('./dbcon.js');

var app = express();
var handlebars = require('express-handlebars').create({
  defaultLayout: 'main'
});

app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', 3000);
app.use(express.static('public'));

function getTeams(req,res,next){
  mysql.pool.query('SELECT * FROM teams', function(err,rows,fields){
    if(err){
      next(err);
      return;
    }
    req.teams = rows;
    return next();
  });
}

function getPositionGroups(req, res,next){
  mysql.pool.query('SELECT * FROM positionGroup', function(err,rows, fields){
    if(err){
      next(err);
      return;
    }
    req.positionGroup = rows;
    return next();
  });
}

function getPositions(req, res, next){
  mysql.pool.query('SELECT * FROM positions', function(err, rows, fields){
    if(err){
      next(err);
      return;
    }
    req.positions = rows;
    return next();
  })
}

function getPlayers(req,res,next){
  mysql.pool.query('SELECT * FROM player', function(err, rows, fields){
    if(err){
      next(err);
      return;
    }
    req.players = rows;
    return next();
  })
}

function getOffensiveStats(req,res,next){
  mysql.pool.query('SELECT * from offsensiveStats', function(err, rows, fields){
    if(err){
      next(err);
      return;
    }
    req.offsensiveStats = rows
    return next();
  })
}

function getDefensiveStats(req,res,next){
  mysql.pool.query('SELECT * from defensiveStats', function(err,rows, fields){
    if(err){
      next(err);
      return;
    }
    req.defensiveStats = rows
    return next();
  })
}

function getSpecialTeamsStats(req,res,next){
  mysql.pool.query('SELECT * from specialTeamsStats', function(err,rows,fields){
    if(err){
      next(err);
      return;
    }
    req.specialTeamsStats = rows
    return next();
  })
}

function renderTablePage(req, res){
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

//TODO Add in all of the tables to collapsible divs

app.get('/tables', getTeams, getPositionGroups, getPositions, getPlayers, getOffensiveStats, getDefensiveStats, getSpecialTeamsStats, renderTablePage);



//Teams Page to show all of the teams in the NFL
app.get('/teams', function(req, res, next) {
var context = {};
mysql.pool.query('SELECT * FROM teams', function(err, rows, fields) {
  if (err) {
    next(err);
    return;
  }
  context.results = rows;
  res.render('teams', context)
});
});

//TODO Finish making a page of insert into table into correct routes
app.use('/insert', getTeams, getPositionGroups, getPositions, function(req, res){
  res.render('insert', {
    teams: req.teams,
    positionGroup: req.positionGroup,
    positions: req.positions
  });
});

//Demo to try and insert a team.
app.get('/teams-insert', function(req, res, next) {
var context = {};
mysql.pool.query('INSERT INTO `teams`(`city`, `mascot`, `stadium`) VALUES (?, ?, ?)',[req.query.city, req.query.mascot, req.query.stadium], function(err, result) {
  if (err) {
    next(err);
    return;
  }
mysql.pool.query('SELECT * FROM teams', function(err, rows, fields) {
  if (err) {
    next(err);
    return;
  }
  context.results = rows;
  res.render('teams', context)
});
});
});

//Homepage
app.get('/', function(req,res){
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
