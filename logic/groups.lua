logistica.cables = {}
logistica.machines = {}
logistica.controllers = {}
logistica.injectors = {}
logistica.demanders = {}
logistica.suppliers = {}
logistica.mass_storage = {}
logistica.item_storage = {}
-- logistica.demand_and_supplier = {}
logistica.tiers = {}
logistica.TIER_ALL = "logistica_all_tiers"
logistica.GROUP_ALL = "group:" .. logistica.TIER_ALL

function logistica.get_cable_group(tier)
  return "logistica_" .. tier .. "_cable"
end

function logistica.get_machine_group(tier)
  return "logistica_" .. tier .. "_machine"
end

function logistica.is_cable(name)
  return logistica.cables[name] ~= nil
end

function logistica.is_machine(name)
  return logistica.machines[name] ~= nil
end

function logistica.is_demander(name)
  return logistica.demanders[name] ~= nil
end

function logistica.is_supplier(name)
  return logistica.suppliers[name] ~= nil
end

function logistica.is_mass_storage(name)
  return logistica.mass_storage[name] ~= nil
end

function logistica.is_item_storage(name)
  return logistica.item_storage[name] ~= nil
end

function logistica.is_controller(name)
  return logistica.controllers[name] ~= nil
end

function logistica.is_injector(name)
  return logistica.injectors[name] ~= nil
end

function logistica.get_item_tiers(name)
  local tiers = {}
  for tier,_  in pairs(logistica.tiers) do
    local cable_group = logistica.get_cable_group(tier)
    local machine_group = logistica.get_machine_group(tier)
    if minetest.get_item_group(name, cable_group) > 0 then
      tiers[tier] = true
    end
    if minetest.get_item_group(name, machine_group) > 0 then
      tiers[tier] = true
    end
    if minetest.get_item_group(name, logistica.TIER_ALL) > 0 then
      tiers[logistica.TIER_ALL] = true
    end
  end
  return tiers
end

function logistica.do_tiers_match(tiers1, tiers2)
  for t1, _ in pairs(tiers1) do
    for t2, _ in pairs(tiers2) do
      if t1 == logistica.TIER_ALL or t2 == logistica.TIER_ALL or t1 == t2 then
        return true
      end
    end
  end
  return false
end
