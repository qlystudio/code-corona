function rapidsListener(self, event)
   other = event.other
   if (event.contact and other and not other.isProjectile) then
      event.contact.isEnabled=false
      if event.other.isPlayer then
         RForce = 5
      else
         RForce = .1
      end
      if other.isPlayer then
         other.timeLastInRapid = os.clock()
      end
      event.other:applyForce(0, -RForce, event.other.x, event.other.y) 
   else if other.isProjectile and event.contact then
         event.contact.isEnabled = false
      end      
      
   end
end