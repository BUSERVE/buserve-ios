//
//  SocialLoginManager.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/08/07.
//

import Foundation

enum LoginResult {
    case success
    case failure(Error)
}

class SocialLoginManager {
    
    // MARK: - Properties
    
    static let shared = SocialLoginManager()
    
    private init() {}
    
    private(set) var isLoggedIn: Bool = false {
        didSet {
            print(self)
        }
    }

    var currentUseCase: LoginUseCase?
    
    var currentAdapterType: String? {
        return currentUseCase?.adapterType
    }
    
    // MARK: - methods
    
    func login(with adapter: AuthenticateAdapter) async throws -> LoginResult {
        self.currentUseCase = LoginUseCase(adapter: adapter)
        
        guard let currentUseCase = self.currentUseCase else {
            throw NSError(domain: "SocialLoginManagerError", code: 0, userInfo: [NSLocalizedDescriptionKey: "currentUseCase is nil."])
        }
        
        do {
            let result = try await currentUseCase.login()
            isLoggedIn = result
            return .success
        } catch let error {
            isLoggedIn = false
            return .failure(error)
        }
    }
    
    func printCurrentUseCase() {
        if let currentAdapter = currentUseCase {
            print("Current use case is using \(currentAdapter.adapterType) adapter.")
        } else {
            print("No current use case.")
        }
    }
}

