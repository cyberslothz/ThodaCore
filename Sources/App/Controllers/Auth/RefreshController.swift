//
//  RefreshController.swift
//
//
//  Created by Shrish Deshpande on 14/12/23.
//

import Vapor

struct RefreshController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let e = routes.grouped("auth").grouped("refresh")
        
        e.post(use: refreshToken)
        e.get(use: methodNotAllowed)
    }
    
    func refreshToken(req: Request) async throws -> AuthResponseBody {
        throw Abort(.notImplemented)
    }
    
    @inlinable
    func methodNotAllowed(req: Request) async throws -> AuthResponseBody {
        throw Abort(.methodNotAllowed)
    }
}
