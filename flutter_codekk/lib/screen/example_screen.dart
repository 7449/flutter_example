import 'package:flutter/material.dart';
import 'package:flutter_codekk/widget/status_widget.dart';

class ExampleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ExampleState();
}

class ExampleState extends State<ExampleScreen> {
  Status status = Status.NORMAL;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('Example')),
      body: new Column(children: <Widget>[
        new RaisedButton(
          onPressed: () => setState(() => status = Status.SUCCESS),
          child: const Text('Success'),
        ),
        new RaisedButton(
          onPressed: () => setState(() => status = Status.NORMAL),
          child: const Text('Normal'),
        ),
        new RaisedButton(
          onPressed: () => setState(() => status = Status.ERROR),
          child: const Text('Error'),
        ),
        new RaisedButton(
          onPressed: () => setState(() => status = Status.LOADING),
          child: const Text('Loading'),
        ),
        new RaisedButton(
          onPressed: () => setState(() => status = Status.EMPTY),
          child: const Text('Empty'),
        ),
        new StatusWidget(
          child: new Center(child: const Text('title')),
          status: status,
          onErrorPressed: () {},
          onEmptyPressed: () {},
        )
      ]),
    );
  }
}
