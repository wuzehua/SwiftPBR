//
// Created by rainzhong on 2020/2/12.
//

import Foundation

struct Ray{
    var origin: Point3f
    var direction: Vector3
    var time: DataType
    var tMax: DataType

    func getPoint(t: DataType) -> Point3f{
        origin + t * direction
    }
}