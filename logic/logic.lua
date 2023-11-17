local path = logistica.MODPATH .. "/logic"
-- once again, order is important
dofile(path.."/processing_queue.lua")
dofile(path.."/groups.lua")
dofile(path.."/network_cache.lua")
dofile(path.."/network_logic.lua")
dofile(path.."/network_storage.lua")
dofile(path.."/controller.lua")
dofile(path.."/mass_storage.lua")
dofile(path.."/supplier.lua")
dofile(path.."/requester.lua")
dofile(path.."/injector.lua")
dofile(path.."/item_storage.lua")
dofile(path.."/access_point.lua")
dofile(path.."/access_point_formspec.lua")
dofile(path.."/lava_furnace_guide_formspec.lua")
dofile(path.."/trashcan.lua")
