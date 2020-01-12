//
// Created by rainzhong on 2020/1/12.
//

import Foundation

struct Matrix{
    var data:[DataType]

    init(scale: DataType = 1){
        data = [DataType]()
        for i in 0...3{
            for j in 0...3{
                if i == j{
                    data.append(scale)
                }else{
                    data.append(0)
                }
            }
        }
    }

    static func +(left: Matrix, right: Matrix) -> Matrix{
        var ret = Matrix()
        for i in 0...3{
            for j in 0...3{
                ret[i,j] = left[i,j] + right[i,j]
            }
        }

        return ret
    }

    static func -(left: Matrix, right: Matrix) -> Matrix{
        var ret = Matrix()
        for i in 0...3{
            for j in 0...3{
                ret[i,j] = left[i,j] - right[i,j]
            }
        }

        return ret
    }


    static func *(left: Matrix, right: Matrix) -> Matrix{
        var ret = Matrix(scale: 0)
        for i in 0...3{
            for j in 0...3{
                for k in 0...3{
                    ret[i,j] += left[i,k] * right[k,j]
                }
            }
        }

        return ret
    }



    subscript(row: Int, col: Int) -> DataType {
        get {
            assert(row >= 0 && row <= 3 && col >= 0 && col <= 3, "Index Out of Range")
            return data[4 * row + col]
        }
        set{
            assert(row >= 0 && row <= 3 && col >= 0 && col <= 3, "Index Out of Range")
            data[4 * row + col] = newValue
        }
    }

}

func transpose(m: Matrix) -> Matrix{
    var ret = Matrix()
    for i in 0...3{
        for j in 0...3{
            ret[i,j] = m[j,i]
        }
    }

    return ret
}

func inverse(m: Matrix) -> Matrix{

}