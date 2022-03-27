local Translations = {
    info = {
        ["wipe_message1"]  = "Parkeer of zit in uw voertuig zo dat jouw voertuig niet word verwijderd!",
        ["wipe_message2"]  = "Server Wipe in %{seconds} minuut!!",
        ["clear_message1"] = "%{count} voertuigen werden verwijderd.",
        ["clear_message2"] = "Serveropruiming voltooid, volgende wisbeurt over %{minutes} minuten!",
    }            
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
