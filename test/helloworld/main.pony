trait GetX[A: Arithmetic]
  fun box get_x(): this->A

class Helper[A: Arithmetic] is GetX[A]
  var x: A
  var y: (Main | None)

  new create(x': A, y': Main) =>
    x = x'
    y = y'

  fun box get_x(): this->A =>
    if x > 10 then return x else return x + 1 end

actor Main
  var x: I32
  var y: GetX[I32]
  var z: Bool

  /*new create(env: Env) =>*/
  new create(argc: I32) =>
    var q = 1
    var r: U64 = if argc == 0 then 1 else 2 end + 1
    q = 100 / (r * 0)
    r = q = r
    x = (argc xor 0xF) + (7 % -3) + (argc / not 3)
    z = not (x > 2) or (x <= 7) xor (x != 99)
    y = Helper[I32](9, this)
    x = y.get_x()

  /*be hello() => z = False*/