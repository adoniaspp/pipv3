import 'dart:async';

class TimerUtil 
{
  final duration = const Duration(days: 1);

  startTimeOut()
  {
    return Timer(duration, (){});
  }

}