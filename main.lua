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
    
    
end)

client:run("Bot "..token.Token)