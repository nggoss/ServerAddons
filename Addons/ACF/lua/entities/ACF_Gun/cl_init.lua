include("shared.lua")

ENT.RenderGroup 		= RENDERGROUP_OPAQUE

ENT.AutomaticFrameAdvance = true 

function ENT:Draw()
	self:DoNormalDraw()
	self:DrawModel()
    Wire_Render(self.Entity)
end

function ENT:Initialize()

	self.LastFire = 0
	self.Reload = 1
	self.CloseTime = 1
	self.Rate = 1
	self.RateScale = 1
	self.FireAnim = self:LookupSequence( "shoot" )
	self.CloseAnim = self:LookupSequence( "load" )

end

function ENT:DoNormalDraw()
	local e = self.Entity
	if (LocalPlayer():GetEyeTrace().Entity == e and EyePos():Distance(e:GetPos()) < 256) then
		if(self:GetOverlayText() ~= "") then
			AddWorldTip(e:EntIndex(),self:GetOverlayText(),0.5,e:GetPos(),e)
		end
	end
end

function ENT:Think()
	if (CurTime() >= (self.NextRBUpdate or 0)) then
	    self.NextRBUpdate = CurTime() + math.random(30,100)/10 --update renderbounds every 3 to 10 seconds
		Wire_UpdateRenderBounds(self.Entity)
	end
		
	local SinceFire = (CurTime() - self.LastFire)
	self:SetCycle( SinceFire*self.Rate/self.RateScale )
	if CurTime() > self.LastFire + self.CloseTime and self.CloseAnim then
		self:ResetSequence( self.CloseAnim )
		self:SetCycle( (SinceFire - self.CloseTime)*self.Rate/self.RateScale )
		self.Rate = 1/(self.Reload - self.CloseTime)	--Base anim time is 1s, rate is in 1/10 of a second
		self:SetPlaybackRate( self.Rate )
	end
	
	self.Entity:NextThink(CurTime())
	return true
end

function ENT:Animate( Class, ReloadTime, LoadOnly )
	
	if self.CloseAnim and self.CloseAnim > 0 then
		self.CloseTime = math.max(ReloadTime-0.75,ReloadTime*0.75)
	else
		self.CloseTime = ReloadTime
		self.CloseAnim = nil
	end
	
	self:ResetSequence( self.FireAnim )
	self:SetCycle( 0 )
	self.RateScale = self:SequenceDuration()
	if LoadOnly then
		self.Rate = 1000000
	else
		self.Rate = 1/math.Clamp(self.CloseTime,0.1,1.5)	--Base anim time is 1s, rate is in 1/10 of a second
	end
	self:SetPlaybackRate( self.Rate )
	self.LastFire = CurTime()
	self.Reload = ReloadTime
	
end

function ACFGunGUICreate( Table )
		
	acfmenupanel:CPanelText("Name", Table.name)
	
	acfmenupanel.CData.DisplayModel = vgui.Create( "DModelPanel", acfmenupanel.CustomDisplay )
		acfmenupanel.CData.DisplayModel:SetModel( Table.model )
		acfmenupanel.CData.DisplayModel:SetCamPos( Vector( 250 , 500 , 250 ) )
		acfmenupanel.CData.DisplayModel:SetLookAt( Vector( 0, 0, 0 ) )
		acfmenupanel.CData.DisplayModel:SetFOV( 20 )
		acfmenupanel.CData.DisplayModel:SetSize(acfmenupanel:GetWide(),acfmenupanel:GetWide())
		acfmenupanel.CData.DisplayModel.LayoutEntity = function( panel , entity ) end
	acfmenupanel.CustomDisplay:AddItem( acfmenupanel.CData.DisplayModel )
		
	acfmenupanel:CPanelText("Desc", Table.desc)
	acfmenupanel:CPanelText("Caliber", "Caliber : "..(Table.caliber*10).."mm")
	acfmenupanel:CPanelText("Weight", "Weight : "..Table.weight.."kg")
	
	acfmenupanel.CustomDisplay:PerformLayout()
	
end

