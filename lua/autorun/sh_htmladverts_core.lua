-- setpos 171.945099 -4167.705078 -10666.294922;setang 4.238403 89.841003 0.000000



print("GAG")

if not HTML_AD_Panel then


else
	HTML_AD_Panel:Remove()
	HTML_AD_Panel = nil
end

local HTMLMaterial = nil

if CLIENT then

	local AdTable = {
		{
			vec = Vector(-200,13255-4,-12201),
			ang = Angle(0,0,90),
			width = 604.0 + 20,
			height = 333.8 + 20,
		},
		{
			vec = Vector(207,-4249 + 8,-10740),
			ang = Angle(0,180,90),
			width = 1209 + 80,
			height = 667.7 + 20,
		},
		{
			vec = Vector(207,-4255 - 8,-10740),
			ang = Angle(0,0,90),
			width = 1209 + 80,
			height = 667.7 + 20,
		},
		{
			vec = Vector(11561,-15551 + 4,-12907),
			ang = Angle(0,180,90),
			width = 604.0 + 20,
			height = 333.8 + 20,
		},
		
		
	}
	
	function HTML_AD_HUDPaint()

		local ply = LocalPlayer()
	
		if not HTML_AD_Panel then
			HTML_AD_Panel = vgui.Create("DHTML")
			--HTML_AD_Panel:OpenURL("http://wiki.garrysmod.com/page/render/SetMaterial")
			
			local URL = "http://i.imgur.com/9yUcclr.jpg"
			
			HTML_AD_Panel:SetHTML([[
				<head>
					<style type="text/css">
						body {
							overflow:hidden;
							align: center;
						}
					</style>
				</head>
				
				<body>
				<img src=]]..URL..[[ width = 100% height =  100%>
				</body>
				
			
			
			
			
			
			]])
			HTML_AD_Panel:SetAlpha(0)
			HTML_AD_Panel:SetMouseInputEnabled(false)
			function HTML_AD_Panel:ConsoleMessage( msg ) end

		elseif HTML_AD_Panel:GetHTMLMaterial() then

			local HTMLMat = HTML_AD_Panel:GetHTMLMaterial()
			
			for k,v in pairs(AdTable) do
			
				--local Distance = ply:GetPos():Distance(v.vec)
			
				--if Distance < 1024*4 then
			
					cam.Start3D2D(v.vec ,v.ang,1)
						render.SetMaterial( HTMLMat )
						render.DrawQuad(Vector(-v.width/2, -v.height/2, 0), Vector(v.width/2, -v.height/2, 0), Vector(v.width/2, v.height/2, 0), Vector(-v.width/2,v.height/2, 0)) 
					cam.End3D2D()
					
				--end
			
			
			end

		end
	
	end

	hook.Add("PostDrawOpaqueRenderables","HTML_AD_HUDPaint",HTML_AD_HUDPaint)
	
end