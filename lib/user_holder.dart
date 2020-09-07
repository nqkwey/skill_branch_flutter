import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  User getUserByLogin(String login) {
    return users[login];
  }

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    User user2 = User(name: name, phone: phone, email: email);

    if (users.containsKey(user.login)) {
      throw Exception("A user with this email already exists");
    } else {
      users[user.login] = user;
    }

    print(user == user2);
  }

  User registerUserByPhone(String fullName, String phone) {
    User user = User(name: fullName, phone: phone);

    if (users.containsValue(user)) {
      throw Exception('A user with this phone already exists');
    } else {
      users[user.login] = user;
    }

    return user;
  }

  User registerUserByEmail(String fullName, String email) {
    User user = User(name: fullName, email: email);

    if (users.containsValue(user)) {
      throw Exception('A user with this email already exists');
    } else {
      users[user.login] = user;
    }

    return user;
  }

  void setFriends(String login, Iterable<User> friends) {
    getUserByLogin(login).addFriends(friends);
  }

  User findUserInFriends(String login, User user) {
    return getUserByLogin(login).findInFriends(user);
  }

  List<User> importUsers(List<String> strings) {
    List<User> users = <User>[];

    strings.forEach((element) {

      element = element.replaceAll('"""', "");
      List<String> elements = element.split(";");

      User user = User(
          name: elements[0].trim(),
          email: elements[1].trim(),
          phone: elements[2].trim()
      );
      users.add(user);
    });

    print(users);

    return users;

  }
}
