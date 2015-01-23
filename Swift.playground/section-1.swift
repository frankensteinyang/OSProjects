// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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
