function swampListener(self,event)
   other = event.other
   if (other and event.contact and not other.isProjectile) then
      event.contact.isEnabled = false
      xHat, yHat = other:getLinearVelocity()
      mag = math.sqrt(xHat*xHat + yHat*yHat)
      xHat = xHat / mag*-1
      yHat = yHat / mag*-1
      if other.isPlayer then
         force = .1
         other.timeLastInSwamp = os.time()
      else
         force = .01
      end
      other:applyForce(xHat*force, yHat*force, other.x, other.y) 
   else if other.isProjectile  and event.contact then
         event.contact.isEnabled = false
      end      
   end
end