//
// Created by rainzhong on 2020/1/12.
//

import Foundation

struct Matrix{
    var data:[DataType]

    var str: String{
        get{
            var ret = ""
            for i in 0..<4{
                ret += "|"
                for j in 0..<4{
                    ret += "\(data[4 * i + j]) "
                }

                ret += "|\n"
            }

            return ret
        }
    }

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
    var U = Matrix(scale: 0)
    var L = Matrix(scale: 1)
    var L_inverse = L
    var U_inverse = U
    var ret = U

    var sum: DataType = 0

    for i in 0..<4{
        for j in i..<4{
            sum = 0
            for k in 0..<i{
                sum += (L[j,k] * U[k,j])
            }

            U[i,j] = m[i,j] - sum
        }

        for j in (i + 1)..<4{
            sum = 0
            for k in 0..<i{
                sum += (L[j,k] * U[k,i])
            }

            if(U[i,i] == 0){
                return ret
            }

            L[j,i] = (m[j,i] - sum) / U[i,i]
        }
    }

    for i in 1..<4{
        for j in 0..<i{
            sum = 0
            for k in 0..<i{
                sum += (L[i,k] * L_inverse[k,j])
            }

            L_inverse[i,j] = -sum
        }
    }

    for i in 0..<4{
        U_inverse[i,i] = 1 / U[i,i]
    }



    for i in 0..<4{

        for j in (0..<i).reversed(){
            sum = 0
            for k in (j + 1)...i{
                sum += (U[j,k] * U_inverse[k,i])
            }

            U_inverse[j,i] = -sum / U[j,j]
        }
    }

    for i in 0..<4{
        for j in 0..<4{
            for k in 0..<4{
                ret[i,j] += (U_inverse[i,k] * L_inverse[k,j])
            }
        }
    }

    return ret
}