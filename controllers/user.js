const User = require("../models/user");
 

exports.add = (request, response) => {
    const newUser = new User(request.body);
    console.log(request.body)
    User.create(newUser, (error, data) => {
      if (error) {
        response.status(500).send(error.message);
      }
      response.redirect("/");
    });
};

exports.findInfo = (request, response) => {
  // console.log('user:',request.user)
  User.getInfo(request.user.userId, (error,data) => {
    console.log(data)
        if (error) {
        response.status(500).send(error.message);
        }        
        response.render("profil",{
          userName:data.userName,
          userPseudo:data.userPseudo
       
        });
      
  });
};

