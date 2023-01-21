class User {
  String userName = '';
  String email = '';

  User(this.userName, this.email);

  List info() {
    return [userName, email];
  }
}

mixin AdminAbilities {
  String getMailSystem(GeneralUser user) {
    return user.email.split('@')[1];
  }

  GeneralUser createUser(String name, String email) {
    return GeneralUser(name, email);
  }
}

class AdminUser extends User with AdminAbilities {
  AdminUser(String userName, String email) : super(userName, email);
}

class GeneralUser extends User {
  GeneralUser(String userName, String email) : super(userName, email);
}

class UserManager <T extends User> {

  Map<String, String> users = {};
  Set<User> userSet = {};

  void addUser(User user) {
    users[user.userName] = user.email;
    userSet.add(user);
  }

  void removeUser(User user) {
    if (users.containsKey(user.userName)) {
      users.remove(user.userName);
    }
    if (userSet.contains(user)) {
      userSet.remove(user);
    }
  }

  Map<String, String> getUserList() {
    return users;
  }
  
  Set<String> getUsersEmail() {
    Set<String> emails = {};
    for (var user in userSet) {
      if (user.runtimeType == AdminUser) {
        emails.add(user.email.split('@')[1]);
        continue;
      }
      emails.add(user.email);
    }
    return emails;
  }
}