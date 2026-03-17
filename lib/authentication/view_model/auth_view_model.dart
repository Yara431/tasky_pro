import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_pro/app_context_extension.dart';
import 'package:tasky_pro/utils/routes/app_links.dart';

class AuthViewModel extends ChangeNotifier {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  int currentPage = 0;
  bool showPass = false;


  changePage(int index) {
    currentPage = index;
    notifyListeners();
  }

  togglePass() {
    showPass = !showPass;
    notifyListeners();
  }


  delete() {
    email.clear();
    password.clear();
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context})async{
    try{

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
      await Future.delayed(Duration(seconds: 5));
      context.push(AppLinks.homeView);
    } on FirebaseAuthException catch (e){
      String message='';
      if(e.code == "invalid-email"){
        message = 'The email address is either empty or not in the correct format';
      }
      else if(e.code == "invalid-credential"){
        message = 'The email is not valid';
      }
      else if(e.code == "wrong-password"){
        message = 'The Password is empty or not correct';
      }
      print(e.code);
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: context.resources.color.colorPrimary,
        textColor: context.resources.color.colorWhite,
        fontSize: 16
      );
    }
      catch(e){
      print(e);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context
})async{
    if(email.isNotEmpty || password.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password);

        await Future.delayed(const Duration(seconds: 3));
        context.push(AppLinks.homeView);
      } on FirebaseAuthException catch (e) {
        String message = '';
        if(e.code == 'weak-password'){
          message = 'The password provided is too weak';
        }
        else if(e.code == 'invalid-email'){
          message = 'The email address is not valid';
        }
        else if (e.code == 'email-already-in-use'){
          message = 'An account already exists with that email';
        }
        print(e.code);
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: context.resources.color.colorPrimary,
            textColor: context.resources.color.colorWhite,
            fontSize: 16);
      } catch (e) {
        print(e);
      }
    }
    else if(email.isEmpty){
      Fluttertoast.showToast(
          msg: "The email shouldn't be empty");
      return;
    }
    else if(password.isEmpty){
      print("The password shouldn't be empty");
      return;
    }
  }

}