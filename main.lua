local discordia = require('discordia')
local client = discordia.Client()
local token = require("token")

client:on('ready', function()
	print('Logged in as '..client.user.username.."!")
end)

client:on('messageCreate', function(message)
    local prefix = "!"
    if string.lower(message.content) == prefix.."help" then
        message:reply("I'm here! <3")
    end
end)

client:run("Bot "..token.Token)