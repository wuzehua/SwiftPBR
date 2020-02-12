//
// Created by rainzhong on 2020/2/12.
//

import Foundation

class Interaction{
    var hitPoint: Point3f
    var normal: Normal3f
    var wo: Vector3
    var time: DataType
    var tHit: DataType

    init(point: Point3f, normal: Normal3f, wo: Vector3, time: DataType){
        self.hitPoint = point
        self.normal = normal
        self.wo = wo
        self.time = time
        tHit = DataType.infinity
    }

    func spawnRay(direction: Vector3) -> Ray{
        Ray(origin: hitPoint, direction: direction, time: time, tMax: DataType.infinity)
    }

    func spawnRay(point: Point3f) -> Ray{
        Ray(origin: hitPoint, direction: point - hitPoint, time: time, tMax: 1 - DataType.shadowEpsilon)
    }

    func spawnRay(interaction: Interaction) -> Ray{
        Ray(origin: hitPoint, direction: interaction.hitPoint - hitPoint, time: time, tMax: 1 - DataType.shadowEpsilon)
    }

}


class SurfaceInteraction: Interaction{

}