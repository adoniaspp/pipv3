import 'package:pipv3/app/util/failure_util.dart';

class FailureServerUtil extends FailureUtil
{

  String statusCode;

  FailureServerUtil({String message, this.statusCode}) : super(message);

}