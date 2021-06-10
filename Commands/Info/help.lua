local discordia = require('discordia')

local function getprefixes()
    local output = ""
    for i,v in ipairs(config.prefixes) do 
        if output == "" then
            output = "`"..v.."`"
        else
            output = output..", `"..v.."`"
        end
    end
    return output
end


message.channel:send{
    reference = {
        message = message.id,
    },
    embed = {
        title = "Help",
        description = "<:Bot:852216908362940416> Hello! My name is Luaeality and I'm an [open source](https://github.com/jacobhumston/Luaeality) Discord bot written in Lua.<:Support:852216908383125535> If you need support: https://discord.gg/2yyQygXP8u\n<:Star:852216908341051432> Prefixes: "..getprefixes(),
        color = 0x6666ff,
    }
}
