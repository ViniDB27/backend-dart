import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initialization({
    required Handler handler,
    required String address,
    required int port,
  }) async {
    final address = "localhost";

    await shelf_io.serve(handler, address, port);
    print("serve running in http://$address:$port");
  }
}