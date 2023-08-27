
Config = {}

Config.Itemuse = "fishingrod"        -- คันเบ็ด
Config.Removeitem = "fishingbait"    -- เหยื่อตกปลา
Config.TimetoAdd = 10                -- เวลาที่ได้ของ

Config.Zonefish = {x = 1299.88, y = 4219.34, z = 33.908} -- พิกัดโซนตกปลา  [ต้องตั้งให้ตรงกับ Blip,x,y,z]
Config.range = 50                    -- โซนระยะตกปลา

Config.ShowToolTip = true

Config.blip = {
    [1] = {
        show = true, -- true /เปิด - false /ปิด  โชว์บนแผนที่ไหม
        title = "AFK Fishing Zone",
        id = 68,
        colour = 0,
        x = 1299.88,
        y = 4219.34,
        z = 33.908
    },
}

Config.droprate = { -- [ ไอเทมโบนัส เพิิ่มใน sql ]
    {
        ItemName = "wibe",     -- ไอเทมโบนัส
        ItemCount = {1, 2},    -- จำนวน
        Percent = 5          -- %
    },
    {
        ItemName = "glass", -- ไอเทมโบนัส
        ItemCount = {1, 2},    -- จำนวน
        Percent = 10           -- %
	},
	{
        ItemName = "wood",    -- ไอเทมโบนัส
        ItemCount = {1, 10},    -- จำนวน
        Percent = 20          -- %
	},
    {
        ItemName = "yang",    -- ไอเทมโบนัส
        ItemCount = {1, 10},    -- จำนวน
        Percent = 30          -- %
	},
    {
        ItemName = "rubbish",    -- ไอเทมโบนัส
        ItemCount = {1, 5},    -- จำนวน
        Percent = 40          -- %
	},
    {
        ItemName = "catfish",    -- ไอเทมโบนัส
        ItemCount = {5, 15},    -- จำนวน
        Percent = 100          -- %
	},
}
