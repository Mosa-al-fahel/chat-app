class ApiUrls {
  static const String baseUrl = 'http://10.0.2.2:8001/api/';
  //authentications
  static const String auth = 'auth/';
  static const String signup = '${auth}signup';
  static const String login = '${auth}login';
  // friends
  static const String friends = 'friends/';
  static const String addFriend = '${friends}add';
  static const String exploreFriends = '${friends}explore';
  static const String firendsList = '${friends}list';
  static const String removeFriend = '${friends}remove';
  static const String requests = '${friends}requests';
   static const String acceptRequests = '${friends}acceptrequest';
 
  //messages and char feature

  static const String chatMessages = 'messages/';
}
