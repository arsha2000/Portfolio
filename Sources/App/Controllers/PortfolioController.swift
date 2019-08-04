import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class PortfolioController: RouteCollection {
    
    func boot(router: Router) throws {
        router.get(use: portfolioView)
        router.get("json", use: portfolio)
    }
    
    func portfolioView(_ req: Request) throws -> Future<View> {
        try portfolio(req).flatMap { (portfolio) in
            try req.view().render("Portfolio-template", portfolio)
        }
    }
    
    func portfolio(_ req: Request) throws -> Future<Portfolio> {
        let portfolio = try Portfolio.load()
        return req.future(portfolio)
    }
}
