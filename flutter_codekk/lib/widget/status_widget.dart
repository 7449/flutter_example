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

  Widget normal() => new Container();

  Widget loading() => new Center(child: CircularProgressIndicator());

  Widget empty() => new Center(
      child: new RaisedButton(
          onPressed: onEmptyPressed, child: const Text('EMPTY')));

  Widget error() => new Center(
      child: new RaisedButton(
          onPressed: onErrorPressed, child: const Text('ERROR')));
}
