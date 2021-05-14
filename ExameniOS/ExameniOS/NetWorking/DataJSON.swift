//
//  DataJSON.swift
//  ExameniOS
//
//  Created by Kenneth on 14/04/21.
//

import Foundation

struct DataJSON: Decodable{
    let colors: [String]
    let questions: [Questions]
}

struct Questions: Decodable {
    let total: Int
    let text: String
    let chartData: [ChartData]
}

struct ChartData: Decodable {
    let text: String
    var percetnage: Int
}


