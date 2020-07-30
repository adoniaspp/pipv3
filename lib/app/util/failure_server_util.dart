import 'package:pipv3/app/util/failure_util.dart';

class FailureServerUtil extends FailureUtil
{

  int statusCode;

  FailureServerUtil({String message, this.statusCode}) : super(message);

}