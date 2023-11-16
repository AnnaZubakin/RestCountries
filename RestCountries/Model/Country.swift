//
//  Country.swift
//  RestCountries
//
//  Created by anna.zubakina on 15/11/2023.
//

import Foundation


/* struct Name:Codable{
    let common, official:String?
    let region, subregion: String?
    let area: Double?
    let population: Int?
    let flag: String?
}

struct Country:Codable{
    let name:Name
} */

struct Name: Codable {
    let common: String
    let official: String
 //   let nativeName: [String: [String: String]]
}

struct Country: Codable {
    let name: Name
//    let tld: [String]
//    let cca2: String
//    let ccn3: String
//    let cca3: String
//    let cioc: String
//    let independent: Bool
//    let status: String
//    let unMember: Bool
//    let currencies: [String: Currency]
//    let idd: Idd
    let capital: [String]?
 //   let altSpellings: [String]
    let region: String
    let subregion: String?
 //   let languages: [String: String]
//    let translations: [String: [String: String]]
//    let latlng: [Double]
//    let landlocked: Bool
//    let borders: [String]
    let area: Double
 //   let demonyms: [String: [String: String]]
    let flag: String
  //  let maps: [String: String]
    let population: Int
//    let gini: [String: Double]
//    let fifa: String
//    let car: Car
//    let timezones: [String]
//    let continents: [String]
//    let flags: Flags
//    let coatOfArms: CoatOfArms
//    let startOfWeek: String
//    let capitalInfo: CapitalInfo
}

//struct Currency: Codable {
//    let name: String
//    let symbol: String
//}
//
//struct Idd: Codable {
//    let root: String
//    let suffixes: [String]
//}
//
//struct Car: Codable {
//    let signs: [String]
//    let side: String
//}
//
//struct Flags: Codable {
//    let png: String
//    let svg: String
//    let alt: String
//}
//
//struct CoatOfArms: Codable {
//    let png: String
//    let svg: String
//}
//
//struct CapitalInfo: Codable {
//    let latlng: [Double]
// }

