# Chat App

A full-featured, real-time Flutter chat application built with **Clean Architecture** and **Bloc** state management. The app connects to a Node.js backend, featuring real-time messaging via Socket.io and robust local caching for offline support.

# #Features 

* **Real-time Messaging:** Send and receive messages instantly using `socket_io_client`, complete with real-time "typing..." indicators.
* **Smart Local Caching:** Utilizes `Hive` to locally cache the latest 25 friends and the latest 25 messages per friend, ensuring fast load times and offline accessibility.
* **Friend Management:** 
  * View current friends and discover new people via the Suggestions screen.
  * Send, view, and accept friend requests seamlessly.
  * Search and filter functionality to easily find friends or explore new connections.
* **User Authentication & Profile:** Secure login/logout flow with user data locally persisted using `shared_preferences`.
* **Theme Customization:** Support for both **Dark Mode** and **Light Mode**, with the user's preference saved locally.
* **Responsive UI:** Built with `flutter_screenutil` to ensure pixel-perfect UI across all screen sizes, enriched with `Lottie` animations (animations will be added soos, many other features as well)
* **real time notifications** built with `flutter_push_local_notifications` and Fcm `firebase_cloud_messaging` service, emites messages notification 


## Architecture & State Management

This project strictly follows the **Clean Architecture** pattern to separate concerns, make the codebase scalable, and ensure high testability.
* **State Management:** `flutter_bloc`=>(cubit)
* **Dependency Injection:** `get_it`
* **API Networking:** `dio` paired with `retrofit` for structured and type-safe HTTP requests to the Node.js API.
* **Data Parsing:** `json_serializable` and `json_annotation`.

## Tech Stack & Dependencies

- [Flutter Bloc](https://pub.dev/packages/flutter_bloc) - as a State management.
- [Retrofit](https://pub.dev/packages/retrofit) & [Dio](https://pub.dev/packages/dio) - Network calls-requests.
- [Socket.io Client](https://pub.dev/packages/socket_io_client) - Real-time websockets.
- [Hive CE](https://pub.dev/packages/hive_ce) - Fast, lightweight local NoSQL database.
- [Shared Preferences](https://pub.dev/packages/shared_preferences) - Key-value storage for app settings (Theme, User Session).
- [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) - UI responsiveness.
- [Get It](https://pub.dev/packages/get_it) - Service locator.
- [notifications](pub.dev/packages/firebase_messaging) 
- [local notifications](https://pub.dev/packages/flutter_local_notifications)

 

 ### Prerequisites
- Flutter SDK (`>=3.0.0`)


### Installation
#### for frontend
- make sure you have got this repository on your device
- open project in vs and run these in terminal:
- flutter clean
- flutter pub get
- then run this one:
- flutter pub run build_runner build --delete-conflicting-outputs
- this is important for haive and json_serializable to work without issues
#### for backend which powers this app
- make sure you have got this repo: [backend project](https://github.com/Mosa-al-fahel/chat-app-backend-node-js)
- (with node js requirements)
- when both project are opened
- open cmd and run chat-app-backend-node-js
- run the server and then run the emulator in flutter window

