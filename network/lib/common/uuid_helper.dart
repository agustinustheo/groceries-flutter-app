import 'package:uuid/uuid.dart';

String generateUuid(){
  Uuid uuid = new Uuid();
  return uuid.v4();
}