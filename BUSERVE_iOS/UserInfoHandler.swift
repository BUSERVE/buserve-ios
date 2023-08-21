//
//  UserInfoHandler.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/08/21.
//

import Foundation

final class UserInfoHandler: UserInfoRepository {
   
    // MARK: - Properties
    
    static let shared: UserInfoRepository = UserInfoHandler()
    
    private init() {}
 
    // MARK: - methods
    
    func saveUserInfo(name: String, email: String, token: String) async throws -> Result<UserInfo, Error> {
        let user: UserInfo = UserInfo(name: name, email: email, token: token)
        print(user)
    }
    
    func loadUserInfo() async throws -> Result<UserInfo, Error> {
        <#code#>
    }
    
    func deleteUserInfo() async throws -> Bool {
        <#code#>
    }
}
