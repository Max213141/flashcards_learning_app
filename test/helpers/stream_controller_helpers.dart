import 'dart:async';

Future<void> closeControllers(
  List<StreamController<dynamic>> controllers,
) async {
  for (final controller in controllers) {
    if (!controller.isClosed) {
      await controller.close();
    }
  }
}
