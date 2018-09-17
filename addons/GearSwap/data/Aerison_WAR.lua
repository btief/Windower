-- Initialization function for this job file.

require 'organizer-lib'

function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end
 
-- //gs debugmode
-- //gs showswaps
 
function binds_on_load()
-- F9-F12
    send_command('bind f9 gs c cycle OffenseMode')
    send_command('bind f10 gs c cycle HybridMode')
    send_command('bind f11 gs c cycle CastingMode')
    send_command('bind f12 gs c update user')
-- CTRL F9-F12
    send_command('bind ^f9 gs c cycle WeaponskillMode')
-- ALT F9-12
    send_command('bind !f9 gs c cycle IdleMode')
    send_command('bind !f10 gs c cycle RangedMode')
    send_command('bind !f12 gs c cycle Kiting')
end
 
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'MDT')
 
    Rag_weapons = S{'Ragnarok'}
    Shield_weapons = S{'Blurred Shield +1'}
                 
    update_combat_form()
    select_default_macro_book()
end
 
-- Called when this job file is unloaded (eg: job change)
function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()
-- Precast sets
    sets.precast.JA['Berserk'] = {feet="Agoge Calligae",body="Pummeler's Lorica +1",back="Cichol's Mantle"}
    sets.precast.JA['Warcry'] = {head="Agoge Mask +1"}
    sets.precast.JA['Aggressor'] = {body="Agoge Lorica",head="Pummeler's Mask +1"}
    sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1"}
    sets.precast.JA['Retaliation'] = {feet="Boii Calligae +1",hands="Pummeler's Mufflers +1"}
    sets.precast.JA['Restraint'] = {hands="Ravager's mufflers +2"}
    sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers +1"}
    sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses +1"}
    sets.precast.JA['Provoke'] = {
        head="Pummeler's Mask +1", body="Souveran Cuirass",
        back="Reiki Cloak", neck="Unmoving Collar +1",
        hands="Pummeler's Mufflers +1", waist="Trance Belt",
        legs="Odyssean Cuisses", feet="Souveran Schuhs",
        Ring1="Petrov Ring", Ring2="Apeile Ring",
        ear1="Enchanter Earring +1", ear2="Gwati Earring"
    }
 
-- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Fire bomblet",
        head="Twilight helm", body="Twilight helm",
        back="Aptitude mantle +1", neck="Orunmila's Torque",
        hands="Warrior's mufflers +2", waist="Ioskeha belt",
        legs="Warrior's cuisses +2", feet="Hermes' sandals",
        ring1="Defending ring", ring2="Paguroidea ring",}
     
    -- Midcast Sets
    sets.midcast.FastRecast = {
        ammo="Sapience Orb",
        head="Carmine Mask +1", body={ name="Odyss. Chestplate", augments={'Mag. Acc.+21','"Fast Cast"+6',}},
        back=Ank_STP, neck="Orunmila's Torque",
        hands="Leyline Gloves", waist="Tempus Fugit",
        legs="Eschite Cuisses", feet={ name="Odyssean Greaves", augments={'Mag. Acc.+9','"Fast Cast"+5','INT+6',}},
        ring1="Prolix Ring", ring2="Rahab Ring",
        ear1="Etiolation Earring", ear2="Loquacious Earring"}
         
    sets.midcast.Flash = {
        head="Pummeler's Mask +1", body="Souveran Cuirass",
        back="Reiki Cloak", neck="Unmoving Collar +1",
        hands="Pummeler's Mufflers +1", waist="Trance Belt",
        legs="Odyssean Cuisses", feet="Souveran Schuhs",
        Ring1="Petrov Ring", Ring2="Apeile Ring",
        ear1="Enchanter Earring +1", ear2="Gwati Earring"
    }
         
    -- Resting sets
    sets.resting = {
        ammo="Ginsen",
        head="", body="Lugra Cloak +1",
        back="Xucau Mantle", neck="Sanctity Necklace",
        hands="Sulevia's Gauntlets +1", waist="Flume Belt +1",
        legs="Carmine Cuisses +1",feet="Amm Greaves",
        ring1="Paguroidea Ring", ring2="Chirich Ring +1",
        ear1="Infused Earring", ear2="Genmei Earring"}
 
-- Idle sets
    sets.idle = {
        ammo="Fire bomblet",
        head="Twilight helm", body="Twilight mail",
        back="Aptitude mantle +1", neck="Twilight Torque",
        hands="Warrior's mufflers +2", waist="Ioskeha belt",
        legs="Warrior's cuisses +2", feet="Hermes' sandals",
        ring1="Defending ring", ring2="Paguroidea ring"}
 
    sets.idle.PDT = {
        ammo="Brigantia Pebble",
        head="Sulevia's Mask +1", body="Sulevia's Platemail +1",
        back="Xucau Mantle", neck="Twilight Torque",
        hands="Sulevia's Gauntlets +1", waist="Flume Belt +1",
        legs="Sulevia's Cuisses +1", feet="Amm Greaves",
        ring1="Defending Ring", ring2={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -5%',}},
        ear1="Odnowa Earring +1", ear2="Genmei Earring"}
 
    sets.idle.Town = {
        ammo="Fire bomblet",
        head="Twilight helm", body="Twilight mail",
        back="Aptitude mantle +1", neck="Twilight Torque",
        hands="Warrior's mufflers +2", waist="Ioskeha belt",
        legs="Warrior's cuisses +2", feet="Hermes' sandals",
        ring1="Defending ring", ring2="Paguroidea ring"}
         
    --Engaged Ragnarok
    -- 1100ACC 57STP
    sets.engaged = {
		ammo="Ginsen",
		head="Flamma zucchetto +2",
		body="Valorous Mail",
		hands="Sulevia's gauntlets +2",
		legs="Pummeler's cuisses +2",
		feet="Valorous Greaves",
		neck="Agasaya's collar",
		waist="Ioskeha Belt",
		left_ear="Brutal Earring",
		right_ear="Cessance Earring",
		left_ring="Rajas Ring",
		right_ring="Flamma Ring",
		back="Aptitude Mantle +1"
}   
    -- 1086ACC 65STP
         
    -- Sword and Board Sets
         
    -- Weaponskill sets
    sets.precast.WS = {
		ammo="Fire Bomblet",
		head="Flamma zucchetto +2",
		body="Argosy Hauberk +1",
		hands="Sulevia's gauntlets +2",
		legs="Pummeler's cuisses +2",
		feet="Flamma gambieras +1",
		neck="Breeze Gorget",
		waist="Thunder Belt",
		left_ear="Brutal Earring",
		right_ear="Moonshade Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back="Cichol's mantle"
	}	
    sets.precast.WS.Acc = set_combine(sets.precast.WS), {
		ammo="Fire Bomblet",
		head="Flamma zucchetto +2",
		body="Argosy Hauberk +1",
		hands="Sulevia's gauntlets +2",
		legs="Pummeler's cuisses +2",
		feet="Flamma gambieras +1",
		neck="Breeze Gorget",
		waist="Thunder Belt",
		left_ear="Brutal Earring",
		right_ear="Moonshade Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back="Cichol's mantle"
	}
     
     -- Mighty Strikes WS Set --
    sets.MS_WS = {ammo="Yetshila", feet="Boii Calligae +1"}
end
 
-- Job-specific hooks for standard casting events.
function job_midcast(spell, action, spellMap, eventArgs)
  
end
 
-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
 
end
 
function update_combat_form()
    -- Check Weapontype
    if  Rag_weapons:contains(player.equipment.main) then
        state.CombatForm:set('Ragnarok')
    elseif
        Shield_weapons:contains(player.equipment.sub) then
        state.CombatForm:set('Blurred')
    else
        state.CombatForm:reset()
    end
end
 
function job_update(cmdParams, eventArgs)
    update_combat_form()
end
 
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end
 
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
moonshade_WS = S{"Resolution", "Torcleaver"}
 
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if world.time >= (17*60) or world.time <= (7*60) then
            equip({ear1="Lugra Earring +1",ear2="Lugra Earring"})
        end
        if moonshade_WS:contains(spell.english) and player.tp<2950 then  
            equip({ear2="Moonshade Earring"})
        end
        if buffactive['Mighty Strikes'] then 
            if sets.precast.WS[spell] then
                equipSet = sets.precast.WS[spell]
                equipSet = set_combine(equipSet,sets.MS_WS)
                equip(equipSet)
            else
                equipSet = sets.precast.WS
                equipSet = set_combine(equipSet,sets.MS_WS)
                equip(equipSet)
            end
        end
    end
end
     
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(6, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(6, 6)
    end
end
        