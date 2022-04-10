import Vapor

struct Greeting: Content {
    var hello: String
}

let hello = HelloController()

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello", use: hello.greet)

    app.get("hello", ":name") { req -> String in
        let name = req.parameters.get("name")!
        return "Hello, \(name)"
    }

    app.post("hello") { req -> String in
        let greeting = try req.content.decode(Greeting.self)
        req.logger.info("Got request body: \(greeting)")
        return "Hello, \(greeting.hello)"
    }
}
