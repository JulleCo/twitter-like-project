var LocalStrategy = require("passport-local").Strategy;
var User = require('./models/user');

module.exports = (passport) => {
  passport.use(new LocalStrategy(
    {
      usernameField: 'userEmailAdress',
      passwordField: 'userPassword'
    },
    function(userEmailAdress, password, done) {
      console.log(userEmailAdress,password);
      User.findOne(userEmailAdress, (err, user) => {
        console.log(user);
        if (err) { return done(err); }
        if (!user) {
          return done(null, false, { message: 'Incorrect email.' });
        }
        if (password !== user.userPassword) {
          return done(null, false, { message: 'Incorrect password.' });
        }
        return done(null, user);
      });
    }
  ));

  passport.serializeUser(function (user, done) {done(null, user);});
  passport.deserializeUser(function (user, done) {done(null, user);});
}
