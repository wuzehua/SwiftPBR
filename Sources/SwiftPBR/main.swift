print("Hello, world!")
var img = Image(width: 255, height: 255)
for j in 0..<255{
    for i in 0..<255{
        let r = DataType(i) / 255
        let g = DataType(j) / 255
        img.setColor(x: i, y: j, color: Vector3(x: r, y: g, z: 0))
    }
}

if img.saveAsPPM(filename: "./output.ppm"){
    print("Save successfully")
}else{
    print("Save fail")
}