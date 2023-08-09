import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../customFullScreenDialog.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User? user;
  var userDetails = "".obs;

  Future<User?> loginWithGoogle() async {
    print("inside the google signin");
    CustomFullScreenDialog.showDialog();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      CustomFullScreenDialog.cancelDialog();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      CustomFullScreenDialog.cancelDialog();

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        user = userCredential.user;
        userDetails.value = user as String;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      }
    }
    return user;
  }

  //       assert(user!.isAnonymous);
  //       assert(await user!.getIdToken() != null);
  //       final User currentUser = _auth.currentUser!;
  //       print(currentUser);
  //       assert(user!.uid == currentUser.uid);
  //       Get.toNamed('/homeView'); // navigate to your wanted page
  //       return user;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back(); // navigate to your wanted page after logout.
  }
}
