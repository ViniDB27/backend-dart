
import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'utils/custom_env.dart';

void main() async {
  final cascade =
      Cascade().add(LoginApi().handler).add(BlogApi().handler).handler;

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(cascade);

  await CustomServer().initialization(
    handler: handler,
    address: await CustomEnv.get(key: 'SERVER_ADDRESS'),
    port: int.parse(await CustomEnv.get(key: 'SERVER_PORT')),
  );
}