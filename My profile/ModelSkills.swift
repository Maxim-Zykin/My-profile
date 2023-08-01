//
//  ModelSkills.swift
//  My profile
//
//  Created by Максим Зыкин on 01.08.2023.
//

import Foundation

struct Skills: Codable {
    var name: String
}

var mySkills: [Skills] = [swift, Xcode, Storyboard, CocoaPods, MVCMVVM, URLSess, alamofire, UserDef, CoreDat, firebase]

var swift = Skills(name: "Swift")
var Xcode = Skills(name: "Xcode")
var Storyboard = Skills(name: "Storyboard")
var CocoaPods = Skills(name: "CocoaPods")
var MVCMVVM = Skills(name: "MVC/MVVM")
var URLSess = Skills(name: "URLSession")
var alamofire = Skills(name: "Alamofire")
var UserDef = Skills(name: "UserDefaults")
var CoreDat = Skills(name: "CoreData")
var firebase = Skills(name: "Firebase")
