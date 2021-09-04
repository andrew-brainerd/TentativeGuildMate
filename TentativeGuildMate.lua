TentativeGuildMate = LibStub("AceAddon-3.0"):NewAddon("<Tentative> GuildMate", "AceConsole-3.0", "AceEvent-3.0")

function TentativeGuildMate:SaveMembers()
    TentativeGuildMate:Print("Saving Guild Data")

    local playerName = GetUnitName("player", true)
    local numTotalMembers, numOnlineMaxLevelMembers, numOnlineMembers = GetNumGuildMembers()
    local MembershipList = {}

    MembershipList[playerName] = {}
    MembershipList[playerName]["members"] = {}

    for i = 1, numTotalMembers do
        local name, rank, rankIndex, level, class, zone, note, officernote, online, status = GetGuildRosterInfo(i);
            
        MembershipList[playerName]["members"][i] = {
            name = name,
            rank = rank,
            level = level,
            class = class,
            note = note,
            zone = zone,
            officernote = officernote,
            online = online
        }
    end

    GuildLocker = MembershipList
end

TentativeGuildMate:RegisterEvent("PLAYER_ENTERING_WORLD", function()
    GuildLocker = {}
    local guildName = GetGuildInfo("player")

    TentativeGuildMate:Print("Guild Name: " .. guildName)

    if (guildName == "Tentative") then
        TentativeGuildMate:SaveMembers()
    end
end)
