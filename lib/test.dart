class UserManager {
  String name = "waleed";
  void login() {
    print("Success Login");
  }

  void verify() {
    print("Success Verify");
  }

  void welocme() {
    print("Welcome $name");
  }

  void saveToDataBase() {
    print("Save to database");
  }
}
////////////////////////////////////

class AuthService {
  void login() {
    print("Success Login");
  }

  void verify() {
    print("Success Verify");
  }
}

class WelcomeService {
  String name = "waleed";
  void welocme() {
    print("Welcome $name");
  }
}

class DataBaseService {
  void saveToDataBase() {
    print("Save to database");
  }
}
