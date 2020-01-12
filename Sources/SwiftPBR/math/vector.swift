//
// Created by rainzhong on 2020/1/12.
//

import Foundation

typealias DataType = Float



struct Vector2{
    var data:[DataType]

    var x:DataType{
        get{ data[0] }
        set{ data[0] = newValue }
    }

    var y:DataType{
        get{ data[1] }
        set{ data[1] = newValue }
    }

    var lengthSquare:DataType{
        get{ x * x + y * y }
    }
    var length:DataType{
        get{ lengthSquare.squareRoot() }
    }

    init(){
        data = [DataType](repeating: 0.0, count: 2)
    }

    init(data:[DataType]){
        assert(data.count == 2, "Invalid Array")
        self.data = data
    }

    init(x: DataType = 0, y:DataType = 0){
        data = [DataType]()
        data.append(x)
        data.append(y)
    }

    static func +(left: Vector2,right: Vector2)-> Vector2{
        Vector2(x: right.x + left.x, y: right.y + left.y)
    }

    static func -(left: Vector2,right: Vector2)-> Vector2{
        Vector2(x: left.x - right.x, y: left.y - right.y)
    }

    static prefix func -(vec: Vector2) -> Vector2{
        Vector2(x: -vec.x, y: -vec.y)
    }

    static func *(left: Vector2,right: Vector2)-> Vector2{
        Vector2(x: left.x * right.x, y: left.y * right.y)
    }

    static func *(left: Vector2,right: DataType)-> Vector2{
        Vector2(x: left.x * right, y: left.y * right)
    }

    static func *(left: DataType,right: Vector2)-> Vector2{
        Vector2(x: left * right.x, y: left * right.y)
    }

    static func /(left: Vector2,right: DataType)-> Vector2{
        Vector2(x: left.x / right, y: left.y / right)
    }

    static func /(left: Vector2,right: Vector2)-> Vector2{
        Vector2(x: left.x / right.x, y: left.y / right.y)
    }


    static func +=(left:inout Vector2,right: Vector2){
        left = left + right
    }

    static func -=(left:inout Vector2, right: Vector2){
        left = left - right
    }

    static func *=(left:inout Vector2, right: Vector2){
        left = left * right
    }

    static func *=(left:inout Vector2, right: DataType){
        left = left * right
    }

    static func /=(left:inout Vector2, right: Vector2){
        left = left / right
    }

    static func /=(left:inout Vector2, right: DataType){
        left = left / right
    }

    static func ==(left: Vector2, right: Vector2) -> Bool{
        (left.x == right.x) && (left.y == right.y)
    }

    static func !=(left: Vector2, right: Vector2) -> Bool{
        !(left == right)
    }

    mutating func normalize(){
        let len = length
        if(len != 0) {
            data[0] /= len
            data[1] /= len
        }
    }

    subscript(index: Int) -> DataType {
        get {
            assert(index >= 0 && index < 2, "Index Out of Range")
            return data[index]
        }
        set{
            assert(index >= 0 && index < 2, "Index Out of Range")
            data[index] = newValue
        }
    }

}


struct Vector3{
    var data:[DataType]

    var x:DataType{
        get { data[0] }
        set { data[0] = newValue }
    }

    var y:DataType{
        get { data[1] }
        set { data[1] = newValue }
    }

    var z:DataType{
        get { data[2] }
        set { data[2] = newValue }
    }

    var lengthSquare:DataType{
        x * x + y * y + z * z
    }

    var length:DataType{
        lengthSquare.squareRoot()
    }

    init(){
        data = [DataType](repeating: 0, count: 3)
    }

    init(data:[DataType]){
        assert(data.count == 3,"Invalid Array")
        self.data = data
    }

    init(x: DataType = 0, y: DataType = 0, z:DataType = 0){
        data = [DataType]()
        data.append(x)
        data.append(y)
        data.append(z)
    }


    static func +(left: Vector3,right: Vector3)-> Vector3{
        Vector3(x: right.x + left.x, y: right.y + left.y,z: left.z + right.z)
    }

    static func -(left: Vector3,right: Vector3)-> Vector3{
        Vector3(x: left.x - right.x, y: left.y - right.y,z: left.z - right.z)
    }

    static prefix func -(vec: Vector3) -> Vector3{
        Vector3(x: -vec.x, y: -vec.y, z: -vec.z)
    }

    static func *(left: Vector3,right: Vector3)-> Vector3{
        Vector3(x: left.x * right.x, y: left.y * right.y,z: left.z * right.z)
    }

    static func *(left: Vector3,right: DataType)-> Vector3{
        Vector3(x: left.x * right, y: left.y * right, z: left.z * right)
    }

    static func *(left: DataType,right: Vector3)-> Vector3{
        Vector3(x: left * right.x, y: left * right.y, z: left * right.z)
    }

    static func /(left: Vector3,right: DataType)-> Vector3{
        Vector3(x: left.x / right, y: left.y / right, z: left.z / right)
    }

    static func /(left: Vector3,right: Vector3)-> Vector3{
        Vector3(x: left.x / right.x, y: left.y / right.y, z: left.z / right.z)
    }


    static func +=(left:inout Vector3,right: Vector3){
        left = left + right
    }

    static func -=(left:inout Vector3, right: Vector3){
        left = left - right
    }

    static func *=(left:inout Vector3, right: Vector3){
        left = left * right
    }

    static func *=(left:inout Vector3, right: DataType){
        left = left * right
    }

    static func /=(left:inout Vector3, right: Vector3){
        left = left / right
    }

    static func /=(left:inout Vector3, right: DataType){
        left = left / right
    }

    static func ==(left: Vector3, right: Vector3) -> Bool{
        (left.x == right.x) && (left.y == right.y) && (left.z == right.z)
    }

    static func !=(left: Vector3, right: Vector3) -> Bool{
        !(left == right)
    }


    mutating func normalize(){
        let len = length
        for i in 0..<3{
            data[i] /= len
        }
    }

    subscript(index: Int) -> DataType {
        get {
            assert(index >= 0 && index < 3, "Index Out of Range")
            return data[index]
        }
        set{
            assert(index >= 0 && index < 3, "Index Out of Range")
            data[index] = newValue
        }
    }

}



func normalize(vector: Vector2) -> Vector2{
    var ret = vector
    ret.normalize()
    return ret
}

func normalize(vector: Vector3) -> Vector3{
    var ret = vector
    ret.normalize()
    return ret
}

func dot(vec1: Vector2, vec2: Vector2) -> DataType{
    vec1.x * vec2.x + vec1.y * vec2.y
}

func dot(vec1: Vector3, vec2: Vector3) -> DataType{
    vec1.x * vec2.x + vec1.y * vec2.y + vec1.z * vec2.z
}

func cross(vec1: Vector3, vec2: Vector3) -> Vector3{
    let x = vec1[1] * vec2[2] - vec2[1] * vec1[2]
    let y = vec1[2] * vec2[0] - vec1[0] * vec2[2]
    let z = vec1[0] * vec2[1] - vec2[0] * vec1[1]

    return Vector3(x: x, y: y, z: z)
}


func lerp(t:DataType, p0:Vector2, p1: Vector2) -> Vector2{
    (1 - t) * p0 + t * p1
}


func lerp(t:DataType, p0:Vector3, p1: Vector3) -> Vector3{
    (1 - t) * p0 + t * p1
}

func abs(vec: Vector3) -> Vector3{
    Vector3(x:abs(vec.x),y: abs(vec.y), z: abs(vec.z))
}

func distance(p0: Vector2, p1: Vector2) -> DataType{
    (p0 - p1).length
}

func distance(p0: Vector3, p1: Vector3) -> DataType{
    (p0 - p1).length
}


typealias Vector2f = Vector2
typealias Point2f = Vector2

typealias Vector3f = Vector3
typealias Point3f = Vector3
typealias Normal3f = Vector3
