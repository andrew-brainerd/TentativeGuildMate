TentativeGuildMate = LibStub("AceAddon-3.0"):NewAddon("<Tentative> GuildMate", "AceConsole-3.0", "AceEvent-3.0")

function TentativeGuildMate:SaveMembers()
    TentativeGuildMate:Print("Saving Guild Data")
    local MembershipList = {}

    MembershipList[name] = {}

    numTotalMembers, numOnlineMaxLevelMembers, numOnlineMembers = GetNumGuildMembers()

    for i = 1, numTotalMembers do
        local name, rank, rankIndex, level, class, zone, note, officernote, online, status = GetGuildRosterInfo(i);
            
        MembershipList[name] = {
            rank = rank,
            level = level,
            class = class,
            zone = zone,
            online = online
        }
    end

    GuildLocker = MembershipList
end

TentativeGuildMate:RegisterEvent("PLAYER_ENTERING_WORLD", function()
    name = GetUnitName("player", true)
    GuildLocker = {}
    TentativeGuildMate:SaveMembers()
end)
