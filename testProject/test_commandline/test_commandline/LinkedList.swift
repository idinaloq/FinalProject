//
//  LinkedList.swift
//  test_commandline
//
//  Created by JSB on 2023/07/12.
//

//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/10.
//

struct LinkedList<Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: Element? {
        guard let head else {
            return nil
        }
        
        return head.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
    
    mutating func enqueue(_ data: Element) {
        let node: Node<Element> = Node(data: data)

        guard !isEmpty else {
            head = node
            tail = head
            
            return
        }
        
        tail?.next = node
        tail = node
    }
    
    mutating func dequeue() -> Element? {
        let data: Element? = head?.data
        head = head?.next

        guard !isEmpty else {
            tail = nil
            
            return data
        }
        
        return data
    }
}
