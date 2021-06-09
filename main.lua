local discordia = require('discordia')
local client = discordia.Client()
local token = require("token")
local config = require("config")

client:on('ready', function()
	print('Logged in as: '..client.user.username)
end)

local function startswith(String,Start)
    return string.sub(String,1,string.len(Start)) == Start
end 
-- https://stackoverflow.com/questions/22831701/lua-read-beginning-of-a-string 

client:on('messageCreate', function(message)
    local function hasprefix(command) 
        for i,v in ipairs(config.prefixes) do
            if startswith(string.lower(message),v..command) then
                return true
            end
        end
        return nil
    end
    
    if hasprefix("help") then
        message:reply("I'm here! <3")
    end
end)

client:run("Bot "..token.Token)