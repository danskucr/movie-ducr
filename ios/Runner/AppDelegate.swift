import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDtSVHHuG4gh1yK4j6ZMNSP_V9JNTc2ewE")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
