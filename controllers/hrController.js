var express = require("express");

var router = express.Router();

// Import the model (cat.js) to use its database functions.
var applicant = require("../models/applicant.js");

// Create all our routes and set up logic within those routes where required.
// router.get("/", function(req, res) {
//   applicant.all(function(data) {

//     res.render("index.html");
//   });
// });

router.post("/create", function(req, res) {
  cat.create([
    "first_name", "last_name", "home_phone", "cell_phone", "email", "contract_id", "position_id", "driver_license", "driver_exp", "sora_license", "sora_exp"
  ], [
    req.body.firstName, req.body.lastName, req.body.firstName, req.body.homePhone, req.body.cellPhone, req.body.email, req.body.contract, req.body.position, req.body.license, req.body.driverExp, req.body.soraLicense, req.body.soraExp
  ], function() {
    res.redirect("index.html");
  });
});

// router.put("/:id", function(req, res) {
//   var condition = "id = " + req.params.id;

//   console.log("condition", condition);

//   cat.update({
//     sleepy: req.body.sleepy
//   }, condition, function() {
//     res.redirect("/");
//   });
// });

// Export routes for server.js to use.
module.exports = router;
