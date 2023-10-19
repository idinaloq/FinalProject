//
//  main.swift
//  TestProject2
//
//  Created by JSB on 2023/09/23.
//

struct Hamburger {
    var bun: String
    var meat: String
    var vegetables: String
    var sauce: String
    var topping: String
}

class HamburgerBuilder {
    private var bun: String = "빵"
    private var meat: String = "소고기"
    private var vegetables: String = "양파, 양상추, 토마토"
    private var sauce: String = "케첩, 마요네즈"
    private var topping: String = ""
    
    func setBun(_ bun: String) -> HamburgerBuilder {
        self.bun = bun
        return self
    }
    func setMeat(_ meat: String) -> HamburgerBuilder {
        self.meat = meat
        return self
    }
    func setVegetables(_ vegetables: String) -> HamburgerBuilder {
        self.vegetables = vegetables
        return self
    }
    func setSauce(_ sauce: String) -> HamburgerBuilder {
        self.sauce = sauce
        return self
    }
    func setTopping(_ topping: String) -> HamburgerBuilder {
        self.topping = topping
        return self
    }
    
    func build() -> Hamburger {
        return Hamburger(bun: bun, meat: meat, vegetables: vegetables, sauce: sauce, topping: topping)
    }
    
    func recipe() {
        print("빵: \(bun)\n패티: \(meat)\n야채: \(vegetables)\n소스: \(sauce)\n토핑: \(topping)\n")
    }
}

let builder: HamburgerBuilder = HamburgerBuilder()


let normalBurger: Hamburger = builder.build()


let cheeseBurger: Hamburger = builder.setBun("깨빵")
    .setSauce("불고기")
    .setTopping("치즈").build()






//let hamburger: Hamburger = Hamburger(bun: "깨빵", meat: "소고기", vegetables: "토마토", sauce: "불고기소스", topping: "버섯")
