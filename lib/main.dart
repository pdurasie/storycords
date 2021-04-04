import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storycords/logic/recording/RecordingBloc.dart';
import 'package:storycords/logic/recording/RecordingState.dart';

import 'logic/recording/RecordingEvent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storycords',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Storycords"),
        ),
        body: BlocProvider(
            create: (context) => RecordingBloc(), child: RecordingButton()),
      ),
    );
  }
}

class RecordingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordingBloc, RecordingState>(
        builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _recordingWidgetMappedToState(state),
        ],
      );
    });
  }
}

class RecordingInProgressWidget extends StatelessWidget {
  const RecordingInProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You are recording right now."),
        GestureDetector(
          child: Icon(Icons.fiber_manual_record),
          onTap: () async {
            BlocProvider.of<RecordingBloc>(context).add(RecordingEnded());
          },
        ),
      ],
    );
  }
}

_recordingWidgetMappedToState(RecordingState state) {
  if (state is RecordingInitial) {
    return RecordingInitialWidget();
  } else if (state is RecordingInProgress) {
    return RecordingInProgressWidget();
  } else if (state is RecordingSuccess) {
    return RecordingSuccessWidget();
  }
}

class RecordingSuccessWidget extends StatelessWidget {
  const RecordingSuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("You have recorded successfully.")],
    );
  }
}

class RecordingInitialWidget extends StatelessWidget {
  const RecordingInitialWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Start recording!"),
          GestureDetector(
            child: Icon(Icons.mic),
            onTap: () async {
              BlocProvider.of<RecordingBloc>(context).add(RecordingStarted());
            },
          ),
        ],
      ),
    );
  }
}
