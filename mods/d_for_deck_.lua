--- STEAMODDED HEADER
--- MOD_NAME: D 4 Deck
--- MOD_ID: D4Deck
--- MOD_AUTHOR: [Fso]
--- MOD_DESCRIPTION: In Game, press D 4 Deck
----------------------------------------------
------------MOD CODE -------------------------


if Controller and Controller.key_hold_update then
	
	local key_hold_update_ref = Controller.key_hold_update

    function Controller:key_hold_update(key, dt)
		key_hold_update_ref(self, key, dt)
            if self.held_key_times[key] then
				if key == "d" and not G.SETTINGS.paused then
					if self.held_key_times[key] > 0.05 then
                        G.FUNCS.deck_info()
					else
						self.held_key_times[key] = self.held_key_times[key] + dt
					end
				end
            end
        end
    end

----------------------------------------------
------------MOD CODE END----------------------