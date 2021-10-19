hades_atmos = {}

-- This mod is still very incomplete.

-- TODO: Complete the design, write missing functionss


-- This is a stub function, it only returns some fixed dummy values.
-- TODO: Write a proper implementation with dynamic atmos values.

-- Returns the current atmos value for the given pos and atmos type.
-- Returns nil for invalid atmos_type.
function hades_atmos.get_atmos_at_pos(pos, atmos_type)
	if atmos_type == "sulphur" then
		-- Always pretend we have a clean air for now
		return 0.0
	elseif atmos_type == "heat" then
		-- Always hot
		return 1.0
	elseif atmos_type == "humidity" then
		-- Always dry
		return 0.0
	elseif atmos_type == "radiation" then
		-- Never radiation
		return 0.0
	end
end

-- This is a stub function.
-- TODO: Write proper implementation

-- Returns true if pos is above a certain threshold
function hades_atmos.is_pos_above_atmos_threshold(pos, atmos_type)
	return hades_atmos.get_atmos_at_pos(pos, atmos_type) > 0.5
end
