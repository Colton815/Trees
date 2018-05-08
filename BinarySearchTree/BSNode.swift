//
//  BSNode.swift
//  BinarySearchTree
//
//  Created by Colton Walker on 4/30/18.
//  Copyright © 2018 Colton Walker. All rights reserved.
//

import Foundation

class BSNode<T: Comparable>{
    
    var value: T
    var parent: BSNode?
    var leftChild: BSNode?
    var rightChild: BSNode?
    
    convenience init(value: T){
        self.init(value: value, parent: nil, leftChild: nil, rightChild: nil)
    }
    
    private init(value: T, parent: BSNode?, leftChild: BSNode?, rightChild: BSNode?){
        
        self.value = value
        self.parent = parent
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    func insertNode(value: T){
        if let _ = parent {
            return
        } else {
            addNode(value: value)
        }
    }
    
    func addNode(value:T){
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            } else {
                let newNode = BSNode(value: value)
                newNode.parent = self
                self.leftChild = newNode
            }
        } else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            } else {
                let newNode = BSNode(value: value)
                newNode.parent = self
                self.rightChild = newNode
            }
        }
    }
    
    func search(find value: T)-> BSNode?{
        if value == self.value {
            return self
        }
        if value < self.value{
            guard let leftChild = leftChild else { return nil }
            return leftChild.search(find: value)
        } else {
            guard let rightChild = rightChild else { return nil }
            return rightChild.search(find: value)
        }
    }
    
    func deleteNode(){
        
        if let leftChild = leftChild {
            if let _ = rightChild {
                exchangeWithSuccessor()
            } else {
                connectToParent(child: leftChild)
            }
        } else if let rightChild = rightChild {
            connectToParent(child: rightChild)
        } else {
            connectToParent(child: nil)
        }
        self.parent = nil
        self.leftChild = nil
        self.rightChild = nil
    }
    
    func exchangeWithSuccessor(){
        guard let leftChild = self.leftChild, let rightChild = self.rightChild else {
            return
        }
        
        let successor = rightChild.minimum()
        successor.deleteNode()
        
        successor.leftChild = leftChild
        leftChild.parent = successor
        
        if rightChild !== successor {
            successor.rightChild = rightChild
            rightChild.parent = successor
        } else {
            successor.rightChild = nil
        }
        connectToParent(child: successor)
    }
    
    func minimum()->BSNode{
        if let leftChild = leftChild {
            return leftChild.minimum()
        } else {
            return self
        }
    }
    
    func maximum()->BSNode{
        if let rightChild = rightChild {
            return rightChild.maximum()
        } else {
            return self
        }
    }
    
    func minimumValue()->T{
        if let leftChild = leftChild {
            return leftChild.minimumValue()
        } else {
            return self.value
        }
    }
    
    func maximumValue()->T{
        if let rightChild = rightChild {
            return rightChild.maximumValue()
        } else {
            return self.value
        }
    }
    
    func connectToParent(child:BSNode?){
        guard let parent = self.parent else {
            child?.parent = self.parent
            return
        }
        
        if parent.leftChild === self {
            parent.leftChild = child
            child?.parent = parent
        } else if parent.rightChild === self {
            parent.rightChild = child
            child?.parent = parent
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
            print("Found \(value)")
            deleteNode()
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
    
    class func traversePreOrder(node: BSNode?){
        guard let node = node else { return }
        
        print(node.value)
        BSNode.traversePreOrder(node: node.leftChild)
        BSNode.traversePreOrder(node: node.rightChild)
    }
    
    class func traverseInOrder(node: BSNode?){
        guard let node = node else { return }
        
        BSNode.traverseInOrder(node: node.leftChild)
        print(node.value)
        BSNode.traverseInOrder(node: node.rightChild)
    }
    
    class func traversePostOrder(node: BSNode?){
        guard let node = node else { return }
        
        BSNode.traversePostOrder(node: node.leftChild)
        BSNode.traversePostOrder(node: node.rightChild)
        print(node.value)
    }
}
















