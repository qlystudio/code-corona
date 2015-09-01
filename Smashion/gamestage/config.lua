local pixel = {
    w = display.pixelWidth,
    h = display.pixelHeight
}
local fpsRate = 60

application = {}
deviceInfo = {}

if pixel.w/pixel.h > 0.6 then
  deviceInfo.screenScale = "letterbox"
else
  deviceInfo.screenScale = "wide"
end


print("SCREEN SIZE", pixel.w, pixel.h)
print("SCREEN SCALE", deviceInfo.screenScale)

-- if string.sub(system.getInfo("model"),1,2) == "iP" then
if system.getInfo("model") == "iPhone" then
    print("DEVICE FAMILY: iPhone")

    -- iPhone 3GS or lower
    if display.pixelHeight == 480 then
      application.content = {
        fps = fpsRate,
        width = 320,
        height = 480,
        scale = "letterBox"
      }
      print("DEVICE TYPE: Standard letterBox")

    -- iPhone 5 and higher
    elseif display.pixelHeight > 960 then
      application.content = {
        fps = fpsRate,
        width = 320,
        height = 568,
        scale = "letterBox",
        imageSuffix = {
            ["@2x"] = 2
        }
      }
      print("DEVICE TYPE: Retina Wide")

    -- iPhone 4 and 4s
    elseif display.pixelHeight == 960 then
      application.content = {
        fps = fpsRate,
        width = 320,
        height = 480,
        scale = "letterBox",
        imageSuffix = {
            ["@2x"] = 2
        }
      }
      print("DEVICE TYPE: Retina letterBox")

    end

elseif system.getInfo("model") == "iPad" then
  print("DEVICE FAMILY: iPad")
  application.content = {
    fps = fpsRate,
    width = 360,
    height = 480,
    scale = "letterBox",
    imageSuffix = {
        ["@2x"] = 2
    }
  }
  print("DEVICE TYPE: iPad")

else
  --everyting else, Android
  print("DEVICE TYPE: Android")
  application.content = {
    fps = fpsRate,
    width = 320,
    height = 568,
    scale = "letterBox",
    imageSuffix = {
        ["@2x"] = 2
    }
  }

end

print('==================================================')