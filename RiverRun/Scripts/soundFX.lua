local function buildSFX()
   local woodHit = audio.loadSound( "Audio/SoundFX/woodhit.mp3" )
   function playWoodHit()
      audio.play(woodHit)
   end
   
   local sounds = {}
   sounds.woodHit = playWoodHit
   
   return sounds
end

return buildSFX()