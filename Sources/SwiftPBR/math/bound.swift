//
// Created by rainzhong on 2020/2/12.
//

import Foundation

struct Bound2{
    private var pMin: Vector2f
    private var pMax: Vector2f

    init(){
        pMin = Vector2f(x: DataType.greatestFiniteMagnitude, y: DataType.greatestFiniteMagnitude)
        pMax = Vector2f(x: -DataType.greatestFiniteMagnitude, y: -DataType.greatestFiniteMagnitude)
    }


}

struct Bound3{
    private var pMin: Point3f
    private var pMax: Point3f

    init(){
        pMin = Vector3f(x: DataType.greatestFiniteMagnitude, y: DataType.greatestFiniteMagnitude, z: DataType.greatestFiniteMagnitude)
        pMax = Vector3f(x: -DataType.greatestFiniteMagnitude, y: -DataType.greatestFiniteMagnitude, z: -DataType.greatestFiniteMagnitude)
    }

    init(pMin: Point3f, pMax: Point3f){
        self.pMin = Vector3f(x: min(pMin.x, pMax.x), y: min(pMin.y, pMax.y), z: min(pMin.z, pMax.z))
        self.pMax = Vector3f(x: max(pMin.x, pMax.x), y: max(pMin.y, pMax.y), z: max(pMin.z, pMax.z))
    }
}