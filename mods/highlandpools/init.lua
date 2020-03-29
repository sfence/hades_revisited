-- highlandpools 0.1.1 by paramat
-- For latest stable Minetest back to 0.4.8
-- Depends default
-- Licenses: code WTFPL


-- Parameters

local YMAX = 33000 -- Maximum altitude for pools
local FLOW = 256

-- On generated function
minetest.register_on_generated(function(minp, maxp, seed)
	local y0 = minp.y
	if y0 < -32 or y0 > YMAX then
		return
	end


	local t1 = os.clock()
	local x0 = minp.x
	local z0 = minp.z
	minetest.log("verbose", "[highlandpools] chunk ("..x0.." "..y0.." "..z0..")")
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local sidelen = x1 - x0 -- actually sidelen - 1


	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()


	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_lava = minetest.get_content_id("hades_core:lava_source")
	local c_ash = minetest.get_content_id("hades_core:ash")
	local c_vgravel = minetest.get_content_id("hades_core:gravel_volcanic")


	for xcen = x0 + 8, x1 - 7, 8 do
	for zcen = z0 + 8, z1 - 7, 8 do
		local yasurf = false -- y of above surface node
		for y = y1, 2, -1 do
			local vi = area:index(xcen, y, zcen)
			local c_node = data[vi]
			if y == y1 and c_node ~= c_air then -- if top node solid
				break
			elseif c_node == c_lava then
				break
			elseif c_node == c_ash then
				yasurf = y + 1
				break
			end
		end
		if yasurf then
			local abort = false
			for ser = 1, 80 do
				local vi = area:index(xcen + ser, yasurf, zcen)
				local c_node = data[vi]
				if xcen + ser == x1 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			for ser = 1, 80 do
				local vi = area:index(xcen - ser, yasurf, zcen)
				local c_node = data[vi]
				if xcen - ser == x0 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			for ser = 1, 80 do
				local vi = area:index(xcen, yasurf, zcen + ser)
				local c_node = data[vi]
				if zcen + ser == z1 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			for ser = 1, 80 do
				local vi = area:index(xcen, yasurf, zcen - ser)
				local c_node = data[vi]
				if zcen - ser == z0 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			if abort then
				break
			end


			local vi = area:index(xcen, yasurf, zcen)
			data[vi] = c_lava
			local flab = false -- flow abort
			for flow = 1, FLOW do
				for z = z0, z1 do
					for x = x0, x1 do
						local vif = area:index(x, yasurf, z)
						if data[vif] == c_lava then
							if x == x0 or x == x1 or z == z0 or z == z1 then
								flab = true -- if water at chunk edge abort flow
								break
							else -- flow water
								local vie = area:index(x + 1, yasurf, z)
								local viw = area:index(x - 1, yasurf, z)
								local vin = area:index(x, yasurf, z + 1)
								local vis = area:index(x, yasurf, z - 1)
								if data[vie] == c_air then
									data[vie] = c_lava
								end
								if data[viw] == c_air then
									data[viw] = c_lava
								end
								if data[vin] == c_air then
									data[vin] = c_lava
								end
								if data[vis] == c_air then
									data[vis] = c_lava
								end
							end
						end
					end
					if flab then
						break
					end
				end
				if flab then
					break
				end
			end
			if flab then -- erase water from this y level
				for z = z0, z1 do
				for x = x0, x1 do
					local vi = area:index(x, yasurf, z)
					if data[vi] == c_lava then
						data[vi] = c_air
					end
				end
				end
			else -- flow downwards add dirt
				for z = z0, z1 do
				for x = x0, x1 do
					local vi = area:index(x, yasurf, z)
					if data[vi] == c_lava then
						for y = yasurf - 1, y0, -1 do
							local viu = area:index(x, y, z)
							if data[viu] == c_air then
								data[viu] = c_lava
							elseif data[viu] == c_ash then
								data[viu] = c_vgravel
								break
							else
								break
							end
						end
					end
				end
				end
			end
		end
	end
	end

	vm:set_data(data)
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map(data)

	local chugent = math.ceil((os.clock() - t1) * 1000)
	minetest.log("verbose", "[highlandpools] time "..chugent.." ms")
end)
