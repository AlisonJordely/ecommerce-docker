var express = require('express');
var router = express.Router();

// database module
var database = require('../config/database');
var RunQuery = database.RunQuery;

router.route('/')
    .all(function (req, res, next) {

        if (req.isAuthenticated()) {
            var sqlStr = 'SELECT * FROM wishlist\
            INNER JOIN products\
            ON wishlist.IDvideojuego = products.ProductID\
            WHERE IDUsuario =  \'' + req.user.UserID + '\' AND Feature = 1';

            RunQuery(sqlStr, function (wishlist) {
                            
                var contextDict = {
                    currentUrl: '/wishlist',
                    title: 'Lista de deseos',
                    customer: req.user,
                    wishlist: wishlist
                };
                res.render('wishlist', contextDict);
            });
            
        } else {
            req.session.inCheckOut = true;
            res.redirect('/sign-in');
        }     
    });



router.route('/:id/deleteSweetAlert')
    .post(function (req, res, next) {
        if (req.isAuthenticated()) {
            var sqlStr = 'DELETE FROM wishlist\
            WHERE IDUsuario =  \'' + req.user.UserID + '\' AND IDvideojuego =  \'' + req.params.id + '\'';

            RunQuery(sqlStr, function (wishlist) {  
                // res.redirect('/wishlist');
            });
            
        } else {
            req.session.inCheckOut = true;
            res.redirect('/sign-in');
        }          
    });

router.route('/:id/delete')
    .post(function (req, res, next) {
        if (req.isAuthenticated()) {
            var sqlStr = 'DELETE FROM wishlist\
            WHERE IDUsuario =  \'' + req.user.UserID + '\' AND IDvideojuego =  \'' + req.params.id + '\'';

            RunQuery(sqlStr, function (wishlist) {  
                res.redirect('/wishlist');
            });
            
        } else {
            req.session.inCheckOut = true;
            res.redirect('/sign-in');
        }          
    });

router.route('/:id/add')
    .post(function (req, res, next) {
        
        if (req.isAuthenticated()) {
            var insertQuery = 'INSERT INTO wishlist\
                VALUES(null, \''+
                req.params.id + '\', \'' +
                req.user.UserID + '\')';

            RunQuery(insertQuery, function(result){
                // res.redirect('/wishlist');
            });
            
        } else {
            req.session.inCheckOut = true;
            res.redirect('/sign-in');
        }
         
    });


module.exports = router;