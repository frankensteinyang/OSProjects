// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ************************************
/**
*  函数作为返回值
*/
func go2Work() {
    println("上班！")
}

func go2Bed() {
    println("睡觉！")
}

func how2Do(time: Int) -> Void -> Void {
    if time > 9 && time < 18 {
        return go2Work
    } else {
        return go2Bed
    }
}

var fn = how2Do(10)
fn()
// ************************************


// ************************************
/**
函数重载
函数名相同，函数类型不同
*/
// 函数名：sum
// 函数类型：（Int, Int）-> Int
func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

// 函数名：sum
// 函数类型：（Int, Int）-> Double
func sum(num1: Int, num2: Int) -> Double {
    return Double(num1) + Double(num2)
}

// 在Java中，sum(10, 20)这样的函数重载编译不通过

var a: Int = sum(10, 20)
var b: Double = sum(10, 20)
// ************************************
