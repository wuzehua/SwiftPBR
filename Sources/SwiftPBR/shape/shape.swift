//
// Created by rainzhong on 2020/2/12.
//

import Foundation

protocol Shape {
    var obj2World: Transform { get set }
    var world2Obj: Transform { get set }

    func getObjBound() -> Bound3
    func getArea() -> DataType
    func intersect(ray: Ray, surfaceInteraction: SurfaceInteraction?) -> Bool
    func intersectP(ray:Ray) -> Bool
}
