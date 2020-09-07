import '../string_util.dart';

enum LoginType { email, phone }

class User {
  String email;
  String phone;

  String _lastName;
  String _firstName;

  LoginType _type;

  List<User> friends = <User>[];

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    print("User is created");
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String phone, String email}) {
    if (name.isEmptyOrNull()) {
      throw Exception("User's name is empty");
    }

    if (phone.isEmptyOrNull() && email.isEmptyOrNull()) {
      throw Exception("You must fill at least email or phone");
    }

    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: _checkPhone(phone),
        email: _checkEmail(email));
  }

  static String _getLastName(String userName) {
    return userName.split(" ")[1];
  }

  static String _getFirstName(String userName) {
    return userName.split(" ")[0];
  }

  static String _checkPhone(String phone) {
    if (phone == null) {
      return phone;
    }

    String pattern = r"^(?:[+0])?[0-9]{11}";

    phone = phone.replaceAll(RegExp("[^+\\d]"), "");

    if (phone.isEmpty) {
      throw Exception("Enter don't empty phone number");
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          "Enter a valid phone number starting with a + and containing 11 digits");
    }

    return phone;
  }

  static String _checkEmail(String email) {
    if (email == null) {
      return email;
    }

    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (email.isEmpty) {
      throw Exception("Email is empty");
    } else if (!RegExp(pattern).hasMatch(email)) {
      throw Exception("Email is not valid");
    }

    return email;
  }

  String get login {
    return _type == LoginType.phone ? phone : email;
  }

  String get name {
    return "${_firstName.capitalize()} ${_lastName.capitalize()}";
  }

  String get userInfo => '''
    name: $name,
    email: $email,
    phone: $phone,
    firstName: $_firstName,
    lastName: $_lastName,
    friends: ${friends.toList()}
  ''';

  void addFriends(Iterable<User> newFriends) {
    friends.addAll(newFriends);
  }

  void addFriend(User friend) {
    friends.add(friend);
  }

  void removeFriend(User friend) {
    friends.remove(friend);
  }

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }

    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (email == object.email || phone == object.email);
    }

    return false;
  }

  @override
  int get hashCode => super.hashCode;

  @override
  String toString() {
    return '''name: $name,
      email: $email,
      phone: $phone,
      friends: ${friends.toList()}
    ''';
  }

  User findInFriends(User user) {
    return friends.firstWhere((element) => element.name == user.name,
        orElse: () => throw Exception("${user.login} is not a friend of the login"));
  }
}

mixin UserUtils {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1)
      .toLowerCase();
}
