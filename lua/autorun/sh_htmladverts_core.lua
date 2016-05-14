if not HTML_AD_Panel then


else
	HTML_AD_Panel:Remove()
	HTML_AD_Panel = nil
end

local HTMLMaterial = nil

if CLIENT then

	local URLImages = {
		"http://i.imgur.com/z14qqoq.jpg",
		"http://i.imgur.com/zAQN4Si.png",
		"http://i.imgur.com/Syx0lyp.jpg",
		"http://i.imgur.com/AAPPlvM.jpg",
		"http://i.imgur.com/e3t01u6.png",
		}
		
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
		}	
	}
	
	function HTML_AD_HUDPaint()

		local ply = LocalPlayer()
	
		if not HTML_AD_Panel then
			HTML_AD_Panel = vgui.Create("DHTML")
			--HTML_AD_Panel:OpenURL("http://wiki.garrysmod.com/page/render/SetMaterial")
			
			local TotalString = ""
			
			for k,v in pairs(URLImages) do
				TotalString = TotalString .. [[<img class="mySlides" src=]]..v..[[>]]
			end

			
			HTML_AD_Panel:SetHTML(
			[[
			<!DOCTYPE html>
			<html>
			<style>
			.mySlides {
				display:none;
				}
			img{
				position: absolute;
				width: 100%;
				height: 100%;
			}
			body {
				margin: 0;
				padding: 0;
			}
				
				
			</style>
			<body>

			]] .. TotalString .. [[

			<script>
			var myIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
				   x[i].style.display = "none";  
				}
				myIndex++;
				if (myIndex > x.length) {myIndex = 1}    
				x[myIndex-1].style.display = "block";  
				setTimeout(carousel, 10000);
			}
			</script>

			</body>
			</html> 
			]]
			)
			
			
			HTML_AD_Panel:SetAlpha(0)
			HTML_AD_Panel:SetMouseInputEnabled(false)
			function HTML_AD_Panel:ConsoleMessage( msg ) end

		elseif HTML_AD_Panel:GetHTMLMaterial() then

			local HTMLMat = HTML_AD_Panel:GetHTMLMaterial()
			
			for k,v in pairs(AdTable) do
			
				cam.Start3D2D(v.vec ,v.ang,1)
					render.SetMaterial( HTMLMat )
					render.DrawQuad(Vector(-v.width/2, -v.height/2, 0), Vector(v.width/2, -v.height/2, 0), Vector(v.width/2, v.height/2, 0), Vector(-v.width/2,v.height/2, 0)) 
				cam.End3D2D()

			end

		end
	
	end

	hook.Add("PostDrawOpaqueRenderables","HTML_AD_HUDPaint",HTML_AD_HUDPaint)
	
end