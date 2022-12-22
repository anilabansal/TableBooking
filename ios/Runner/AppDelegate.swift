import UIKit
import Flutter
import GoogleMaps
// import FacebookCore
import FirebaseCore
// import FBSDKCoreKit
import GoogleSignIn

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//   GIDSignIn.sharedInstance().clientID = "250363232703-gvdu43ck122qjmbjvik074om87mbq0dd.apps.googleusercontent.com"
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyBLVQD5gh9CP8C4_yrzuhvn06ZfhfFUODE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
