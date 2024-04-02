var express = require('express');
var router = express.Router();

var bcrypt = require('bcrypt-nodejs');

// database module
var database = require('../config/database');
var RunQuery = database.RunQuery;

function isLoggedIn(req, res, next) {

    // if user is authenticated in the session, carry on
    if (req.isAuthenticated())
        return next();

    // if they aren't redirect them to the home page
    res.redirect('/');
}

router.route('/')
    .get(function (req, res) {
        if (req.isAuthenticated()) {
            if (req.user.Admin == 1) {
                res.redirect('/admin');
            }
            else {
                res.redirect('/usr/' + req.user.Username);
            }
        }
        res.redirect('/');
    });

router.route('/:username')
    .get(isLoggedIn, function (req, res) {

        res.render('profile/profile', {
            title: req.user.FullName,
            currentUrl: '/usr/',
            customer: req.user
        });
    });

router.route('/:username/edit')
    .get(isLoggedIn, function (req, res) {
        res.render('profile/editProfile', {
            title: req.user.FullName,
            currentUrl: '/usr/',
            customer: req.user
        });
    })

    .post(isLoggedIn, function (req, res) {
        var form = req.body;
        if (bcrypt.compareSync(form.password, req.user.Password)) {

            var selectQuery = 'SELECT * FROM users WHERE email = \'' + form.email + '\' AND  Username != \'' + req.user.Username + '\'';
            RunQuery(selectQuery, function (emailRows) {
                if (emailRows.length > 0) {
                    res.render('profile/editProfile', {
                        title: req.user.FullName,
                        currentUrl: '/usr/',
                        customer: req.user,
                        signUpError: 'El email ingresado ya ha sido registrado previamente. Por favor ingresa otro email.'
                    });
                    
                } else {
                    
                    var updateQuery = 'UPDATE Users\
                        SET Fullname = \'' + form.fullName + '\', \
                            Email = \'' + form.email + '\', \
                            Phone = \'' + form.phone + '\' \
                        WHERE UserID = ' + req.user.UserID;

                    RunQuery(updateQuery, function (result) {
                        res.redirect('/usr/' + req.user.Username);
                    });
                        
                }
            });

        }else{
            res.render('profile/editProfile', {
                title: req.user.FullName,
                currentUrl: '/usr/',
                customer: req.user,
                signUpError: 'La contraseña ingresada es incorrecta. Por favor ingresa una contraseña válida.'
            });
        }
        
        
    });

router.route('/:username/change-password')
    .get(isLoggedIn, function (req, res) {
        res.render('profile/changePassword', {
            title: req.user.FullName,
            currentUrl: '/usr/',
            customer: req.user
        });

    })

    .post(isLoggedIn, function (req, res) {
        var form = req.body;
        if (form.newPassword == form.repeatPassword) {
            if (bcrypt.compareSync(form.currentPassword, req.user.Password)) {
                var passwordHash = bcrypt.hashSync(form.newPassword, null, null);
                var updateQuery = '\
                UPDATE Users\
                SET Password = \'' + passwordHash + '\' \
                WHERE UserID = ' + req.user.UserID;

                RunQuery(updateQuery, function (result) {
                    res.redirect('/usr/' + req.user.Username);

                });
            } else {
                //password wrong
                res.render('profile/changePassword', {
                    title: req.user.FullName,
                    currentUrl: '/usr/',
                    customer: req.user,
                    signUpError: 'La contraseña ingresada es incorrecta. Por favor ingresa una contraseña válida.'
                });
            }
        } else {
            //passwords are not matched
            res.render('profile/changePassword', {
                title: req.user.FullName,
                currentUrl: '/usr/',
                customer: req.user,
                signUpError: 'Las nuevas contraseñas ingresadas no coinciden. Por favor ingresa un par de contraseñas válidas.'
            });
        }
    });

router.route('/:username/orders')
    .get(isLoggedIn, function (req, res) {

        var selectQuery = 'SELECT * FROM Orders\
            WHERE UserID = ' + req.user.UserID;

        RunQuery(selectQuery, function (orders) {
            res.render('profile/orders', {
                title: req.user.FullName,
                currentUrl: '/usr/',
                customer: req.user,
                orders: orders
            });
        });
    });

router.route('/:username/orders/:id')
    .get(isLoggedIn, function (req, res) {
        //get order info
        var selectQuery = 'SELECT * FROM Orders WHERE OrderID = ' + req.params.id;

        RunQuery(selectQuery, function (order) {
            //get delivery info
            selectQueryCodigos = 'SELECT codigos.*, products.ProductName FROM astore.codigos\
            INNER JOIN products\
            ON codigos.juego = products.ProductID WHERE orden = \'' + req.params.id + '\' ORDER BY ProductName ASC';
            console.log(selectQueryCodigos);

            RunQuery(selectQueryCodigos, function (codigos) {
                //get order info
                selectQuery = '\
                    SELECT *\
                    FROM `Order Details`\
                    INNER JOIN (\
                        SELECT Products.*, Categories.CategorySlug\
                        FROM Products\
                        INNER JOIN Categories\
                        ON Products.CategoryID = Categories.CategoryID\
                    ) `Table`\
                    ON `Order Details`.ProductID = `Table`.ProductID\
                    WHERE OrderID = ' + order[0].OrderID;

                RunQuery(selectQuery, function (products) {
                    //get order info

                    var contextDict = {
                        title: req.user.FullName,
                        currentUrl: '/usr/',
                        customer: req.user,
                        order: order[0],
                        codigos: codigos,
                        products: products
                    };

                    console.log(codigos);

                    res.render('profile/viewOrder', contextDict);
                });
            });
        });
    });

module.exports = router;