//
//  main.swift
//  BinarySearchTree
//
//  Created by Colton Walker on 4/30/18.
//  Copyright © 2018 Colton Walker. All rights reserved.
//

import Foundation

//var rootNode = BSNode(value: 20)
//rootNode.insertNode(value: 34)
//rootNode.insertNode(value: 54)
//rootNode.insertNode(value: 46)
//rootNode.insertNode(value: 94)
//rootNode.insertNode(value: 12)
//rootNode.insertNode(value: 5)
//rootNode.insertNode(value: 10)
//
//BSNode.traverseInOrder(node: rootNode)
//print("____________________________")
//let search = 54
//rootNode.findAndDelete(value: search)
//BSNode.traverseInOrder(node: rootNode)
//print("____________________________")

var newRoot = BSTNode(value: 20)
newRoot.insertNode(value: 34)
newRoot.insertNode(value: 54)
newRoot.insertNode(value: 46)
newRoot.insertNode(value: 94)
newRoot.insertNode(value: 12)
newRoot.insertNode(value: 5)
newRoot.insertNode(value: 10)

BSTNode.traverseInOrder(node: newRoot)
print("____________________________")
let search = 54
newRoot.findAndDelete(value: search)
BSTNode.traverseInOrder(node: newRoot)
print("____________________________")

//print("height", newRoot.height())
//print("min depth", newRoot.maximum().depth())
