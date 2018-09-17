--Source lua from here.
--https://github.com/Kinematics/GearSwap-Jobs/blob/master/THF.lua
--Refer to that lua for questions on what does what and whats missing. 
--
--Broke the lua down to the bare bones
--BIND BUTTONS line32 *** f9 to flee ***  ***f10 to switch TH MODES ***
--TH mode cycle is: None(wont equip th), Tag(equips for initial hit), 
--------------SATA(equips for SATA and initial hit), Fulltime(always on)
--Gear Sets are available for: TH, SA, TA, JA, FC, WS, M.WS, Idle, Melee
--EDIT line 43-75 for your gear. 
-- Put pasted gear between {} 
--GEAR SETS are marked with --  
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	include('organizer-lib')
end
 
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    include('Mote-TreasureHunter')
    info.default_ja_ids = S{35, 204}
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end
 
function user_setup()
--TARGET MODES (deleted them to normal only)
    state.OffenseMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal')
--BIND BUTTONS   *** f9 to flee ***  ***f10 to switch TH MODES ***
	send_command('wait 2; input /lockstyleset 14')
	send_command('bind !1 input /pcmd add Aerison')
	send_command('bind !2 input /pcmd add Astraios')
	send_command('bind !3 input /pcmd add Aeeri')
	send_command('bind !4 input /pcmd add Dualz')
	send_command('bind !w input /equip ring2 "Warp Ring"; /echo Warping; wait 11; input /item "Warp Ring" <me>;') 	
end
 
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end
 
function init_gear_sets()
----------------------------------------GEAR SETS START HERE------------------------------------------------------
--TH
    sets.TreasureHunter = {
	}
--SA
    sets.buff['Sneak Attack'] = {}
--TA
    sets.buff['Trick Attack'] = {}
--TH tagging abilies
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter
--JA
    sets.precast.JA.Meditate = {hands="Saotome kote +2", head="Wakido Kabuto +1", back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}	
--FC
    sets.precast.FC = {}
--ROLL
    sets.precast.CorsairRoll = {
	head="Commodore tricorne +1",
	neck="Regal necklace",
	right_ring="Luzaf's ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dual Wield"+10',}},
	}	
--WS
    sets.precast.WS['Tachi: Kaiten'] = {
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Pet: "Dbl. Atk."+1','"Dbl.Atk."+4','Weapon skill damage +7%',}},
		body={ name="Sakonji Domaru +2", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Attack+20','Weapon skill damage +2%','STR+10','Accuracy+9',}},
		legs="Wakido Haidate +3",
		feet="Valorous Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.precast.WS['Tachi: Shoha'] = {
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Pet: "Dbl. Atk."+1','"Dbl.Atk."+4','Weapon skill damage +7%',}},
		body={ name="Sakonji Domaru +2", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Attack+20','Weapon skill damage +2%','STR+10','Accuracy+9',}},
		legs="Wakido Haidate +3",
		feet="Valorous Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.precast.WS['Tachi: Kasha'] = {
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Pet: "Dbl. Atk."+1','"Dbl.Atk."+4','Weapon skill damage +7%',}},
		body={ name="Sakonji Domaru +2", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Attack+20','Weapon skill damage +2%','STR+10','Accuracy+9',}},
		legs="Wakido Haidate +3",
		feet="Valorous Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
--MAGIC AOE WS
    sets.precast.WS['Tachi: Fudo'] = {
		ammo="Knobkierrie",
		head={ name="Valorous Mask", augments={'Pet: "Dbl. Atk."+1','"Dbl.Atk."+4','Weapon skill damage +7%',}},
		body={ name="Sakonji Domaru +2", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Attack+20','Weapon skill damage +2%','STR+10','Accuracy+9',}},
		legs="Wakido Haidate +3",
		feet="Valorous Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
--add 2 dashes below to remove TH from AE
--IDLE  (basically add movement+ to melee set)
    sets.idle = {
		ammo="Staunch Tathlum",
		head={ name="Valorous Mask", augments={'Pet: "Dbl. Atk."+1','"Dbl.Atk."+4','Weapon skill damage +7%',}},
		body="Wakido Domaru +2",
		hands="Wakido Kote +2",
		legs="Ken. Hakama +1",
		feet="Danzo Sune-Ate",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Karieyh Ring",
		back="Moonbeam Cape",
		}
-- MELEE
    sets.engaged = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Kendatsuba samue +1",
		hands="Wakido kote +2",
		legs="Kendatsuba hakama +1",
		feet="Flam. Gambieras +2",
		neck="Moonlight Nodowa",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
	sets.engaged.DT = {
		ammo="Staunch Tathlum",
		head="Ken. Jinpachi +1",
		body="Wakido Domaru +2",
		hands="Wakido Kote +2",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		}
-- Defense sets
    sets.defense.PDT = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Kendatsuba samue +1",
		hands="Flam. Manopolas +1",
		legs="Kendatsuba hakama +1",
		feet="Flam. Gambieras +1",
		neck="Moonlight Nodowa",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back="Atheling mantle",
		}
    sets.defense.MDT = {
		ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",
		body={ name="Valorous Mail", augments={'Mag. Acc.+12','Weapon skill damage +4%','VIT+10','Attack+4',}},
		hands="Flam. Manopolas +1",
		legs="Ken. Hakama +1",
		feet={ name="Valorous Greaves", augments={'Accuracy+16','Weapon skill damage +3%','AGI+10','Attack+1',}},
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Brutal Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Moonbeam Cape",
		}

end
----------------------------------------GEAR SETS END HERE---------------------------------------------------------
 
-----------------------------------------------------IGNORE BELOW------------------------------
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end
 
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end
 
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end
 
function job_post_aftercast(spell, action, spellMap, eventArgs)
    check_buff('Feint', eventArgs)
end
 
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end
 
function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode
 
    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end
 
    return wsmode
end
 
function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
 
    return idleSet
end
 
function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
 
    return meleeSet
end
 
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end
 
function display_current_job_state(eventArgs)
    local msg = 'Melee'
     
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
     
    msg = msg .. ': '
     
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
     
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
     
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end
 
    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end
 
    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
     
    msg = msg .. ', TH: ' .. state.TreasureMode.value
 
    add_to_chat(122, msg)
 
    eventArgs.handled = true
end
 
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end
 
function th_action_check(category, param)
    if category == 2 or
        (category == 3 and param == 30) or
        (category == 6 and info.default_ja_ids:contains(param)) or
        (category == 14 and info.default_u_ja_ids:contains(param))
        then return true
    end
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'RUN' then
        set_macro_page(1, 13)
    else
        set_macro_page(1, 13)
    end
end