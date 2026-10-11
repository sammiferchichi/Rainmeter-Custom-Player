function Initialize()
  m1=SKIN:GetMeasure(SELF:GetOption('MeasureName1'))
  m2=SKIN:GetMeasure(SELF:GetOption('MeasureName2'))
end
function Update()
  local s1=m1:GetStringValue()
  if s1~="" and s1~="0" and s1~="0:00" then return s1 end
  return m2:GetStringValue()
end
