//
//  NetWorkingProvider.swift
//  ExameniOS
//
//  Created by Kenneth on 14/04/21.
//

import Foundation
import Alamofire

final class NetWorkingProvider{
 
    static let shared = NetWorkingProvider()
    
    private let baseUrl = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
    
    private let statusOK = 200...299
    
    func getColor(success: @escaping (_ data: DataJSON) -> (), failure: @escaping (_ error: Error?) -> ()) {
        
        AF.request(baseUrl, method: .get).validate(statusCode: statusOK).responseDecodable (of: DataJSON.self) { response in
            
            if let data = response.value {
                success(data)
                print(data)
            }
            else {
                failure(response.error)
                print(response.error?.responseCode ?? "No error")
            }
        }
    }
}
