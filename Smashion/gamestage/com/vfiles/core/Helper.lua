-- FUNCTIONS.LUA
-- GENERIC UTILITY HELPER FUNCTIONS

-- CHECK IF IPHONE IS LETTERBOX
-- function checkForLetterBox(imgSrc)
--    local imgSrc = imgSrc
--    if( deviceInfo.screenScale == "letterbox" ) then
--    		print('This device is Letterbox!')
--       imgSrc = imgSrc:gsub(".png", "@2x-letter.png")
--    end
--    return imgSrc
-- end


-- COMMA VALUE for FORMATTING TARGET SCORE
function comma_value(amount)
    local formatted = amount
    while true do  
            formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
            if (k==0) then
                    break
            end
    end
    return formatted
end

-- COPY TABLE (SIMPLE CLONE)
function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- COPY TABLE WITH RECURSIVE (DEEP)
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- CHECK MEMORY FUNCTION 
function memoryUsageMonitor()  
  function checkMemory()
    collectgarbage( "collect" )
    local memUsage_str = string.format( "MEMORY = %.3f KB", collectgarbage( "count" ) )
    print( memUsage_str, "TEXTURE = "..(system.getInfo("textureMemoryUsed") / (1024 * 1024) ) )
  end
  timer.performWithDelay( 1000, checkMemory, 0 )
end


-- COMPARE FUNCTION FOR SORTING TABLES
function compare( a, b )
    return a < b
end



--// CHILL CODE ™ //--
-- table.ordered( [comp] ) 
--
-- Lua 5.x add-on for the table library.
-- Table using sorted index.  Uses binary table for fast Lookup.
-- http://lua-users.org/wiki/OrderedTable by PhilippeFremy 

-- table.ordered( [comp] )
-- Returns an ordered table. Can only take strings as index.
-- fcomp is a comparison function behaves behaves just like
-- fcomp in table.sort( t [, fcomp] ).
function table.ordered(fcomp)
  local newmetatable = {}
  
  -- sort func
  newmetatable.fcomp = fcomp

  -- sorted subtable
  newmetatable.sorted = {}

  -- behavior on new index
  function newmetatable.__newindex(t, key, value)
    if type(key) == "string" then
      local fcomp = getmetatable(t).fcomp
      local tsorted = getmetatable(t).sorted
      table.binsert(tsorted, key , fcomp)
      rawset(t, key, value)
    end
  end

  -- behaviour on indexing
  function newmetatable.__index(t, key)
    if key == "n" then
      return table.getn( getmetatable(t).sorted )
    end
    local realkey = getmetatable(t).sorted[key]
    if realkey then
      return realkey, rawget(t, realkey)
    end
  end

  local newtable = {}

  -- set metatable
  return setmetatable(newtable, newmetatable)
end 
    
--// table.binsert( table, value [, comp] )
--
-- LUA 5.x add-on for the table library.
-- Does binary insertion of a given value into the table
-- sorted by [,fcomp]. fcomp is a comparison function
-- that behaves like fcomp in in table.sort(table [, fcomp]).
-- This method is faster than doing a regular
-- table.insert(table, value) followed by a table.sort(table [, comp]).
function table.binsert(t, value, fcomp)
  -- Initialise Compare function
  local fcomp = fcomp or function( a, b ) return a < b end

  --  Initialise Numbers
  local iStart, iEnd, iMid, iState =  1, table.getn( t ), 1, 0

  -- Get Insertposition
  while iStart <= iEnd do
    -- calculate middle
    iMid = math.floor( ( iStart + iEnd )/2 )

    -- compare
    if fcomp( value , t[iMid] ) then
      iEnd = iMid - 1
      iState = 0
    else
      iStart = iMid + 1
      iState = 1
    end
  end

  local pos = iMid+iState
  table.insert( t, pos, value )
  return pos
end

-- Iterate in ordered form
-- returns 3 values i, index, value
-- ( i = numerical index, index = tableindex, value = t[index] )
function orderedPairs(t)
  return orderedNext, t
end
function orderedNext(t, i)
  i = i or 0
  i = i + 1
  local index = getmetatable(t).sorted[i]
  if index then
    return i, index, t[index]
  end
end