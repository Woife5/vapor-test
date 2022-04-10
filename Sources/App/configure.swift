import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    switch app.environment {
        case .development:
            app.logger.info("Running in development mode")
        case .testing:
            app.logger.info("Running in testing mode")
        case .production:
            app.logger.info("Running in production mode")
        default:
            app.logger.info("Running in unknown mode")
    }

    // register routes
    try routes(app)
}
