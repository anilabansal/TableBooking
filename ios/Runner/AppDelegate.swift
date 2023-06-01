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
    FirebaseApp.configure()
     // GIDSignIn.sharedInstance.clientID = "250363232703-a75v7r92p21soq4eep3k1cupmb499d2h.apps.googleusercontent.com"
    GMSServices.provideAPIKey("AIzaSyAh44zG-nwjUK3-C0IR8lLpw2uBZfVukVY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
