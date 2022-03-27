local Translations = {
    info = {
        ["wipe_message1"]  = "Park or Sit in your vehicle to iqnore the wipe!",
        ["wipe_message2"]  = "Server Vehicle Wipe in %{seconds} minute!!",
        ["clear_message1"] = "%{count} vehicle are removed.",
        ["clear_message2"] = "Server Cleanup Complete, Next wipe in %{minutes} minutes",
    }            
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
