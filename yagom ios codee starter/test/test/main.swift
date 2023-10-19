//
//  main.swift
//  test
//
//  Created by JSB on 2023/03/07.
//

import Foundation


// if let
// guard let
//


//1.설명
//옵셔널 바인딩이란?
//옵셔널 바인딩을 사용하면 안전하게 옵셔널 값을 언래핑 할 수 있고 옵셔널 인스턴스를 새로운 변수로 할당한다.
//이 할당하는 과정을 바인딩이라고 한다.

//공식문서에는 optional 인스턴스 값을 새 변수에 조건부로 할당하기위해서는 if let, guard let, switch 중에 선택해서 사용하라고 나와있다.

//if let은 조건문 안에서 옵셔널 값이 nil이 아닐 때 옵셔널 값을 변수에 할당하고 조건문 수행한다
//guard let은 옵셔널 값이 nil이 아닐 때 옵셔널 값을 변수에 할당하고 다음 코드를 진행한다


//2.예제코드

var optional1: String?
var optional2: String? = "abc"

if let optional = optional1 {
    print("optional1 = \(optional)")
} else {
    print("optional1 = nil")
}

if let optiona = optional2 {
    print("optional2 = \(optiona)")
} else {
    print("optional2 = nil")
}

print("=============================")

checkOptional(optional1, optional2)

func checkOptional(_ optional1: String?, _ optional2: String?) {
    guard let optionalValue = optional2 else {
        return print("optional2 = nil ")
    }
    print("optional2 = \(optionalValue) ")
    
    guard let optionalValue = optional1 else {
        return print("optional1 = nil")
    }
    print("optional1 = \(optionalValue)")
}


print("=============================")

var optional3: String?
var optional4: String? = "def"

switch optional3 {
case let optionalValue?:
    print("optional3 = \(optionalValue)")
case nil:
    print("optional3 = nil")
}

switch optional4 {
case let optionalValue?:
    print("optional4 = \(optionalValue)")
case nil:
    print("optional4 = nil")
}
