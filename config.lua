Config = {}

Config.RefillPropTime = 10 * 60000 -- how long should it take to fill up the containers again
Config.SearchableProps = { -- you can add as many prop hashes, as you want
    666561306,
    1437508529,
    682791951,
    1329570871,
	1511880420,
    1339433404,
    1694452750,
    2287735495,
    1933174915,
    3832150195,
    4236481708
}
-- works only with items
Config.Items = {"carbon", "glas", "holz", "stein", "teflon", "baumwolle", "klebstoff", "schraube", "glasflache", "aramidfaser", "benzin", "schiesspulver", "sprengpulver"} -- make sure they exist in your items table in your database
Config.MinReward = 1 -- min. reward items
Config.MaxReward = 2 -- max. reward items
-- LOCALES
Config.HelpNotificationText = 'Drücke ~INPUT_CONTEXT~ um nach Gegenständen zu suchen'
Config.FoundSomethingText = "Du hast etwas gefunden!"
Config.NothingFoundText = "Du hast nichts gefunden!"
