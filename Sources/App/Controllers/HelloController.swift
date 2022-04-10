import Vapor

final class HelloController {
    func greet(_ req: Request) throws -> String {
        req.logger.info("Handling request from HelloController")
        return "Hello, world!"
    }
}