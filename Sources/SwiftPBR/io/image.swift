//
// Created by rainzhong on 2020/2/12.
//

import Foundation

class Image{

    private let width: Int
    private let height: Int
    private var data:[Vector3]

    init(width: Int, height: Int){
        assert(width > 0 && height > 0)
        self.width = width
        self.height = height
        data = [Vector3](repeating: Vector3(), count: width * height)
    }

    func setColor(x: Int, y: Int, color: Vector3){
        if x >= 0 && x < width && y >= 0 && y < height{
            let index = x + y * width
            data[index].x = color.x
            data[index].y = color.y
            data[index].z = color.z
        }
    }

    func getColor(x: Int, y: Int) -> Vector3{
        if x >= 0 && x < width && y >= 0 && y < height{
            return data[x + y * width]
        }

        return Vector3()
    }


    func saveAsPPM(filename: String) -> Bool{
        var fileData = Data()
        fileData.append(contentsOf: "P3\n\(width) \(height)\n255\n".data(using: .ascii, allowLossyConversion: true)!)
        for j in 0..<height{
            for i in 0..<width{
                let index = j * width + i
                let r = Int(data[index].x * 255)
                let g = Int(data[index].y * 255)
                let b = Int(data[index].z * 255)
                fileData.append(contentsOf: "\(r) \(g) \(b)\n"
                        .data(using: .ascii, allowLossyConversion: true)!)
            }
        }

        do {
            try fileData.write(to: URL(fileURLWithPath: filename))

        } catch let e{
            print(e.localizedDescription)
            return false
        }

        return true
    }

}