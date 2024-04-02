// database module
var database = require('../config/database');
var RunQuery = database.RunQuery;

// Generate Hash
var bcrypt = require('bcrypt-nodejs');

// email module
var nodemailer = require('nodemailer');

// generamos string aleatorio para resetear password
function genRandonString(length) {
    var chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+?!#$%--+=&()';
    var charLength = chars.length;
    var result = '';
    for ( var i = 0; i < length; i++ ) {
       result += chars.charAt(Math.floor(Math.random() * charLength));
    }
    return result;
 }

module.exports = function (app, passport) {

    app.get('/reset-password', function (req, res) {
        // render the page and pass in any flash data if it exists
        if (req.session.inCheckOut){
            var checkOutNoti = 'Necesitas ingresar a Ecommerce para poder realizar esta operación!\
                Registrate si aun no tienes una cuenta!';
            req.session.inCheckOut = false;
        }
        var contextDict = {
            title: 'Resetear Contraseña',
            currentUrl: '/sign-in',
            signInError: req.flash('signInError'),
        };
        res.render('resetPassword', contextDict);
    });

    app.post('/reset-password-send', function (req, res) {
        // render the page and pass in any flash data if it exists
        console.log(req.body.email);

        var sqlStr = 'SELECT COUNT(*) AS MailCount FROM users WHERE Email = \'' + req.body.email + '\'';

        RunQuery(sqlStr, function (mail) {
            console.log(mail[0].MailCount);

            if(mail[0].MailCount == 0){
                var checkOutNoti = 'El email ingresado no ha sido registrado!\
                Registrate si aun no tienes una cuenta!';
                var contextDict = {
                    title: 'Resetear Contraseña',
                    currentUrl: '/sign-in',
                    signInError: req.flash('signInError'),
                    checkOutNoti: checkOutNoti
                };
                res.render('resetPassword', contextDict);
            }else if(mail[0].MailCount > 0){
                var provitionalPasswordUnecrypted =  genRandonString(12);
                var provitionalPassword = bcrypt.hashSync(provitionalPasswordUnecrypted, null, null);
                var sqlStr = '\
                UPDATE users\
                SET Password = \'' + provitionalPassword + '\' WHERE Email = \'' + req.body.email + '\'';

                RunQuery(sqlStr, function (resetPassword) {



                    var signInErrorReset = 'Se ha enviado una contraseña temporal al correo '+ req.body.email+'. \
                    Consulta tu email para recuperar tu acesso a Ecommerce';

                    
                    var contextDict = {
                        title: 'Resetear Contraseña',
                        currentUrl: '/sign-in',
                        signInErrorReset: signInErrorReset
                    };
                    res.render('sign-in', contextDict);
                });
                
            }
            
        });
        

    });

    app.get('/sign-in', function (req, res) {
        // render the page and pass in any flash data if it exists
        if (req.session.inCheckOut){
            var checkOutNoti = 'Necesitas ingresar a Ecommerce para poder realizar esta operación\
                Registrate si aun no tienes una cuenta!';
            req.session.inCheckOut = false;
        }
        var contextDict = {
            title: 'Iniciar Sesión',
            currentUrl: '/sign-in',
            signInError: req.flash('signInError'),
            checkOutNoti: checkOutNoti
        };
        res.render('sign-in', contextDict);
    });

    app.post('/sign-in', passport.authenticate('sign-in', {
        successRedirect: '/', // redirect to the secure profile section
        failureRedirect: '/sign-in', // redirect back to the signup page if there is an error
        failureFlash: true // allow flash messages
    }));

    app.get('/sign-up', function (req, res) {
        // render the page and pass in any flash data if it exists
        if (req.session.inCheckOut){
            var checkOutNoti = 'Necesitas ingresar a Ecommerce para poder realizar esta operación';
            req.session.inCheckOut = false;
        }
        var contextDict = {
            title: 'Regístrate en Ecommerce',
            signUpError: req.flash('signUpError'),
            checkOutNoti: checkOutNoti
        };

        res.render('sign-up', contextDict);
    });

    // process the signup form
    app.post('/sign-up', passport.authenticate('sign-up', {
        successRedirect: '/', // redirect to the secure profile section
        failureRedirect: '/sign-up', // redirect back to the signup page if there is an error
        failureFlash: true // allow flash messages
    }));

    app.get('/sign-out', function (req, res) {
        req.logout();
        res.redirect('/');
    });

    function isLoggedIn(req, res, next) {

        // if user is authenticated in the session, carry on
        if (req.isAuthenticated())
            return next();

        // if they aren't redirect them to the home page
        res.redirect('/');
    }

};