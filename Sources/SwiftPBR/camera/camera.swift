//
// Created by rainzhong on 2020/2/12.
//

import Foundation

protocol Camera{
    var position: Point3f { get set }
    var up: Vector3f { get set }
    var direction: Vector3f { get set }
    var horizon: Vector3f { get set }

    func generateRay(screenCoord: Point2f) -> Ray
}