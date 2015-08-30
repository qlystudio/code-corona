
local Explosions = {}
local device = system.getInfo("model")
local count = 10

function Explosions:explosionsInit()

	local i = 1
	
	if device == "Kindle Fire" then count = 3 end

	Particles.CreateParticleType ("ExplosionSmoke",
		{
		imagePath			= "images/smoke1_light_dark.png",
		imageWidth			= 64,	
		imageHeight			= 64,	
		directionVariation	= 360,	
		velocityVariation	= 50,
		rotationVariation	= 360,
		rotationChange		= 30,
		useEmitterRotation	= false,
		alphaStart			= 0.0,
		fadeInSpeed			= 1.5,
		fadeOutSpeed		= -0.5,
		fadeOutDelay		= 500,
		scaleStart			= 0.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= 0.01,
		scaleOutDelay		= 500,
		emissionShape		= 2,
		emissionRadius		= 30,
		killOutsideScreen	= false	,
		lifeTime			= 3000  
		} )

		Particles.CreateParticleType ("ExplosionRock1", 
		{
		imagePath		= "images/rock_partical_1.png",
		imageWidth		= 8,
		imageHeight		= 32,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart		= 0.5,
		alphaVariation		= 0.5,
		fadeInSpeed		= 0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart		= 1.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -0.5,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		blendMode		= "add",
		lifeTime		= 2000,
		} )

		Particles.CreateParticleType ("ExplosionRock2", 
		{
		imagePath		= "images/rock_partical_2.png",
		imageWidth		= 8,
		imageHeight		= 32,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart		= 0.5,
		alphaVariation		= 0.5,
		fadeInSpeed		= 0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart		= 1.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -0.5,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		blendMode		= "add",
		lifeTime		= 2000,
		} )

		Particles.CreateParticleType ("ExplosionRock3", 
		{
		imagePath		= "images/rock_partical_3.png",
		imageWidth		= 8,
		imageHeight		= 32,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart		= 0.5,
		alphaVariation		= 0.5,
		fadeInSpeed		= 0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart		= 1.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -0.5,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		blendMode		= "add",
		lifeTime		= 2000,
		} )

		Particles.CreateParticleType ("ExplosionRock4", 
		{
		imagePath		= "images/spark_with_trail.png",
		imageWidth		= 8,
		imageHeight		= 32,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart		= 0.5,
		alphaVariation		= 0.5,
		fadeInSpeed		= 0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart		= 1.5,
		scaleVariation		= 0.5,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -0.5,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		blendMode		= "add",
		lifeTime		= 2000,
		} )
		
	Particles.CreateParticleType ("ExplosionFlash", 
		{
		imagePath		= "images/flare.png",
		imageWidth		= 128,
		imageHeight		= 128,
		directionVariation	= 360,
		rotationVariation	= 360,
		rotationChange		= 0,
		useEmitterRotation	= false,
		alphaStart		= 1.0,
		fadeInSpeed		= 1.0,
		fadeOutSpeed		= -1.0,
		fadeOutDelay		= 0,
		scaleStart		= 2.0,
		scaleInSpeed		= 1.0,
		scaleOutSpeed		= -1.0,
		scaleOutDelay		= 0,
		killOutsideScreen	= false,
		blendMode		= "add",
		lifeTime		= 1000
		} )
		
	Particles.CreateParticleType ("ElectricSparks", 
		{
		imagePath			= "images/electric_spark.png",
		imageWidth			= 8,
		imageHeight			= 32,
		weight				= 0.8,
		xReference			= 4,
		yReference			= 32,
		velocityStart			= 150,
		velocityVariation		= 100,
		directionVariation		= 360,
		autoOrientation			= true,
		useEmitterRotation		= false,
		rotationVariation	= 360,
		rotationChange		= -180,
		alphaStart			= 1.0,
		fadeOutSpeed			= -1.0,
		fadeOutDelay			= 250,
		scaleStart			= 0.2,
		scaleVariation			= 0.3,
		scaleChange			= -1.0,
		emissionShape			= 0,
		killOutsideScreen		= true,
		blendMode			= "add",
		lifeTime			= 1000
		} )

	Particles.CreateParticleType ("SmallRocks", 
		{
		imagePath			= "images/rock_small_partical.png",
		imageWidth			= 15,
		imageHeight			= 15,
		directionVariation	= 360,
		velocityStart		= 200,
		velocityVariation	= 150,
		velocityChange		= 0.2,
		rotationVariation	= 360,
		rotationChange		= -180,
		autoOrientation		= true,
		useEmitterRotation	= false,
		alphaStart		= 1,
		alphaVariation		= 1,
		fadeInSpeed		= 0,
		fadeOutSpeed		= 0,
		fadeOutDelay		= 0,
		scaleStart		= 1,
		scaleVariation		= 0,
		killOutsideScreen	= false,
		lifeTime		= 1000,
		} )

		Particles.CreateParticleType ("MedRocks", 
			{
			imagePath			= "images/rock_medium_partical.png",
			imageWidth			= 25,
			imageHeight			= 25,
			directionVariation	= 360,
			velocityStart		= 200,
			velocityVariation	= 150,
			velocityChange		= 0.2,
			rotationVariation	= 360,
			autoOrientation		= true,
			useEmitterRotation	= false,
			alphaStart		= 1,
			alphaVariation		= 1,
			fadeInSpeed		= 0,
			fadeOutSpeed		= 0,
			fadeOutDelay		= 0,
			scaleStart		= 1,
			scaleVariation		= 0,
			killOutsideScreen	= false,
			lifeTime		= 2000,
			} )
			
	Particles.CreateParticleType ("Fire",
		{
		imagePath		= "images/fire.png",
		imageWidth		= 64,
		imageHeight		= 64,
		weight			= -0.1,
		velocityStart		= 0,
		velocityVariation	= 25,
		velocityChange		= 1.0,
		alphaStart		= 0,
		fadeInSpeed		= 1.0,
		fadeOutSpeed		= -0.75,
		fadeOutDelay		= 500,
		scaleStart		= 1.0,
		scaleVariation		= 0.5,
		scaleInSpeed		= 0,
		scaleOutSpeed		= -0.4,
		scaleOutDelay		= 0,
		rotationVariation	= 360,
		rotationChange		= 0,
		rotationVariation	= 45,
		useEmitterRotation	= false,
		emissionShape		= 0,
		emissionRadius		= 10,
		killOutsideScreen	= true,
		blendMode		= "add",
		lifeTime		= 2000,
		colorChange		= {-25,-50,-75},
		} )
		
	Particles.CreateParticleType ("FireballBright", 
		{
		imagePath		= "images/fireball_bright.png",
		imageWidth		= 64,
		imageHeight		= 64,
		directionVariation	= 360,
		velocityStart		= 75,
		velocityVariation	= 15,
		velocityChange		= -2.0,
		rotationVariation	= 360,
		rotationChange		= -20,
		useEmitterRotation	= false,
		alphaStart		= 1.0,
		alphaVariation		= 0.25,
		fadeInSpeed		= 2.0,
		fadeOutSpeed		= -3.0,
		fadeOutDelay		= 300,
		scaleStart		= 0.1,
		scaleVariation		= 0.20,
		scaleInSpeed		= 3.0,
		scaleOutSpeed		= -0.01,
		scaleOutDelay		= 500,
		emissionShape		= 2,
		emissionRadius		= 30,
		killOutsideScreen	= false	,
		blendMode		= "add",
		lifeTime		= 2000,
		colorChange		= {-25,-50,-75},
		} )
		
	Particles.CreateParticleType ("NukeBright", 
		{
			imagePath		= "images/flare.png",
			imageWidth		= 5,
			imageHeight		= 5,
			directionVariation	= 360,
			velocityStart		= 200,
			velocityVariation	= 150,
			velocityChange		= 0.5,
			rotationVariation	= 360,
			autoOrientation		= true,
			useEmitterRotation	= true,
			alphaStart		= 1,
			alphaVariation		= 1,
			fadeInSpeed		= 0,
			fadeOutSpeed		= 0,
			fadeOutDelay		= 0,
			scaleStart		= 1,
			scaleVariation		= 0,
			killOutsideScreen	= true,
			lifeTime		= 1500,
		} )
		
	Particles.CreateParticleType ("Nukefire", 
		{
			imagePath		= "images/spark_with_trail.png",
			imageWidth		= 5,
			imageHeight		= 10,
			directionVariation	= 360,
			velocityStart		= 200,
			velocityVariation	= 150,
			velocityChange		= 0.5,
			rotationVariation	= 360,
			autoOrientation		= true,
			useEmitterRotation	= true,
			alphaStart		= 1,
			alphaVariation		= 1,
			fadeInSpeed		= 0,
			fadeOutSpeed		= 0,
			fadeOutDelay		= 0,
			scaleStart		= 1,
			scaleVariation		= 0,
			killOutsideScreen	= true,
			lifeTime		= 1500,
		} )
		
	Particles.CreateParticleType ("Nukefire2", 
		{
			imagePath		= "images/electric_spark.png",
			imageWidth		= 5,
			imageHeight		= 20,
			directionVariation	= 360,
			velocityStart		= 200,
			velocityVariation	= 150,
			velocityChange		= 0.75,
			rotationVariation	= 360,
			autoOrientation		= true,
			useEmitterRotation	= true,
			alphaStart		= 0,
			alphaVariation		= 1,
			fadeInSpeed		= 0,
			fadeOutSpeed		= 0,
			fadeOutDelay		= 0,
			scaleStart		= 1,
			scaleVariation		= 0,
			killOutsideScreen	= true,
			lifeTime		= 1500,
		} )

							
	local function update(event)
	 Particles.Update()
	end
	
	function Explosions:nukeExplosion(emitterName, locationX, locationY)
		Particles.DetachParticleTypes(emitterName)
		Particles.StopEmitter(emitterName)

		Particles.GetEmitter(emitterName).x = locationX
		Particles.GetEmitter(emitterName).y = locationY
		
		Particles.AttachParticleType(emitterName, "NukeBright", 100, 250, 0)
		Particles.AttachParticleType(emitterName, "Nukefire2", 50, 250, 0)
		
		Particles.StartEmitter(emitterName)
	end
	
	function Explosions:enemyShipExplostion(emitterName, locationX, locationY)
		Particles.DetachParticleTypes(emitterName)
		Particles.StopEmitter(emitterName)

		Particles.GetEmitter(emitterName).x = locationX
		Particles.GetEmitter(emitterName).y = locationY
		
		Particles.AttachParticleType (emitterName, "FireballBright", 
										count, 500,0)
		Particles.AttachParticleType (emitterName, "ExplosionSmoke", 
										count, 500,0)
		
		if device ~= "Kindle Fire" then 
			Particles.AttachParticleType (emitterName, "ExplosionFlash", 
											5, 500,0)
			Particles.AttachParticleType (emitterName, "ExplosionRock4", 
											5, 1500,0)
		end
		

		Particles.StartEmitter(emitterName)
	end

	function Explosions:rockExplosion(emitterName, locationX, locationY)
		Particles.DetachParticleTypes(emitterName)
		Particles.StopEmitter(emitterName)

		Particles.GetEmitter(emitterName).x = locationX
		Particles.GetEmitter(emitterName).y = locationY
		
		Particles.AttachParticleType (emitterName, "FireballBright", 
										count, 500,0)
		Particles.AttachParticleType (emitterName, "ExplosionSmoke", 
										count, 500,0)
		if device ~= "Kindle Fire" then
			Particles.AttachParticleType(emitterName, "SmallRocks",
											2, 500, 1)
			Particles.AttachParticleType(emitterName, "MedRocks",
											2, 500, 1)
			Particles.AttachParticleType (emitterName, "ExplosionRock4", 
											5, 1500,0)
			
			Particles.AttachParticleType (emitterName, "ExplosionFlash", 
											5, 500,0)
		end


		Particles.StartEmitter(emitterName)
	end
	
	function Explosions:getRockEmitter()
		local rockEmitter = "RockEmitter"

		Particles.CreateEmitter(rockEmitter, 0, 
								0, 0, false, false)
								
		return Particles.GetEmitter("RockEmitter")
	end
	
	function Explosions:getEnemyEmitter()
		local enemyEmitter = "EnemyEmitter"
		
		Particles.CreateEmitter(enemyEmitter, 0, 
								0, 0, false, false)
								
		return Particles.GetEmitter("EnemyEmitter")
	end
	
	function Explosions:getNukeEmitter()
		local nukeEmitter = "NukeEmitter"
		Particles.CreateEmitter(nukeEmitter, 0, 0, 0, false, false)
		
		return Particles.GetEmitter("NukeEmitter")
	end
	
	function Explosions:CleanUp()
		Particles.StopAutoUpdate()
		Particles.DeleteEmitter("RockEmitter")
		Particles.DeleteEmitter("EnemyEmitter")
		Particles.CleanUp()
	end

end

return Explosions