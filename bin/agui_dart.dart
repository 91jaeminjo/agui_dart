import 'package:ag_ui/ag_ui.dart';

Future<void> main(List<String> arguments) async {
  // Initialize client
  final client = AgUiClient(
    config: AgUiClientConfig(
      baseUrl: 'http://localhost:8000',
      // defaultHeaders: {'Authorization': 'Bearer token'},
    ),
  );

  // Create and send message
  final input = SimpleRunAgentInput(
    threadId: 'thread_1',
    runId: 'run_1',
    messages: [UserMessage(id: 'msg_123', content: 'plan a weekend trip')],
  );

  // // Stream response events
  await for (final event in client.runAgent('agent/', input)) {
    if (event is TextMessageContentEvent) {
      print('Assistant: ${event.toJsonString()}');
    } else {
      print(event.toJsonString());
    }
  }

  // await for (final event in client.runAgenticChat(input)) {
  //   if (event is TextMessageContentEvent) {
  //     print('Assistant: ${event.toJsonString()}');
  //   }
  // }

  // await for (final event in client.runAgenticGenerativeUi(input)) {
  //   if (event is TextMessageContentEvent) {
  //     print('Assistant: ${event.toJsonString()}');
  //   } else {
  //     print(event.toJsonString());
  //   }
  // }

  // await for (final event in client.runHumanInTheLoop(input)) {
  //   if (event is TextMessageContentEvent) {
  //     print('Assistant: ${event.toJsonString()}');
  //   } else {
  //     print(event.toJsonString());
  //   }
  // }

  // await for (final event in client.runPredictiveStateUpdates(input)) {
  //   if (event is TextMessageContentEvent) {
  //     print('Assistant: ${event.toJsonString()}');
  //   }
  // }

  // await for (final event in client.runToolBasedGenerativeUi(input)) {
  //   if (event is TextMessageContentEvent) {
  //     print('Assistant: ${event.toJsonString()}');
  //   }
  // }
}
