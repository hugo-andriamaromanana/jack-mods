--- STEAMODDED HEADER
--- MOD_NAME: Fast Reset on P
--- MOD_ID: FRonP
--- MOD_AUTHOR: [Fso]
--- MOD_DESCRIPTION: In Game, Press P to Fast Reset the Run
----------------------------------------------
------------MOD CODE -------------------------


if Controller and Controller.key_hold_update then
	
	local key_hold_update_ref = Controller.key_hold_update

    function Controller:key_hold_update(key, dt)
		key_hold_update_ref(self, key, dt)
            if self.held_key_times[key] then
				if key == "p" and not G.SETTINGS.paused then
					if self.held_key_times[key] > 0.05 then
						if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then 
							G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
						end
						G:save_settings()
						self.held_key_times[key] = nil
						G.SETTINGS.current_setup = 'New Run'
						G.GAME.viewed_back = nil
						G.run_setup_seed = G.GAME.seeded
						G.challenge_tab = G.GAME and G.GAME.challenge and G.GAME.challenge_tab or nil
						G.forced_seed, G.setup_seed = nil, nil
						if G.GAME.seeded then G.forced_seed = G.GAME.pseudorandom.seed end
						G.forced_stake = G.GAME.stake
						if G.STAGE == G.STAGES.RUN then G.FUNCS.start_setup_run() end
						G.forced_stake = nil
						G.challenge_tab = nil
						G.forced_seed = nil
					else
						self.held_key_times[key] = self.held_key_times[key] + dt
					end
				end
            end
        end
    end

----------------------------------------------
------------MOD CODE END----------------------
