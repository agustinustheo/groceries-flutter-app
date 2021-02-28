import 'package:network/network.dart';

class SessionRepository {

  // This class is used to handle data from module network, it's mean we can
  // handle the data it's from local or internet

  var _sessionProvider = new SessionProvider();
  Future<Session> fetchSession() => _sessionProvider.fetchSession();

}