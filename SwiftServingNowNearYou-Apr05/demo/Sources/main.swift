import HTTPServer
import Router

let router = Router { route in
  route.get("/hello") { _ in
    return Response(body: "hello world")
  }

  route.get("/hello/:name") { request in
    let name = request.pathParameters["name"]!
    return Response(body: "hello \(name)")
  }
}

try Server(responder: router).start()

