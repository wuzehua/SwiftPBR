//
// Created by rainzhong on 2020/2/12.
//

import Foundation

class Sphere: Shape{

    var obj2World: Transform
    var world2Obj: Transform
    var radius: DataType

    init(obj2World: Transform, world2Obj: Transform, radius: DataType = 1){
        self.obj2World = obj2World
        self.world2Obj = world2Obj
        self.radius = radius
    }

    func getObjBound() -> Bound3 {
        Bound3(pMin: Point3f(x: -radius, y: -radius, z: -radius),
                pMax: Point3f(x: radius, y: radius, z: radius))
    }

    func getArea() -> DataType {
        4 * DataType.pi * radius * radius
    }

    func intersect(ray: Ray, surfaceInteraction: SurfaceInteraction?) -> Bool {
        true
    }

    func intersectP(ray: Ray) -> Bool {
        intersect(ray: ray, surfaceInteraction: nil)
    }


}