//
// Created by rainzhong on 2020/2/12.
//

import Foundation

class Transform{
    private var m: Matrix
    private var invM: Matrix

    var M: Matrix{get { m }}
    var InvM: Matrix {get{ invM }}

    init(){
        m = Matrix(scale: 1)
        invM = Matrix(scale: 1)
    }

    init(matrix: Matrix){
        m = matrix
        invM = transpose(m:inverse(m: matrix))
    }

    init(matrix: Matrix, invMatrix: Matrix){
        m = matrix
        invM = invMatrix
    }

    func transformPoint(point: Point3f) -> Point3f{
        var result = [DataType](repeating: 0, count: 4)
        for i in 0..<4{
            for j in 0..<3{
                result[i] += m[i,j] * point[j]
            }
            result[i] += m[i,3]
        }

        assert(result[3] != 0)
        if result[3] == 1{
            return Point3f(x: result[0], y: result[1], z: result[2])
        }else {
            return Point3f(x: result[0] / result[3], y: result[1] / result[3], z: result[2] / result[3])
        }
    }

    func transformVector(vector: Vector3f) -> Vector3f{
        var result = [DataType](repeating: 0, count: 3)
        for i in 0..<3{
            for j in 0..<3{
                result[i] += m[i,j] * vector[j]
            }
        }

        return Vector3f(data: result)
    }

    func transformNormal(normal: Normal3f) -> Normal3f{
        var result = [DataType](repeating: 0, count: 3)
        for i in 0..<3{
            for j in 0..<3{
                result[i] += invM[i,j] * normal[j]
            }
        }

        return Normal3f(data: result)
    }

    static func *(t1: Transform, t2: Transform) -> Transform{
        Transform(matrix: t1.m * t2.m, invMatrix: t2.invM * t1.invM)
    }

}

func inverse(transform: Transform) -> Transform{
    Transform(matrix: transform.InvM, invMatrix: transform.M)
}

func translate(d: Vector3f) -> Transform{
    var m = Matrix(scale: 1)
    for i in 0..<3{
        m[i,3] = d[i]
    }
    return Transform(matrix: m)
}

func scale(vector: Vector3f) -> Transform{
    var m = Matrix()
    var invM = Matrix()
    for i in 0..<3{
        m[i,i] = vector[i]
        invM[i,i] = 1 / vector[i]
    }

    return Transform(matrix: m, invMatrix: invM)
}

func rotateX(theta: CGFloat) -> Transform{
    var m = Matrix(scale: 1)
    let s = DataType(sin(theta))
    let c = DataType(cos(theta))
    m[1,1] = c
    m[1,2] = -s
    m[2,1] = s
    m[2,2] = c
    return Transform(matrix: m, invMatrix: transpose(m: m))
}

func rotateY(theta: CGFloat) -> Transform{
    var m = Matrix(scale: 1)
    let s = DataType(sin(theta))
    let c = DataType(cos(theta))
    m[0,0] = c
    m[0,2] = s
    m[2,0] = -s
    m[2,2] = c
    return Transform(matrix: m, invMatrix: transpose(m: m))
}

func rotateZ(theta: CGFloat) -> Transform{
    var m = Matrix(scale: 1)
    let s = DataType(sin(theta))
    let c = DataType(cos(theta))
    m[0,0] = c
    m[0,1] = -s
    m[1,0] = s
    m[1,1] = c
    return Transform(matrix: m, invMatrix: transpose(m: m))
}