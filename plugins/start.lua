local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'اشتراک شماره ربات 🤖🤘🏾', callback_data = '!share'},
    					},
    					{
    		    		{text = 'خرید گروه 💸', callback_data = '!buygroup'},
    		    		{text = 'پشتیبانی 👥', url = 'https://telegram.me/joinchat/C2AZVz9e1oI_Dcw34YYSsQ'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_buygroup()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'Iranians', url = 'http://salam.im/buy/ecgvlup3ld'},
    		    		{text = 'Other countries', url = 'https://telegram.me/joinchat/BvytAD9KL7J2PE2u0ek3ZA'},
	    },
	    {
	    {text = '🔙', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🌐 سایت', url = 'http://hextor.ir'},
    		{text = '📡کانال', callback_data = '!channel'},
	    },
		{
	        {text = '📥ارتباط با ما 📤', callback_data = '/chat'},
        },
		{
	        {text = 'درباره ما 👥', callback_data = '!aboutus'},
        },
	    {
	        {text = '🔸ربات اسمارت🔹', callback_data = '!robot'},
        }
    }
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🙃👉 Click here ! 👈🙃', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end
local function do_keyboard_channel()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Persian Channel 🇮🇷', url = 'https://telegram.me/smartgp'},
	    },
	{
	        		{text = 'English Channel 🇬🇧', url = 'https://telegram.me/smartgp'},

    },
		{
					{text = 'News Channel 🗣', url = 'https://telegram.me/smartgp'},
		},
		{
	    {text = '🔙', callback_data = '!home'},
        }
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[📍*به ربات اسمارت خوش آمدید*  📍
-------------------------------------------------------------
🗣 `گزینه مورد نظر را انتخاب کنید`]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, 'Hey 👋 Please `start` me in *PV* 🖐😄👇' ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'channel' then
            local text = '📡*کانال های اسمارت : *'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[🔸*ربات اسمارت*🔹
🚩 _رباتی پیشرفته برای کنترل و مدیریت گروه های شما آنتی اسپم_]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'buygroup' then
            local text = [[_Please wait after payment_ 
_We will be call to you_]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍*به ربات اسمارت خوش آمدید*  📍
-------------------------------------------------------------
🗣`گزینه مورد نظر را انتخاب کنید`]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+639380063518', '🔸ßελτ ßΘτ🔹 [ Use ! ]')
end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)@BeatBotTeamBot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:!(home)',
		'^###cb:!(buygroup)',
	    '^###cb:!(channel)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',

    }
}
