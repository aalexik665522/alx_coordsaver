RegisterCommand('c', function()
    if Config.Style == true then
        lib.showContext('coords_context')
    else
        lib.showMenu('coords_menu')
    end
end)

local PPedId = PlayerPedId()
local PCoords = GetEntityCoords(PPedId)
local PHeading = GetEntityHeading(PPedId)

local function NotifyCopyCoords(format)
    local description = format:format(PCoords.x, PCoords.y, PCoords.z)
  
    lib.notify({
        title = 'coords saved',
        description = description,
        type = 'success'
    })
    lib.setClipboard(description)
end

AddEventHandler('alx_coordsaver:one', function()
    NotifyCopyCoords('vec3(%s, %s, %s)')
end)

AddEventHandler('alx_coordsaver:two', function()
    NotifyCopyCoords('vec3(%s,%s,%s)')
end)

AddEventHandler('alx_coordsaver:three', function()
    NotifyCopyCoords('vector3(%s, %s, %s)')
end)

AddEventHandler('alx_coordsaver:four', function()
    NotifyCopyCoords('vector3(%s,%s,%s)')
end)

AddEventHandler('alx_coordsaver:five', function()
    NotifyCopyCoords('%s, %s, %s')
end)

AddEventHandler('alx_coordsaver:six', function()
    NotifyCopyCoords('%s,%s,%s')
end)

lib.registerContext({
    id = 'coords_context',
    title = 'Coords Saver',
    options = {
      {
        title = 'vec3(x, y, z)',
        event = 'alx_coordsaver:one',
      },
      {
        title = 'vec3(x,y,z)',
        event = 'alx_coordsaver:two',
      },
      {
        title = 'vector3(x, y, z)',
        event = 'alx_coordsaver:three',
      },
      {
        title = 'vector3(x,y,z)',
        event = 'alx_coordsaver:four',
      },
      {
        title = 'x, y, z',
        event = 'alx_coordsaver:five',
      },
      {
        title = 'x,y,z',
        event = 'alx_coordsaver:six',
      },
    }
})

lib.registerMenu({
    id = 'coords_menu',
    title = 'Coords Saver',
    position = 'top-right',
    options = {
        { label = 'vec3(x, y, z)', event = 'alx_coordsaver:one' },
        { label = 'vec3(x,y,z)', event = 'alx_coordsaver:two' },
        { label = 'vector3(x, y, z)', event = 'alx_coordsaver:three' },
        { label = 'vector3(x,y,z)', event = 'alx_coordsaver:four' },
        { label = 'x, y, z', event = 'alx_coordsaver:five' },
        { label = 'x,y,z', event = 'alx_coordsaver:six' },
    }
}, function(selected)
    local events = {
        'alx_coordsaver:one',
        'alx_coordsaver:two',
        'alx_coordsaver:three',
        'alx_coordsaver:four',
        'alx_coordsaver:five',
        'alx_coordsaver:six',
    }

    TriggerEvent(events[selected])
end) 