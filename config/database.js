// sql connection
var mysql = require('mysql');
var config = {
    // host: 'localhost',
    host: '110.238.80.161',
    user: 'root',
    password: 'Harveylinux77+',
    database: 'db_demo'
};

// init database
var pool = mysql.createPool(config);

//Fetch data
function RunQuery(sql, callback) {
    pool.getConnection(function (err, conn) {
        if (err) {
            ShowErrors(err);
        }
        conn.query(sql, function (err, rows, fields) {
            if (err) {
                ShowErrors(err);
            }
            conn.release();
            callback(rows);
        });
    });
}

//Throw errors
function ShowErrors(err) {
    throw err;
}

module.exports = {
    RunQuery: RunQuery
};



// mongo connection
const mongoose = require("mongoose");
const MONGODB_URI = "mongodb://rwuser:Harveylinux77%2B@122.8.183.160:8635/?authSource=admin&readPreference=primary&ssl=false&directConnection=true";

connectToMongo();

async function connectToMongo() {
    try {
    const db = await mongoose.connect(MONGODB_URI);
    console.log("Connected to mongo", db.connection.name);
    } catch (error) {
    console.error(error);
    }
}

mongoose.connection.on("connected", () => {
  console.log("Mongoose is connected");
});

mongoose.connection.on("disconnected", () => {
  console.log("Mongoose is disconnected");
});
