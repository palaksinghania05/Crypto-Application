import 'package:crypto_app_basic/widgets/extras/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged =>
      _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);

  //GET UID
  Future<String> getCurrentUserId() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  //Email and Password SignUp
  Future<String> createUserWithEmailAndPassword(String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    //Update username
    await updateUserName(name, currentUser.user);
    DatabaseManager().createUserData(name, email, currentUser.user.uid);
    return currentUser.user.uid;
  }

  //Update username
  Future updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }

  //Email and Password SignIn
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password)).user.uid;
  }

  //Reset Password
  Future sendPasswordResetEmail(String email) async{
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

class NameValidator {
  static String validate(String value){
    if(value.isEmpty)
      return "Username can't be empty";
    if(value.length < 2)
      return "Username must be at least 2 characters long";
    if(value.length > 20)
      return "Username must be less than 20 characters";
    return null;
  }
}
