var express = require('express');
var router = express.Router();

// database module
var database = require('../config/database');
var RunQuery = database.RunQuery;

// email module
var nodemailer = require('nodemailer');

// generamos string aleatorio para el codigo del videojuego
function genRandonString(length) {
    var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    var charLength = chars.length;
    var result = '';
    for ( var i = 0; i < length; i++ ) {
       result += chars.charAt(Math.floor(Math.random() * charLength));
    }
    return result;
 }

router.route('/')
    .get(function (req, res, next) {
        if (req.isAuthenticated()) {
            if (req.session.cart){
                if (req.session.summary.totalQuantity > 0) {
                    res.redirect('checkout/delivery/')
                }
            }
            res.redirect('/cart');
        }
        else {
            req.session.inCheckOut = true;
            res.redirect('/sign-in');
        }
    });


router.route('/review')
    .get(function (req, res, next) {
        //show current cart
        //Order

        if (req.isAuthenticated()) {
            var contextDict = {
                title: 'Checkout - Finalizar compra',
                cart: req.session.showCart,
                summary: req.session.cartSummary,
                customer: req.user
            };
            res.render('checkout/review', contextDict);
            
        } else {
            req.session.inCheckOut = true;
            res.redirect('/sign-in');
        }   

    });

router.route('/order').get(function (req, res, next) {
        
        var insertQuery = 'INSERT INTO Orders VALUES(null, ' +
            req.user.UserID + ', ' +
            req.session.cartSummary.subTotal + ', ' +
            req.session.cartSummary.discount + ', ' +
            req.session.cartSummary.total + ', NOW(), \'Order Received\');';

        var totalMail = req.session.cartSummary.total;

        RunQuery(insertQuery, function (rows) {
            console.log(req.session.cart);

            var codigosMail = "";

                    var email = req.user.Email;
                        var fullName = req.user.FullName;

                        console.log(email);
                        console.log(fullName);
                        
            for (var item in req.session.cart) {
                console.log(item);
                if (req.session.cart[item].quantity > 0) {

                    var insertQueryOrders = 'INSERT INTO `Order Details` VALUES(' +
                        rows.insertId + ', ' +
                        req.session.cart[item].ProductID + ', ' +
                        req.session.cart[item].quantity + ', ' +
                        req.session.cart[item].productTotal + ');';
                    RunQuery(insertQueryOrders, function (result) {});

                    

                    for (let i = 0; i < req.session.cart[item].quantity; i++) {
                        var a = genRandonString(4);
                        var b = genRandonString(4);
                        var c = genRandonString(4);
                        var codigoString = a + '-' +  b + '-' +  c;
                        console.log("random", codigoString);
                        codigosMail += req.session.cart[item].ProductName + ", código: " + codigoString + "\n";
                        
                        var insertQueryCodigo = 'INSERT INTO codigos VALUES(null,' +
                        rows.insertId + ', ' +
                        req.session.cart[item].ProductID + ', \'' + codigoString + '\');';
                        RunQuery(insertQueryCodigo, function (result5) {});
                    }

                    var updateQueryQuantity = 'UPDATE Products SET UnitsInStock = (UnitsInStock - ' + req.session.cart[item].quantity +
                        ') WHERE ProductID = ' + req.session.cart[item].ProductID + ';';

                    var idWhere = req.session.cart[item].ProductID
                    RunQuery(updateQueryQuantity, function(result2){

                        

                        

                        var selectQueryUnits = 'SELECT UnitsInStock FROM Products WHERE ProductID = ' + idWhere + ';';
                               
                        RunQuery(selectQueryUnits, function (result3) {

                            console.log(result3[0].UnitsInStock);
                            if(result3[0].UnitsInStock <= 0) {
                                var updateQueryFeature ='UPDATE Products SET Feature = 0 WHERE ProductID = ' + idWhere + ';';
                                RunQuery(updateQueryFeature, function (result4) {});
                            }
                        });

                    });

                    
                        
                    
                }
            }



            //view order

            //get order info
            var selectQuery = 'SELECT * FROM Orders WHERE OrderID = ' + rows.insertId;
            RunQuery(selectQuery, function (order) {
            
                //get order info
                selectQuery = 'SELECT * FROM `Order Details`\
                INNER JOIN (\
                    SELECT Products.*, Categories.CategorySlug\
                    FROM Products\
                    INNER JOIN Categories\
                    ON Products.CategoryID = Categories.CategoryID\
                ) `Table`\
                ON `Order Details`.ProductID = `Table`.ProductID\
                WHERE OrderID = ' + order[0].OrderID;

                RunQuery(selectQuery, function (products) {
                    //clear cart
                    req.session.cart = {};
                    req.session.summary = {
                        totalQuantity: 0,
                        subTotal: 0.00,
                        discount: 0.00,
                        shipCost: 0.00,
                        total: 0.00
                    };
                    req.session.cartSummary = {};
                    req.session.showCart = {};

                    //get order info
                    var contextDict = {
                        title: 'Orden ' + rows.insertId,
                        customer: req.user,
                        order: order[0],
                        products: products
                    };                    

                    res.render('checkout/confirm', contextDict);
                    // res.redirect('/usr/'+ req.user.Username+'/orders/'+rows.insertId)

                    
                });
            });
        
        });
    });

router.route('/success')
    .get(function (req, res, next) {
        res.render('success');
    });

module.exports = router;