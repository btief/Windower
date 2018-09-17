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
    state.OffenseMode:options('Normal')
    state.WeaponskillMode:options('Normal')
--BIND BUTTONS   *** f9 to flee ***  ***f10 to switch TH MODES ***
    send_command('bind f9 input /ja "Flee" <me>')
    send_command('bind f10 gs c cycle treasuremode')
	send_command('wait 2; input /lockstyleset 08')
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
    sets.precast.JA['Collaborator'] = {}
    sets.precast.JA['Accomplice'] = {}
    sets.precast.JA['Flee'] = {}
    sets.precast.JA['Hide'] = {}
    sets.precast.JA['Steal'] = {}
    sets.precast.JA['Despoil'] = {}
    sets.precast.JA['Perfect Dodge'] = {}
    sets.precast.JA['Feint'] = {}
    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']
--FC
    sets.precast.FC = {
		ammo="Impatiens",
		head={ name="Herculean Helm", augments={'Attack+28','"Triple Atk."+2','DEX+1',}},
		body={ name="Mirke Wardecors", augments={'Evasion+10','"Fast Cast"+5',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+7','Crit. hit damage +3%','DEX+5','Attack+2',}},
		legs={ name="Herculean Trousers", augments={'Accuracy+5 Attack+5','Crit. hit damage +5%','Accuracy+14','Attack+10',}},
		feet="Hattori Kyahan",
		neck="Magoraga Beads",
		waist="Phasmida Belt",
		left_ear="Loquac. Earring",
		right_ear="Brutal Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back="Moonbeam Cape",
	}
--ROLL
    sets.precast.CorsairRoll = {
		head="Commodore tricorne +1",
		neck="Regal necklace",
		right_ring="Luzaf's ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+7','"Dual Wield"+10',}},
	}	
	-- Snap Shot
    sets.precast.RA = {
        body="Oshosi Vest", --14/0
        hands="Lanun Gants +1", --8/11
        legs="Oshosi trousers", --9/10
        feet="Meg. Jam. +1", --10/0
        waist="Yemaya Belt", --0/5
      } --61/26	
    -- Ranged gear
    sets.midcast.RA = {
		head="Meghanada Visor +1",
		body="Mummu Jacket +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet="Meg. Jam. +1",
		neck="Arctier's Torque",
		waist="Kwahu Kachina Belt",
		left_ear="Brutal Earring",
		right_ear="Volley Earring",
		left_ring="Garuda Ring +1",
		right_ring="Garuda Ring +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
        }
	-- Quick Draw	
    sets.midcast.CorsairShot = {
		head="Pixie Hairpin +1",
		body="Mummu Jacket +2",
		hands={ name="Herculean Gloves", augments={'Mag. Acc.+20','Weapon skill damage +2%','CHR+11','"Mag.Atk.Bns."+15',}},
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +2%','INT+7','Mag. Acc.+5',}},
		feet={ name="Lanun Bottes +1", augments={'Enhances "Wild Card" effect',}},
		neck="Baetyl Pendant",
		waist="Kwahu Kachina Belt",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Garuda Ring +1",
		right_ring="Garuda Ring +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
        }		
--WS
    sets.precast.WS = {
		ammo="Jukukik Feather",
		head={ name="Herculean Helm", augments={'Attack+28','"Triple Atk."+2','DEX+1',}},
		body={ name="Herculean Vest", augments={'Accuracy+23 Attack+23','"Triple Atk."+2','DEX+9','Accuracy+14','Attack+4',}},
		hands={ name="Herculean Gloves", augments={'Accuracy+7','Crit. hit damage +3%','DEX+5','Attack+2',}},
		legs={ name="Herculean Trousers", augments={'Accuracy+5 Attack+5','Crit. hit damage +5%','Accuracy+14','Attack+10',}},
		feet={ name="Herculean Boots", augments={'Crit. hit damage +5%','STR+2','Accuracy+10','Attack+14',}},
		neck="Soil Gorget",
		waist="Windbuffet Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
		right_ear="Brutal Earring",
		left_ring="Regal Ring",
		right_ring="Begrudging Ring",
		back="Atheling Mantle",
		}
--MAGIC AOE WS
    sets.precast.WS['Leaden Salute'] = {
		head="Pixie Hairpin +1",
		body="Meg. Cuirie +1",
		hands={ name="Herculean Gloves", augments={'Mag. Acc.+20','Weapon skill damage +2%','CHR+11','"Mag.Atk.Bns."+15',}},
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +2%','INT+7','Mag. Acc.+5',}},
		feet="Meg. Jam. +1",
		neck="Baetyl Pendant",
		waist="Kwahu Kachina Belt",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
		left_ring="Archon Ring",
		right_ring="Karieyh Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
	}
--add 2 dashes below to remove TH from AE
--IDLE  (basically add movement+ to melee set)
    sets.idle = {back="Aptitude mantle +1",}
-- MELEE
    sets.engaged = {
		ammo="Ginsen",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Herculean Trousers", augments={'Accuracy+5 Attack+5','Crit. hit damage +5%','Accuracy+14','Attack+10',}},
		feet={ name="Herculean Boots", augments={'"Triple Atk."+3','AGI+2','Attack+14',}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Atheling Mantle",
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