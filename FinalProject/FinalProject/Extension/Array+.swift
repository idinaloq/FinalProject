//
//  Array+.swift
//  FinalProject
//
//  Created by idinaloq on 2023/10/17.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
