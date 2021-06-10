local discordia = require('discordia')
local client = discordia.Client{
    cacheAllMembers = true,
}
local token = require("token")
local config = require("config")

client:on('ready', function()
    print("Ready!")
end)

local function startswith(String,Start)
    return string.sub(String,1,string.len(Start)) == Start
end 
-- https://stackoverflow.com/questions/22831701/lua-read-beginning-of-a-string 

client:on('messageCreate', function(message)
    local function hasprefix(command) 
        for i,v in ipairs(config.prefixes) do
            if startswith(string.lower(message.content),v..command) then
                return true
            end
        end
        return nil
    end
    
    if hasprefix("help") then
        message.channel:send{
        reference = {
            message = message.id,
        },
        embed = {
            title = "Help",
            description = "<:Bot:852216908362940416> Hello! My name is Luaeality and I'm an [open source](https://github.com/jacobhumston/Luaeality) Discord bot written in Lua.<:Support:852216908383125535> If you need support: https://discord.gg/2yyQygXP8u",
            color = 0x6666ff,
        }}
    end
end)

client:run("Bot "..token.Token)