import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class BlogApi {
  Handler get handler {
    final router = Router();

    router.get("/blog/noticias", (Request req) {
      return Response.ok("noticias");
    });

    return router;
  }
}