    -- Generated by Level Director v2.0.2 on 4/28/2013 5:07:11 PM

module(..., package.seeall)
require ("config")



imgSubFolder = ""
spriteSheets={}
spriteSets={}

if (application.LevelDirectorSettings.imagesSubfolder ~= nil) then
    imgSubFolder = application.LevelDirectorSettings.imagesSubfolder
    imgSubFolder = imgSubFolder .. "/"
end

function CreateLevel(physics)

    display.setDefault( 'background', 105,105,105 )
    physics.setGravity(0,0.5)
    local collFilter = nil
    local level = display.newGroup()
    level.layers = {}
    level.name = "lossBuild"

    ---- Layer : bg ----
    level.layers["bg"] = display.newGroup()
    level.layers["bg"].name = "bg"

    level.layers["bg"].objects = {}

    level.layers["bg"].objects["water1"] = display.newImageRect( imgSubFolder .. "water.png",640,960 )
    level.layers["bg"].objects["water1"].x = 192
    level.layers["bg"].objects["water1"].y = 4
    level.layers["bg"].objects["water1"].name = "water1"
    level.layers["bg"]:insert(level.layers["bg"].objects["water1"])

    level.layers["bg"].objects["water2"] = display.newImageRect( imgSubFolder .. "water2.png",640,960 )
    level.layers["bg"].objects["water2"].x = 191
    level.layers["bg"].objects["water2"].y = -952
    level.layers["bg"].objects["water2"].name = "water2"
    level.layers["bg"]:insert(level.layers["bg"].objects["water2"])

    level:insert(level.layers["bg"])


    ---- Layer : fg ----
    level.layers["fg"] = display.newGroup()
    level.layers["fg"].name = "fg"

    level.layers["fg"].objects = {}

    level.layers["fg"].objects["y"] = display.newImageRect( imgSubFolder .. "Y.png",52,77 )
    level.layers["fg"].objects["y"].x = 90
    level.layers["fg"].objects["y"].y = 118
    local y_shape = {-21,-21.5,-16,-23.5,18,-23.5,22,-20.5,22,-16.5,2,31.5,0,31.5,-21,-16.5    }
    physics.addBody(level.layers["fg"].objects["y"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = y_shape})
    level.layers["fg"].objects["y"].gravityScale = 2
    level.layers["fg"].objects["y"].name = "y"
    level.layers["fg"]:insert(level.layers["fg"].objects["y"])

    level.layers["fg"].objects["o1"] = display.newImageRect( imgSubFolder .. "O.png",55,56 )
    level.layers["fg"].objects["o1"].x = 156
    level.layers["fg"].objects["o1"].y = 92
    local o1_shape = {-18.5,-5,-1.5,-26,6.5,-26,23.5,-7,23.5,6,5.5,22,-0.5,22,-18.5,-4    }
    physics.addBody(level.layers["fg"].objects["o1"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = o1_shape})
    level.layers["fg"].objects["o1"].gravityScale = 2
    level.layers["fg"].objects["o1"].name = "o1"
    level.layers["fg"]:insert(level.layers["fg"].objects["o1"])

    level.layers["fg"].objects["u"] = display.newImageRect( imgSubFolder .. "U.png",62,62 )
    level.layers["fg"].objects["u"].x = 223
    level.layers["fg"].objects["u"].y = 127
    local u_shape = {-21,12,-11,-29,16,-29,22,-25,22,10,12,24,-11,24,-21,13    }
    physics.addBody(level.layers["fg"].objects["u"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = u_shape})
    level.layers["fg"].objects["u"].gravityScale = 2
    level.layers["fg"].objects["u"].name = "u"
    level.layers["fg"]:insert(level.layers["fg"].objects["u"])

    level.layers["fg"].objects["l"] = display.newImageRect( imgSubFolder .. "L.png",49,67 )
    level.layers["fg"].objects["l"].x = 72
    level.layers["fg"].objects["l"].y = 258
    local l_shape = {-17.5,20.5,-13.5,-23.5,-5.5,-23.5,21.5,20.5,21.5,23.5,-4.5,30.5,-6.5,30.5,-17.5,22.5    }
    physics.addBody(level.layers["fg"].objects["l"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = l_shape})
    level.layers["fg"].objects["l"].name = "l"
    level.layers["fg"]:insert(level.layers["fg"].objects["l"])

    level.layers["fg"].objects["o2"] = display.newImageRect( imgSubFolder .. "O.png",56,59 )
    level.layers["fg"].objects["o2"].x = 124
    level.layers["fg"].objects["o2"].y = 254
    local o2_shape = {-19,-5.5,-1,-27.5,5,-27.5,24,-7.5,24,6.5,5,23.5,1,23.5,-19,-3.5    }
    physics.addBody(level.layers["fg"].objects["o2"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = o2_shape})
    level.layers["fg"].objects["o2"].name = "o2"
    level.layers["fg"]:insert(level.layers["fg"].objects["o2"])

    level.layers["fg"].objects["s"] = display.newImageRect( imgSubFolder .. "S.png",51,63 )
    level.layers["fg"].objects["s"].x = 186
    level.layers["fg"].objects["s"].y = 272
    local s_shape = {-21.5,11.5,-18.5,-24.5,2.5,-24.5,18.5,-14.5,22.5,15.5,9.5,29.5,-5.5,29.5,-21.5,12.5    }
    physics.addBody(level.layers["fg"].objects["s"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = s_shape})
    level.layers["fg"].objects["s"].name = "s"
    level.layers["fg"]:insert(level.layers["fg"].objects["s"])

    level.layers["fg"].objects["e"] = display.newImageRect( imgSubFolder .. "E.png",60,55 )
    level.layers["fg"].objects["e"].x = 254
    level.layers["fg"].objects["e"].y = 252
    local e_shape = {-16,-14.5,-12,-22.5,13,-22.5,17,13.5,17,16.5,15,20.5,-7,20.5,-16,-13.5    }
    physics.addBody(level.layers["fg"].objects["e"],"dynamic",{density = 1, friction = 0, bounce = 1, shape = e_shape})
    level.layers["fg"].objects["e"].name = "e"
    level.layers["fg"]:insert(level.layers["fg"].objects["e"])

    level:insert(level.layers["fg"])


    return level

end -- CreateLevel

