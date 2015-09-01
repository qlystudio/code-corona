function projectilePreCollision(self, event)
   if (event.contact and event.other and not event.other.isPlayer) then
      event.contact.isEnabled = false;
      else
      self:sound()
      self:removeEventListener("preCollision",self)
   end
end