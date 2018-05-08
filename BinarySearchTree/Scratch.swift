//
//  Scratch.swift
//  BinarySearchTree
//
//  Created by Colton Walker on 5/6/18.
//  Copyright © 2018 Colton Walker. All rights reserved.
//

import Foundation

class BSTNode<T:Comparable>{
    let value: T
    var parent: BSTNode?
    var leftChild: BSTNode?
    var rightChild: BSTNode?
    
    init(value: T, parent: BSTNode?, leftChild: BSTNode?, rightChild: BSTNode?){
        self.value = value
        self.parent = parent
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    convenience init(value: T){
        self .init(value: value, parent: nil, leftChild: nil, rightChild: nil)
    }
    
    func insertNode(value: T){
        if let _ = parent {
            return
        } else {
            addNode(value: value)
        }
    }
    
    func addNode(value: T){
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = BSTNode(value: value)
                newNode.parent = self
                self.leftChild = newNode
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = BSTNode(value: value)
                newNode.parent = self
                self.rightChild = newNode
            }
        }
    }
    
    func search(value: T)->Bool{
        
        if value == self.value {
            return true
        }
        if value < self.value {
            if let leftChild = leftChild {
                return leftChild.search(value: value)
            }
        } else {
            if let rightChild = rightChild {
                return rightChild.search(value: value)
            }
        }
        return false
    }
    
    func delete(){
      
        if let leftChild = leftChild {
            if let _ = rightChild{
                exchangeWithSuccessor()
            } else {
                connectToParent(node: leftChild)
            }
        } else if let rightChild = rightChild {
            connectToParent(node: rightChild)
        } else {
            connectToParent(node: nil)
        }
        self.parent = nil
        self.leftChild = nil
        self.rightChild = nil
    }
    
    func exchangeWithSuccessor(){
        guard let leftChild = leftChild, let rightChild = rightChild else { return }
        
        let successor = rightChild.minimum()
        successor.delete()
        
        successor.leftChild = leftChild
        leftChild.parent = successor
        
        if rightChild !== successor {
            successor.rightChild = rightChild
            rightChild.parent = successor
        } else {
            successor.rightChild = nil
        }
        connectToParent(node: successor)
    }
    
    func connectToParent(node: BSTNode?){
        guard let parent = self.parent else {
            node?.parent = self.parent
            return
        }
        
        if parent.leftChild === self {
            parent.leftChild = node
            node?.parent = parent
        } else if parent.rightChild === self {
            parent.rightChild = node
            node?.parent = parent
        }
    }
    
    func minimum()->BSTNode{
        if let leftChild = leftChild {
            return leftChild.minimum()
        } else {
            return self
        }
    }
    
    func maximum()->BSTNode{
        if let rightChild = rightChild {
            return rightChild.maximum()
        } else {
            return self
        }
    }
    
    func depth()->Int{
        guard var node = parent else {
            return 0
        }
        var depth = 1
        while let parent = node.parent {
            depth += 1
            node = parent
        }
        return depth
    }
    
    func height()->Int{
        if leftChild == nil && rightChild == nil {
            return 0
        }
        return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
    }
    
    func findAndDelete(value: T){
        if value == self.value {
            print("Found and deleted \(value)")
            delete()
        }
        
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.findAndDelete(value: value)
            }
        } else {
            if let rightChild = rightChild {
                rightChild.findAndDelete(value: value)
            }
        }
    }
    
    class func traversePreOrder(node: BSTNode?){
        guard let node = node else { return }
        
        print(node.value)
        BSTNode.traversePreOrder(node: node.leftChild)
        BSTNode.traversePreOrder(node: node.rightChild)
    }
    
    class func traverseInOrder(node: BSTNode?){
        guard let node = node else { return }
        
        BSTNode.traverseInOrder(node: node.leftChild)
        print(node.value)
        BSTNode.traverseInOrder(node: node.rightChild)
    }
    
    class func traversePostOrder(node: BSTNode?){
        guard let node = node else { return }
        
        BSTNode.traversePostOrder(node: node.leftChild)
        BSTNode.traversePostOrder(node: node.rightChild)
        print(node.value)
    }
    
    
}
