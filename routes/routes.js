var express = require('express');
var router = express.Router();

// database module
var database = require('../config/database');
var RunQuery = database.RunQuery;

/* Route Home page. */
router.all('/', function (req, res, next) {
    var sqlStr = '\
        SELECT *\
        FROM Categories';

    RunQuery(sqlStr, function (categories) {

        console.log(categories);
        sqlStr = '\
            SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
            FROM Products\
            INNER JOIN Categories\
            ON Products.CategoryID = Categories.CategoryID\
            WHERE Feature = 1 AND UnitsInStock > 0';

        RunQuery(sqlStr, function (products) {
            console.log(products);
            var contextDict = {
                currentUrl: '/',
                title: 'Inicio',
                categories: categories,
                featProducts: products,
                customer: req.user
            };

            //isLoggedIn(req, contextDict);
            res.render('index', contextDict);
        });
    });
});




/* Route Category page. */
router.route('/cat/')
    .all(function (req, res, next) {
        var sqlStr = '\
        SELECT *\
        FROM Categories';

        RunQuery(sqlStr, function (categories) {
            var contextDict = {
                currentUrl: '/cat',
                title: 'Categories',
                categories: categories,
                customer: req.user
            };

            res.render('categories', contextDict);
        });
    });

/* Route Category Products page. */
router.route('/cat/:catSlug')
    .all(function (req, res, next) {
        if (req.params.catSlug == "all") {
            var selectQuery = '\
                SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
                FROM Products\
                INNER JOIN Categories\
                ON Products.CategoryID = Categories.CategoryID\
                WHERE Feature = 1 AND UnitsInStock > 0';

            RunQuery(selectQuery, function (products) {

                selectQuery = '\
                SELECT *\
                FROM Categories';

                RunQuery(selectQuery, function (categories) {

                    var contextDict = {
                        currentUrl: '/cat/all',
                        title: 'Todos los Productos',
                        products: products,
                        categories: categories,
                        customer: req.user
                    };

                    res.render('categoryProducts', contextDict);
                });
            });
        }
        else if (req.params.catSlug == "buscar"){
            var sqlStr = '\
                SELECT Products.* FROM Products WHERE ProductName LIKE \'%' + req.body.buscador + '%\' AND  Feature = 1 AND UnitsInStock > 0';

            RunQuery(sqlStr, function (products) {

                sqlStr = '\
                SELECT *\
                FROM Categories';

                RunQuery(sqlStr, function (categories) {

                    var contextDict = {
                        title: 'Resultado de busqueda: ' + req.body.buscador,
                        currentUrl: '/cat/all',
                        products: products,
                        categories: categories,
                        customer: req.user,
                        buscador: req.body.buscador
                    };

                    res.render('categoryProducts', contextDict);
                });
            });
        } else {
            var sqlStr = '\
                SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
                FROM Products\
                INNER JOIN Categories\
                ON Products.CategoryID = Categories.CategoryID\
                WHERE Categories.CategorySlug = \'' + req.params.catSlug + '\' AND Feature = 1 AND UnitsInStock > 0';

            RunQuery(sqlStr, function (products) {

                sqlStr = '\
                SELECT *\
                FROM Categories';

                RunQuery(sqlStr, function (categories) {

                    var contextDict = {
                        title: products[0].CategoryName,
                        currentUrl: '/cat/all',
                        products: products,
                        categories: categories,
                        customer: req.user
                    };

                    res.render('categoryProducts', contextDict);
                });
            });
        }
    });

/* Route Product page. */
router.route('/cat/:catSlug/:prodSlug/:prodID')
    .all(function (req, res, next) {

        var user = 9999;

        if (req.isAuthenticated()) {
            user = req.user.UserID;
        }

        var sqlStr1 = 'SELECT COUNT(*) as WhislistCount FROM astore.wishlist\
            WHERE IDUsuario = \'' + user + '\' AND IDvideojuego = \'' + req.params.prodID + '\'';

        RunQuery(sqlStr1, function (WhislistCount) {

            var sqlStr2 = '\
            SELECT Products.*, Categories.CategoryName, Categories.CategorySlug\
                FROM Products\
                INNER JOIN Categories\
                ON Products.CategoryID = Categories.CategoryID\
            WHERE ProductSlug = \'' + req.params.prodSlug + '\'';

            RunQuery(sqlStr2, function (product) {

                var contextDict = {
                    title: product[0].ProductName,
                    currentUrl: '/cat/all',
                    product: product[0],
                    WhislistCount: WhislistCount[0],
                    customer: req.user
                };

                res.render('productDetail', contextDict);
            }); 
        });      
    });
    
router.route('/subscribe')
    .post(function (req, res, next) {
        var sqlStr = '\
        INSERT INTO Subscribers\
        VALUES (\'' + req.body.email + '\')';

        RunQuery(sqlStr, function (result) {
            res.redirect('/');
        });
    });

module.exports = router;
