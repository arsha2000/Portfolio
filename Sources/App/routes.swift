import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    let controller = PortfolioController()
    try router.grouped("/").register(collection: controller)
}
