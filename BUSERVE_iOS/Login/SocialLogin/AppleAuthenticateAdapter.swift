//
//  AppleAuthenticateAdapter.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/08/20.
//

import Foundation
import AuthenticationServices

class AppleAuthenticateAdapter: NSObject, AuthenticateAdapter {
    
    private var continuation: CheckedContinuation<Bool, Error>?
    
    var adapterType: String {
        return "Apple"
    }
    
    func login() async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
           self.continuation = continuation
           
           let request = ASAuthorizationAppleIDProvider().createRequest()
           request.requestedScopes = [.fullName, .email]
           
           let controller = ASAuthorizationController(authorizationRequests: [request])
           controller.delegate = self
           controller.presentationContextProvider = self
           controller.performRequests()
       }
   }
}

extension AppleAuthenticateAdapter: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let token = appleIDCredential.identityToken
            let userIdentifier = appleIDCredential.user
            let email = appleIDCredential.email
            var fullName = ""
            if let familyName = appleIDCredential.fullName?.familyName,
               let givenName = appleIDCredential.fullName?.givenName {
                fullName = "\(familyName)\(givenName)"
        
            } else {
                print("Failed to retrieve full name.")
            }
            
            print("token: \(String(describing: token))")
            print("userIdentifier: \(userIdentifier)")
            print("fullName: \(fullName)")
            print("email: \(String(describing: email!))")
//            completion?(.success(true))
            
            UserDefaults.standard.set(userIdentifier, forKey: "AppleUserID")
            
            continuation?.resume(returning: true)
        } else {
//            completion?(.failure(NSError(domain: "AppleAuthError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials."])))
            continuation?.resume(throwing: NSError(domain: "AppleAuthError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials."]))
        }
        continuation = nil
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        completion?(.failure(error))
        continuation?.resume(throwing: error)
        continuation = nil
    }
}

extension AppleAuthenticateAdapter: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // 필요한 window 반환. 대부분의 경우 현재 앱의 메인 window를 반환합니다.
        return UIApplication.shared.windows.first { $0.isKeyWindow }!
    }
}
