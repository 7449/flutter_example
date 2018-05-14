import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum Status {
  NORMAL,
  LOADING,
  EMPTY,
  SUCCESS,
  ERROR,
}

class StatusWidget extends StatelessWidget {
  final Status status;
  final Widget child;
  final VoidCallback onErrorPressed;
  final VoidCallback onEmptyPressed;

  StatusWidget(
      {@required this.status,
      @required this.child,
      @required this.onEmptyPressed,
      @required this.onErrorPressed});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.EMPTY:
        return empty();
      case Status.ERROR:
        return error();
      case Status.LOADING:
        return loading();
      case Status.SUCCESS:
        return child;
      case Status.NORMAL:
        return normal();
    }
    return normal();
  }

  Widget normal() => Container();

  Widget loading() => Center(child: CircularProgressIndicator());

  Widget empty() => Center(
      child: RaisedButton(onPressed: onEmptyPressed, child: Text('EMPTY')));

  Widget error() => Center(
      child: RaisedButton(onPressed: onErrorPressed, child: Text('ERROR')));
}
