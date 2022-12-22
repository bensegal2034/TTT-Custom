include('shared.lua')

function ENT:Draw()
    self.BaseClass.Draw(self)
    --self:DrawEntityOutline(0.2)
    self:DrawModel()
end