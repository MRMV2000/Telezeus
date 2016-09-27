--Begin security.lua
--Prerequisite:
	local function lock_group_media(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_media_lock = data[tostring(target)]['settings']['lock_media']
  if group_media_lock == 'yes' then
    return 'Media posting is already locked'
  else
    data[tostring(target)]['settings']['lock_media'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'Media posting has been locked'
  end
end

local function unlock_group_media(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_media_lock = data[tostring(target)]['settings']['lock_media']
  if group_media_lock == 'no' then
    return 'Media posting is not locked'
  else
    data[tostring(target)]['settings']['lock_media'] = 'no'
    save_data(_config.moderation.data, data)
    return 'Media posting has been unlocked'
  end
end
    
	local function lock_group_fwd(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_fwd_lock = data[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'yes' then
    return 'Forward is already locked'
  else
    data[tostring(target)]['settings']['lock_fwd'] = 'yes'
    save_data(_config.moderation.data, data)
    local hash = 'fwd:'..msg.to.id
    redis:set(hash, true)
    return 'Forward has been locked'
  end
end

local function unlock_group_fwd(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_fwd_lock = data[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'no' then
    return 'Forward is not locked'
  else
    data[tostring(target)]['settings']['lock_fwd'] = 'no'
    save_data(_config.moderation.data, data)
    local hash = 'fwd:'..msg.to.id
    redis:del(hash)
    return 'Forward has been unlocked'
  end
end

local function lock_group_reply(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_reply_lock = data[tostring(target)]['settings']['lock_reply']
  if group_reply_lock == 'yes' then
    return 'reply posting is already locked'
  else
    data[tostring(target)]['settings']['lock_reply'] = 'yes'
    save_data(_config.moderation.data, data)
    local hash2 = 'reply:'..msg.to.id
    redis:set(hash2, true)
    return 'reply posting has been locked'
  end
end

local function unlock_group_reply(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_reply_lock = data[tostring(target)]['settings']['lock_reply']
  if group_reply_lock == 'no' then
    return 'reply posting is not locked'
  else
    data[tostring(target)]['settings']['lock_reply'] = 'no'
    save_data(_config.moderation.data, data)
    local hash2 = 'reply:'..msg.to.id
    redis:del(hash2)
    return 'reply posting has been unlocked'
  end
end

local function lock_group_share(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_share_lock = data[tostring(target)]['settings']['lock_share']
  if group_share_lock == 'yes' then
    return 'share posting is already locked'
  else
    data[tostring(target)]['settings']['lock_share'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'share posting has been locked'
  end
end

local function unlock_group_share(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_share_lock = data[tostring(target)]['settings']['lock_share']
  if group_share_lock == 'no' then
    return 'share posting is not locked'
  else
    data[tostring(target)]['settings']['lock_share'] = 'no'
    save_data(_config.moderation.data, data)
    return 'share posting has been unlocked'
  end
end

local function lock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_tag_lock = data[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'yes' then
    return 'tag posting is already locked'
  else
    data[tostring(target)]['settings']['lock_tag'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'tag posting has been locked'
  end
end

local function unlock_group_tag(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_tag_lock = data[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'no' then
    return 'tag posting is not locked'
  else
    data[tostring(target)]['settings']['lock_tag'] = 'no'
    save_data(_config.moderation.data, data)
    return 'tag posting has been unlocked'
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'yes' then
    return 'bots is already locked'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'bots has been locked'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'no' then
    return 'bots is not locked'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'no'
    save_data(_config.moderation.data, data)
    return 'bots has been unlocked'
  end
end

local function lock_group_number(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_number_lock = data[tostring(target)]['settings']['lock_number']
  if group_number_lock == 'yes' then
    return 'number posting is already locked'
  else
    data[tostring(target)]['settings']['lock_number'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'number posting has been locked'
  end
end

local function unlock_group_number(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_number_lock = data[tostring(target)]['settings']['lock_number']
  if group_number_lock == 'no' then
    return 'number posting is not locked'
  else
    data[tostring(target)]['settings']['lock_number'] = 'no'
    save_data(_config.moderation.data, data)
    return 'number posting has been unlocked'
  end
end

local function lock_group_operator(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_operator_lock = data[tostring(target)]['settings']['lock_operator']
  if group_operator_lock == 'yes' then
    return 'operator posting is already locked'
  else
    data[tostring(target)]['settings']['lock_operator'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'operator posting has been locked'
  end
end

local function unlock_group_operator(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_operator_lock = data[tostring(target)]['settings']['lock_operator']
  if group_operator_lock == 'no' then
    return 'operator posting is not locked'
  else
    data[tostring(target)]['settings']['lock_operator'] = 'no'
    save_data(_config.moderation.data, data)
    return 'operator posting has been unlocked'
  end
end

local function lock_group_poker(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_poker_lock = data[tostring(target)]['settings']['lock_poker']
  if group_poker_lock == 'yes' then
    return 'poker posting is already locked'
  else
    data[tostring(target)]['settings']['lock_poker'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'poker posting has been locked'
  end
end

local function unlock_group_poker(msg, data, target)
  if not is_momod(msg) then
    return
  end
  local group_poker_lock = data[tostring(target)]['settings']['lock_poker']
  if group_poker_lock == 'no' then
    return 'poker posting is not locked'
  else
    data[tostring(target)]['settings']['lock_poker'] = 'no'
    save_data(_config.moderation.data, data)
    return 'poker posting has been unlocked'
  end
end

	local function lock_group_audio(msg, data, target)
		local msg_type = 'Audio'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_audio_lock = data[tostring(target)]['settings']['lock_audio']
  if group_audio_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'audio posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_audio'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'audio posting has been locked'
    end
  end
end

local function unlock_group_audio(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'Audio'
  if not is_momod(msg) then
    return
  end
  local group_audio_lock = data[tostring(target)]['settings']['lock_audio']
  if group_audio_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'audio posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_audio'] = 'no'
    save_data(_config.moderation.data, data)
    return 'audio posting has been unlocked'
    end
  end
end

	local function lock_group_photo(msg, data, target)
		local msg_type = 'Photo'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'photo posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_photo'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'photo posting has been locked'
    end
  end
end

local function unlock_group_photo(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'Photo'
  if not is_momod(msg) then
    return
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'photo posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_photo'] = 'no'
    save_data(_config.moderation.data, data)
    return 'photo posting has been unlocked'
    end
  end
end

	local function lock_group_video(msg, data, target)
		local msg_type = 'Video'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_video_lock = data[tostring(target)]['settings']['lock_video']
  if group_video_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'video posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_video'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'video posting has been locked'
    end
  end
end

local function unlock_group_video(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'Video'
  if not is_momod(msg) then
    return
  end
  local group_video_lock = data[tostring(target)]['settings']['lock_video']
  if group_video_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'video posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_video'] = 'no'
    save_data(_config.moderation.data, data)
    return 'video posting has been unlocked'
    end
  end
end

	local function lock_group_documents(msg, data, target)
		local msg_type = 'Documents'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_documents_lock = data[tostring(target)]['settings']['lock_documents']
  if group_documents_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'documents posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_documents'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'documents posting has been locked'
    end
  end
end

local function unlock_group_documents(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'Documents'
  if not is_momod(msg) then
    return
  end
  local group_documents_lock = data[tostring(target)]['settings']['lock_documents']
  if group_documents_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'documents posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_documents'] = 'no'
    save_data(_config.moderation.data, data)
    return 'documents posting has been unlocked'
    end
  end
end

	local function lock_group_text(msg, data, target)
		local msg_type = 'Text'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_text_lock = data[tostring(target)]['settings']['lock_text']
  if group_text_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'text posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_text'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'text posting has been locked'
    end
  end
end

local function unlock_group_text(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'Text'
  if not is_momod(msg) then
    return
  end
  local group_text_lock = data[tostring(target)]['settings']['lock_text']
  if group_text_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'text posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_text'] = 'no'
    save_data(_config.moderation.data, data)
    return 'text posting has been unlocked'
    end
  end
end

	local function lock_group_all(msg, data, target)
		local msg_type = 'All'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_all_lock = data[tostring(target)]['settings']['lock_all']
  if group_all_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'all posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_all'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'all posting has been locked'
    end
  end
end

local function unlock_group_all(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'All'
  if not is_momod(msg) then
    return
  end
  local group_all_lock = data[tostring(target)]['settings']['lock_all']
  if group_all_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'all posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_all'] = 'no'
    save_data(_config.moderation.data, data)
    return 'all posting has been unlocked'
    end
  end
end

	local function lock_group_gifs(msg, data, target)
		local msg_type = 'Gifs'
		local chat_id = msg.to.id
  if not is_momod(msg) then
    return
  end
  local group_gifs_lock = data[tostring(target)]['settings']['lock_gifs']
  if group_gifs_lock == 'yes' and is_muted(chat_id, msg_type..': yes') then
    return 'gifs posting is already locked'
  else
    if not is_muted(chat_id, msg_type..': yes') then
		mute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_gifs'] = 'yes'
    save_data(_config.moderation.data, data)
    return 'gifs posting has been locked'
    end
  end
end

local function unlock_group_gifs(msg, data, target)
	local chat_id = msg.to.id
	local msg_type = 'Gifs'
  if not is_momod(msg) then
    return
  end
  local group_gifs_lock = data[tostring(target)]['settings']['lock_gifs']
  if group_gifs_lock == 'no' and not is_muted(chat_id, msg_type..': yes') then
    return 'gifs posting is not locked'
  else
  	if is_muted(chat_id, msg_type..': yes') then
		unmute(chat_id, msg_type)
    data[tostring(target)]['settings']['lock_gifs'] = 'no'
    save_data(_config.moderation.data, data)
    return 'gifs posting has been unlocked'
    end
  end
end

    local function isABotBadWay (user)
      local username = user.username or ''
      return username:match("[Bb]ot$")
    end
	--Prerequisite.
--Begin pre_process function
local function pre_process(msg)
-- Begin 'RondoMsgChecks' text checks by @rondoozle and Edited by @janlou
-- Powered by @AdvanTm
-- CopyRight all right reserved
if is_chat_msg(msg) or is_super_group(msg) then
	if msg and not is_momod(msg) and not is_whitelisted(msg.from.id) then --if regular user
	local data = load_data(_config.moderation.data)
	local print_name = user_print_name(msg.from):gsub("‮", "") -- get rid of rtl in names
	local name_log = print_name:gsub("_", " ") -- name for log
	local to_chat = msg.to.type == 'chat'
	local to_super = msg.to.type == 'channel'
	if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] then
		settings = data[tostring(msg.to.id)]['settings']
	else
		return
	end
	if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'no'
	end
	if settings.lock_rtl then
		lock_rtl = settings.lock_rtl
	else
		lock_rtl = 'no'
	end
		if settings.lock_tgservice then
		lock_tgservice = settings.lock_tgservice
	else
		lock_tgservice = 'no'
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
	end
	if settings.lock_member then
		lock_member = settings.lock_member
	else
		lock_member = 'no'
	end
	if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'no'
	end
	if settings.lock_sticker then
		lock_sticker = settings.lock_sticker
	else
		lock_sticker = 'no'
	end
	if settings.lock_contacts then
		lock_contacts = settings.lock_contacts
	else
		lock_contacts = 'no'
	end
	if settings.strict then
		strict = settings.strict
	else
		strict = 'no'
	end
		if msg and not msg.service and is_muted(msg.to.id, 'All: yes') or is_muted_user(msg.to.id, msg.from.id) and not msg.service then
			delete_msg(msg.id, ok_cb, false)
			if to_chat then
			--	kick_user(msg.from.id, msg.to.id)
			end
		end
		if msg.text then -- msg.text checks
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			if lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					delete_msg(msg.id, ok_cb, false)
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
			local is_bot = msg.text:match("?[Ss][Tt][Aa][Rr][Tt]=")
			if is_link_msg and lock_link == "yes" and not is_bot then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		if msg.service then 
			if lock_tgservice == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					return
				end
			end
		end
			local is_squig_msg = msg.text:match("[\216-\219][\128-\191]")
			if is_squig_msg and lock_arabic == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local print_name = msg.from.print_name
			local is_rtl = print_name:match("‮") or msg.text:match("‮")
			if is_rtl and lock_rtl == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, "Text: yes") and msg.text and not msg.media and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.media then -- msg.media checks
			if msg.media.title then
				local is_link_title = msg.media.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_title = msg.media.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.description then
				local is_link_desc = msg.media.description:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.description:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_desc and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_desc = msg.media.description:match("[\216-\219][\128-\191]")
				if is_squig_desc and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.caption then -- msg.media.caption checks
				local is_link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_caption and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_caption = msg.media.caption:match("[\216-\219][\128-\191]")
					if is_squig_caption and lock_arabic == "yes" then
						delete_msg(msg.id, ok_cb, false)
						if strict == "yes" or to_chat then
							kick_user(msg.from.id, msg.to.id)
						end
					end
				local is_username_caption = msg.media.caption:match("^@[%a%d]")
				if is_username_caption and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				if lock_sticker == "yes" and msg.media.caption:match("sticker.webp") then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if msg.media.type:match("contact") and lock_contacts == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_photo_caption =  msg.media.caption and msg.media.caption:match("photo")--".jpg",
			if is_muted(msg.to.id, 'Photo: yes') and msg.media.type:match("photo") or is_photo_caption and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--	kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_gif_caption =  msg.media.caption and msg.media.caption:match(".mp4")
			if is_muted(msg.to.id, 'Gifs: yes') and is_gif_caption and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--	kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Audio: yes') and msg.media.type:match("audio") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_video_caption = msg.media.caption and msg.media.caption:lower(".mp4","video")
			if  is_muted(msg.to.id, 'Video: yes') and msg.media.type:match("video") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Documents: yes') and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.fwd_from then
			if msg.fwd_from.title then
				local is_link_title = msg.fwd_from.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.fwd_from.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_title = msg.fwd_from.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			end
			if is_muted_user(msg.to.id, msg.fwd_from.peer_id) then
				delete_msg(msg.id, ok_cb, false)
			end
		end
		if msg.service then -- msg.service checks
		local action = msg.action.type
			if action == 'chat_add_user_link' then
				local user_id = msg.from.id
				local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
				if string.len(msg.from.print_name) > 70 or ctrl_chars > 40 and lock_group_spam == 'yes' then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.from.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					kick_user(user_id, msg.to.id)
				end
				if lock_member == 'yes' then
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
			if action == 'chat_add_user' and not is_momod2(msg.from.id, msg.to.id) then
				local user_id = msg.action.user.id
				if string.len(msg.action.user.print_name) > 70 and lock_group_spam == 'yes' then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						delete_msg(msg.id, ok_cb, false)
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.action.user.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					kick_user(user_id, msg.to.id)
				end
				if msg.to.type == 'channel' and lock_member == 'yes' then
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
		end
   end
   if not is_momod(msg) and not is_whitelisted(msg.from.id) and not is_sudo(msg) and not is_owner(msg) and not is_vip(msg) then
            if msg.text:match("@[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]") then
	            if lock_link == 'yes' then
	                if msg.to.type == 'channel' then
	                    if strict == 'no' then
		                  delete_msg(msg.id, ok_cb, false)
		                elseif strict == 'yes' then
		                  delete_msg(msg.id, ok_cb, false)
		                  kick_user(msg.from.id, msg.to.id)
		                end
		            end
		              if msg.to.type == 'chat' then
		                 kick_user(msg.from.id, msg.to.id)
	                  end
		        end
            end	
   end
end
             --Fwd lock:
    hash = 'fwd:'..msg.to.id
    if redis:get(hash) and msg.fwd_from and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg)  then
            delete_msg(msg.id, ok_cb, true)
            return
        end
    --Fwd lock.
    --Reply lock:
    hash2 = 'reply:'..msg.to.id
    if redis:get(hash2) and msg.reply_id and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg) then
            delete_msg(msg.id, ok_cb, true)
            return
        end
    --Reply lock.
-- End 'RondoMsgChecks' text checks by @Rondoozle
	return msg
end

 function run(msg, matches)
      if msg.text:match("^[!/#][Zz][Ee][Uu][Zz]$") then
    	txt = _config.about_text
    	return txt
      end
          if msg.text:match("^[!/#][Rr][Aa][Tt][Ee]$") then
          Group_rate = _config.Group_rate
    	    Supergroup_rate = _config.Supergroup_rate
    	    price = "Rial"
		if Group_rate ~= "" or Supergroup_rate ~= "" then
    	         rate = "Rate of:\n\nChat: "..Group_rate.." "..price.."\nSuperGroup: "..Supergroup_rate.." "..price
    	         send_msg(get_receiver(msg), rate, ok_cb, false)
		else
		 rate = "Erore: Rate is not set!"
    	         send_msg(get_receiver(msg), rate, ok_cb, false)
                end
	  end
	  
	  	receiver = get_receiver(msg)
	user = "user"
	chat =  "chat"
	channel = "channel"
	
	local data = load_data(_config.moderation.data)
	
    if data[tostring(msg.to.id)] then
    if data[tostring(msg.to.id)]['settings'] then
    if data[tostring(msg.to.id)]['settings']['lock_media'] then
	 lock_media = data[tostring(msg.to.id)]['settings']['lock_media']
    end
    if data[tostring(msg.to.id)]['settings']['lock_fwd'] then
	 lock_fwd = data[tostring(msg.to.id)]['settings']['lock_fwd']
	end
	if data[tostring(msg.to.id)]['settings']['lock_reply'] then
	 lock_reply = data[tostring(msg.to.id)]['settings']['lock_reply']
	end
	if data[tostring(msg.to.id)]['settings']['lock_share'] then
	 lock_share = data[tostring(msg.to.id)]['settings']['lock_share']
	end
	if data[tostring(msg.to.id)]['settings']['lock_tag'] then
	 lock_tag = data[tostring(msg.to.id)]['settings']['lock_tag']
    end
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
	 lock_bots = data[tostring(msg.to.id)]['settings']['lock_bots']
	end
	if data[tostring(msg.to.id)]['settings']['lock_number'] then
	 lock_number = data[tostring(msg.to.id)]['settings']['lock_number']
	end
	if data[tostring(msg.to.id)]['settings']['lock_operator'] then
	 lock_operator = data[tostring(msg.to.id)]['settings']['lock_operator']
	end
	if data[tostring(msg.to.id)]['settings']['lock_poker'] then
	 lock_poker = data[tostring(msg.to.id)]['settings']['lock_poker']
	end
	end
	end
		
    if is_chat_msg(msg) or is_super_group(msg) then
	    if not is_momod(msg) and not is_whitelisted(msg.from.id) and not is_sudo(msg) and not is_owner(msg) and not is_admin1(msg) then
            --Media lock:
		 if matches[1]:lower() == "photo" or "document" or "video" or "audio" or "unsupported" or "gif" then
          if lock_media == "yes" then
		   if msg.to.type == channel then
           delete_msg(msg.id, ok_cb, true)
		   end
          end
		 end
	        --Media lock.
			--Share lock:
		 if matches[1]:lower() == "contact" then
          if lock_share == "yes" then
		   if msg.to.type == channel then
           delete_msg(msg.id, ok_cb, true)
		   end
          end
		 end
			--Share lock.
			--Tag lock:
	     if msg.text:match("#") then
          if lock_tag == "yes" then
		   if msg.to.type == channel then
           delete_msg(msg.id, ok_cb, true)
		   end
          end
		 end
			--Tag lock.
			--Bots lock:
	     if matches[1] == "chat_add_user" or matches[1] == "chat_add_user_link" then
		  if lock_bots == "yes" then
             local user = msg.action.user or msg.from
           if isABotBadWay(user) then
              userId = user.id
			  chatId = msg.to.id
		     if msg.to.type == channel then
              kickUser("user#id"..userId, "channel#id"..chatId)
              channel_kick_user("channel#id"..msg.to.id, 'user#id'..userId, ok_cb, false)
		   --elseif msg.to.type == chat then
		      --chat_del_user(userId, chatId)
		     end
           end
		  end
         end
			--Bots lock.
			--Number lock:
		 if msg.text:match("%d+") then
          if lock_number == "yes" then
		   if msg.to.type == channel then
           delete_msg(msg.id, ok_cb, true)
		   end
          end
		 end
			--Number lock.
			--Operator lock:
	     if matches[1]:lower() == "شارژ" or "ایرانسل" or "irancell" or "ir-mci" or "همراه اول" or "رایتل" or "تالیا" then
          if lock_operator == "yes" then
		   if msg.to.type == channel then
           delete_msg(msg.id, ok_cb, true)
		   end
          end
		 end
			--Operator lock.
			--Poker lock:
		 if msg.text:match("😐") then
          if lock_poker == "yes" then
		   if msg.to.type == channel then
           delete_msg(msg.id, ok_cb, true)
		   end
          end
		 end
			--Poker lock.
		end
	--Lock or Unlock settings:
	if is_momod(msg) then
	  if is_super_group(msg) then
	    if matches[1] == 'lock' then
			local target = msg.to.id
			if matches[2] == 'media' then
				return lock_group_media(msg, data, target)
			end
			if matches[2] == 'fwd' then
				return lock_group_fwd(msg, data, target)
			end
			if matches[2] == 'reply' then
				return lock_group_reply(msg, data, target)
			end
			if matches[2] == 'share' then
				return lock_group_share(msg, data, target)
			end
			if matches[2] == 'tag' then
				return lock_group_tag(msg, data, target)
			end
			if matches[2] == 'bots' then
				return lock_group_bots(msg, data, target)
			end
			if matches[2] == 'number' then
				return lock_group_number(msg, data, target)
			end
			if matches[2] == 'operator' then
				return lock_group_operator(msg, data, target)
			end
			if matches[2] == 'poker' then
				return lock_group_poker(msg, data, target)
			end
			if matches[2] == 'audio' then
				return lock_group_audio(msg, data, target)
			end
			if matches[2] == 'photo' then
				return lock_group_photo(msg, data, target)
			end
			if matches[2] == 'video' then
				return lock_group_video(msg, data, target)
			end
			if matches[2] == 'documents' then
				return lock_group_documents(msg, data, target)
			end
			if matches[2] == 'text' then
				return lock_group_text(msg, data, target)
			end
			if matches[2] == 'all' then
				return lock_group_all(msg, data, target)
			end
			if matches[2] == 'gifs' then
				return lock_group_gifs(msg, data, target)
			end
        end
		
		if matches[1] == 'unlock' then
			local target = msg.to.id
			if matches[2] == 'media' then
				return unlock_group_media(msg, data, target)
			end
			if matches[2] == 'fwd' then
				return unlock_group_fwd(msg, data, target)
			end
			if matches[2] == 'reply' then
				return unlock_group_reply(msg, data, target)
			end
			if matches[2] == 'share' then
				return unlock_group_share(msg, data, target)
			end
			if matches[2] == 'tag' then
				return unlock_group_tag(msg, data, target)
			end
			if matches[2] == 'bots' then
				return unlock_group_bots(msg, data, target)
			end
			if matches[2] == 'number' then
				return unlock_group_number(msg, data, target)
			end
			if matches[2] == 'operator' then
				return unlock_group_operator(msg, data, target)
			end
			if matches[2] == 'poker' then
				return unlock_group_poker(msg, data, target)
			end
			if matches[2] == 'audio' then
				return unlock_group_audio(msg, data, target)
			end
			if matches[2] == 'photo' then
				return unlock_group_photo(msg, data, target)
			end
			if matches[2] == 'video' then
				return unlock_group_video(msg, data, target)
			end
			if matches[2] == 'documents' then
				return unlock_group_documents(msg, data, target)
			end
			if matches[2] == 'text' then
				return unlock_group_text(msg, data, target)
			end
			if matches[2] == 'all' then
				return unlock_group_all(msg, data, target)
			end
			if matches[2] == 'gifs' then
				return unlock_group_gifs(msg, data, target)
			end
         end
        end
	end
	--Lock or Unlock settings.
  end
 end
--End pre_process function
return {
	patterns = {
"@[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz][ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]",
"[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/",
"?[Ss][Tt][Aa][Rr][Tt]=",
"^[!/#][Zz][Ee][Uu][Ss]$",
"^[!/#][Rr][Aa][Tt][Ee]$",
"😐",
"(شارژ)",
"(ایرانسل)",
"(irancell)",
"(ir-mci)",
"(همراه اول)",
"(رایتل)",
"(تالیا)",
"#",
"%d+",
"^[!/#](lock) (.*)$",
"^[!/#](unlock) (.*)$",
"%[(photo)%]",
"%[(document)%]",
"%[(video)%]",
"%[(audio)%]",
"%[(unsupported)%]",
"%[(gif)%]",
"%[(contact)%]",
"^!!tgservice (chat_add_user)$",
"^!!tgservice (chat_add_user_link)$",
	},
	pre_process = pre_process,
	run = run
}
--End security.lua
--By @Rondoozle
