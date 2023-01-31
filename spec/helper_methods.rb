def load_test_data
  @user1 = User.create!({name: "Adam Anderson", email: "AA@gmail.com"})
  @user2 = User.create!({name: "Bob Berse", email: "BB@gmail.com"})
  @user3 = User.create!({name: "Chuck Chiperson", email: "CC@gmail.com"})
  @user4 = User.create!({name: "Dylan Dillerson", email: "DD@gmail.com"})
 
end