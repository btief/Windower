-------------------------------------------------------------------------------------------------------------------
-- (Original: Motenten / Modified: Arislan)
-------------------------------------------------------------------------------------------------------------------

--[[    Custom Features:
        
        Magic Burst            Toggle Magic Burst Mode  [Alt-`]
        Capacity Pts. Mode    Capacity Points Mode Toggle [WinKey-C]
        Auto. Lockstyle        Automatically locks desired equipset on file load
--]]

-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180

    state.CP = M(false, "Capacity Points Mode")
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Seidr', 'Resistant')
    state.IdleMode:options('Normal', 'DT')

    state.WeaponLock = M(false, 'Weapon Lock')    
    state.MagicBurst = M(false, 'Magic Burst')
    
    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^,')
    send_command('unbind !.')
    send_command('unbind @c')
    send_command('unbind @w')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad9')
    send_command('unbind ^numpad6')
    send_command('unbind ^numpad1')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Precast Sets -----------------------------------------
    ------------------------------------------------------------------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1"}
    sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +2", back="Nantosuelta's Cape"}
  
    -- Fast cast sets for spells
    
    sets.precast.FC = {
    --  /RDM --15
		main={ name="Grioavolr", augments={'"Fast Cast"+3','INT+11','Mag. Acc.+29','"Mag.Atk.Bns."+29','Magic Damage +3',}}, --14%
		sub="Clerisy Strap", --2%
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, --3%
		head={ name="Merlinic Hood", augments={'Attack+25','"Fast Cast"+6','INT+5','Mag. Acc.+1',}}, --14%
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+10','"Fast Cast"+6',}}, --12%
		hands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}},
		legs="Geomancy Pants +2", --13%
		feet={ name="Merlinic Crackows", augments={'MND+2','"Store TP"+4','"Refresh"+2','Accuracy+7 Attack+7',}}, --5%
		neck="Deceiver's Torque",
		waist="Witful Belt", --3%
		left_ear="Enchntr. Earring +1", --2%
		right_ear="Regal Earring",
		left_ring="Kishar Ring", --4%
		right_ring="Prolix Ring", --2%
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, --10%
        }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash",
        back="Perimede Cape",
        })
        
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        head="Mallquis chapeau +1",
		hands="Bagua Mitaines +1",
		legs="Mallquis trews +1",
		feet="Mallquis clogs +1",
        })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}, --10%
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}}, --5%
        ear1="Mendi. Earring", --5
        ring1="Lebeche Ring", --(2)
        back="Perimede Cape", --(4)
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})

     
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Jhakri Coronal +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +2",
        legs="Telchine Braconi",
        feet="Jhakri Pigaches +2",
        neck="Fotia Gorget",
        ear1="Moonshade Earring",
        ear2="Telos Earring",
        ring1="Rufescent Ring",
        ring2="Shukuyu Ring",
        back="Relucent Cape",
        waist="Fotia Belt",
        }

    
    ------------------------------------------------------------------------
    ----------------------------- Midcast Sets -----------------------------
    ------------------------------------------------------------------------
    
    -- Base fast recast for spells
    sets.midcast.FastRecast = {
		main={ name="Grioavolr", augments={'"Fast Cast"+3','INT+11','Mag. Acc.+29','"Mag.Atk.Bns."+29','Magic Damage +3',}}, -- 7
		sub="Clerisy Strap", -- 2
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}}, -- 3
		head={ name="Merlinic Hood", augments={'Attack+25','"Fast Cast"+6','INT+5','Mag. Acc.+1',}}, -- 14
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+10','"Fast Cast"+6',}}, -- 12
		hands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}}, -- 
		legs="Geomancy Pants +2", -- 13
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+7','Magic Damage +15','INT+5','Mag. Acc.+12',}}, -- 5
		neck="Deceiver's Torque",
		waist="Witful Belt", -- 3
		left_ear="Enchntr. Earring +1", -- 2
		right_ear="Regal Earring",
		left_ring="Kishar Ring", -- 4
		right_ring="Prolix Ring", -- 2
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, -- 10
        } -- Haste
    
   sets.midcast.Geomancy = {
		main="Solstice",
		sub="Genmei Shield",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +1",
		body={ name="Bagua Tunic", augments={'Enhances "Bolster" effect',}},
		hands="Geo. Mitaines +2",
		legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
		feet="Azimuth Gaiters",
		neck="Bagua Charm +2",
		waist="Witful Belt",
		left_ear="Enchntr. Earring +1",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        }
    
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        hands="Geomancy Mitaines",
        legs="Bagua Pants",
        })

    sets.midcast.Cure = {
		main="Tefnut Wand", --15%
		sub="Sors Shield", --5%
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}, --10%
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}}, --5%
		neck="Inquisitor's Chain",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Mendi. Earring", --5%
		left_ring="Haoma's Ring",
		right_ring="Sirona's Ring",
		back="Swith Cape",
        }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        neck="Nuna Gorget +1",
        ring1="Levia. Ring +1",
        ring2="Levia. Ring +1",
        })

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        main="Gada",
        sub="Genmei Shield",
        head="Vanya Hood",
        body="Vanya Robe",
        hands="Hieros Mittens",
        feet="Vanya Clogs",
        neck="Inquisitor's chain",
        ear1="Beatific Earring",
        ear2="Healing Earring",
        ring2="Ephedra ring",
        })

    sets.midcast['Enhancing Magic'] = {
        main="Gada",
        sub="Ammurapi Shield",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        neck="Inquisitor's chain",
        ear1="Augment. Earring",
        ear2="Andoaa Earring",
        ring1="Stikini Ring",
        ring2="Stikini Ring",
        back="Fi Follet Cape +1",
        waist="Olympus Sash",
        }
        
    sets.midcast.EnhancingDuration = {
        main="Gada",
        sub="Ammurapi Shield",
        head="Telchine Cap",
        body="Telchine Chas.",
        hands="Telchine Gloves",
        legs="Telchine Braconi",
        feet="Telchine Pigaches",
        }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main="Bolelabunga",
        sub="Ammurapi Shield",
        body="Telchine Chas.",
        })
    
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head="Amalric Coif",
        waist="Gishdubar Sash",
        back="Grapevine Cape",
        })
            
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck="Nodens Gorget",
        waist="Siegel Sash",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main="Vadose Rod",
        sub="Ammurapi Shield",
        head="Amalric Coif",
        waist="Emphatikos Rope",
        })

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {
        ring1="Sheltered Ring",
        })
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect


    sets.midcast.MndEnfeebles = {
		main={ name="Grioavolr", augments={'Spell interruption rate down -5%','MND+10','Mag. Acc.+24','"Mag.Atk.Bns."+15','Magic Damage +4',}},
		sub="Enki Strap",
		ammo="Hydrocera",
		head="Geomancy Galero +2",
		body="Geomancy tunic +2",
		hands="Geo. Mitaines +2",
		legs="Geomancy Pants +2",
		feet="Mallquis Clogs +1",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Aredan Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        } -- MND/Magic accuracy
    
    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
		main={ name="Grioavolr", augments={'"Fast Cast"+3','INT+11','Mag. Acc.+29','"Mag.Atk.Bns."+29','Magic Damage +3',}},
		sub="Enki Strap",
		ammo="Pemphredo tathlum",
		head="Geomancy Galero +2",
		body="Geomancy tunic +2",
		hands="Geo. Mitaines +2",
		legs="Geomancy Pants +2",
		feet="Mallquis Clogs +1",
		neck="Erra Pendant",
		waist="Porous rope",
		left_ear="Aredan Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
		})

    sets.midcast['Dark Magic'] = {
		main={ name="Rubicundity", augments={'Mag. Acc.+10','"Mag.Atk.Bns."+10','Dark magic skill +10','"Conserve MP"+7',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Bagua Galero", augments={'Enhances "Primeval Zeal" effect',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +9','MND+7',}},
		hands="Geo. Mitaines +2",
		legs="Geomancy Pants +2",
		feet="Azimuth Gaiters",
		neck="Erra Pendant",
		waist="Salire Belt",
		left_ear="Digni. Earring",
		right_ear="Regal Earring",
		left_ring="Evanescence Ring",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
		}
    
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Bagua Galero",
        feet="Merlinic Crackows",
        ear1="Hirudinea Earring",
        ring2="Archon Ring",
        waist="Fucho-no-obi",
        })
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        feet="Regal Pumps +1"
        })

    -- Elemental Magic sets

    sets.midcast['Elemental Magic'] = {
        main="Grioavolr",
        sub="Niobid strap",
        head={ name="Merlinic hood", augments={'INT +4', 'Mag. Acc. +10', 'Mag. Atk. Bns. +10', 'Magic burst dmg. +2%',}},
		body="Jhakri robe +2",
        hands="Amalric gages +1", --10
        legs="Merlinic shalwar", --10
        feet="Merlinic crackows", --12
        neck="Saevus pendant +1",
        ear1="Friomisi earring", --5
        ear2="Aredan Earring",
        ring1="Mujin band", --3/(-5)
        ring2="Mallquis ring",
        back="Nantosuelta's cape", --6
        waist="Salire belt",
		}

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        main="Grioavolr",
        sub="Niobid strap",
        head={ name="Merlinic hood", augments={'INT +4', 'Mag. Acc. +10', 'Mag. Atk. Bns. +10', 'Magic burst dmg. +2%',}},
		body="Jhakri robe +2",
        hands="Amalric gages +1", --10
        legs="Merlinic shalwar", --10
        feet="Merlinic crackows", --12
        neck="Saevus pendant +1",
        ear1="Friomisi earring", --5
        ear2="Aredan Earring",
        ring1="Mujin band", --3/(-5)
        ring2="Mallquis ring",
        back="Nantosuelta's cape", --6
        waist="Salire belt",
		})

    sets.midcast.GeoElem = set_combine(sets.midcast['Elemental Magic'], {
        main="Grioavolr",
        sub="Niobid strap",
        head={ name="Merlinic hood", augments={'INT +4', 'Mag. Acc. +10', 'Mag. Atk. Bns. +10', 'Magic burst dmg. +2%',}},
		body="Jhakri robe +2",
        hands="Amalric gages +1", --10
        legs="Merlinic shalwar", --10
        feet="Merlinic crackows", --12
        neck="Saevus pendant +1",
        ear1="Friomisi earring", --5
        ear2="Aredan Earring",
        ring1="Mujin band", --3/(-5)
        ring2="Mallquis ring",
        back="Nantosuelta's cape", --6
        waist="Salire belt",
        })

    sets.midcast['Elemental Magic'].Seidr = set_combine(sets.midcast['Elemental Magic'], {
        main="Grioavolr",
        sub="Niobid strap",
        head={ name="Merlinic hood", augments={'INT +4', 'Mag. Acc. +10', 'Mag. Atk. Bns. +10', 'Magic burst dmg. +2%',}},
		body="Jhakri robe +2",
        hands="Amalric gages +1", --10
        legs="Merlinic shalwar", --10
        feet="Merlinic crackows", --12
        neck="Saevus pendant +1",
        ear1="Friomisi earring", --5
        ear2="Aredan Earring",
        ring1="Mujin band", --3/(-5)
        ring2="Mallquis ring",
        back="Nantosuelta's cape", --6
        waist="Salire belt",
        })

    sets.midcast.GeoElem.Seidr = set_combine(sets.midcast['Elemental Magic'].Seidr, {
        main="Grioavolr",
        sub="Niobid strap",
        head={ name="Merlinic hood", augments={'INT +4', 'Mag. Acc. +10', 'Mag. Atk. Bns. +10', 'Magic burst dmg. +2%',}},
		body="Jhakri robe +2",
        hands="Amalric gages +1", --10
        legs="Merlinic shalwar", --10
        feet="Merlinic crackows", --12
        neck="Saevus pendant +1",
        ear1="Friomisi earring", --5
        ear2="Aredan Earring",
        ring1="Mujin band", --3/(-5)
        ring2="Mallquis ring",
        back="Nantosuelta's cape", --6
        waist="Salire belt",
        })

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        main=gear.Grioavolr_MB,
        sub="Niobid Strap",
        head=empty,
        body="Twilight Cloak",
        ring2="Archon Ring",
        })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    ------------------------------------------ Idle Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
		main="Bolelabunga",
		sub="Genmei Shield",
		range="Dunna",
		head="Befouled Crown",
		body="Jhakri Robe +2",
		hands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assiduity Pants",
		feet="Geomancy Sandals +1",
		neck="Bagua Charm +2",
		waist="Salire Belt",
		left_ear="Friomisi Earring",
		right_ear="Aredan Earring",
		left_ring="Renaye Ring",
		right_ring="Stikini Ring +1",
		back="Cheviot Cape",
        }
    
    sets.resting = set_combine(sets.idle, {
        main="Chatoyant Staff",
        waist="Shinjutsu-no-Obi +1",
        })

    sets.idle.DT = set_combine(sets.idle, {
        main="Bolelabunga",
        sub="Genmei shield",
        ranged="Dunna",
        head="Azimuth hood +1",
        body="Jhakri Robe +2",
        hands="Bagua Mitaines",
        legs="Assiduity Pants",
        feet="Bagua sandals +",
        neck="Bagua Charm +2",
        ear1="Genmei Earring",
        ear2="Infused Earring",
        ring1="Paguroidea Ring",
        ring2="Sheltered Ring",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        waist="Austerity Belt +1",
        })

    sets.idle.Weak = sets.idle.DT

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, { 
        -- Pet: -DT (37.5% to cap) / Pet: Regen 
        main="Bolelabunga",
        sub="Genmei shield",
        ranged="Dunna",
        head="Azimuth hood +1",
        body="Jhakri Robe +2",
        hands="Geomancy Mitaines +2",
        legs="Assiduity Pants",
        feet="Bagua sandals +1",
        neck="Bagua Charm +2",
        ear1="Genmei Earring",
        ear2="Infused Earring",
		left_ring="Renaye Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        waist="Austerity Belt +1",
        })

    sets.idle.DT.Pet = set_combine(sets.idle.Pet, {
        main="Bolelabunga",
        sub="Genmei shield",
        ranged="Dunna",
        head="Azimuth hood +1",
        body="Jhakri Robe +2",
        hands="Geomancy Mitaines +2",
        legs="Assiduity Pants",
        feet="Bagua sandals +1",
        neck="Bagua Charm +2",
        ear1="Genmei Earring",
        ear2="Infused Earring",
		left_ring="Renaye Ring",
		right_ring="Stikini Ring +1",
		back={ name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        waist="Austerity Belt +1",
        })

    -- .Indi sets are for when an Indi-spell is active.
--    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants +1"})
--    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants +1"})
--    sets.idle.DT.Indi = set_combine(sets.idle.DT, {legs="Bagua Pants +1"})
--    sets.idle.DT.Pet.Indi = set_combine(sets.idle.DT.Pet, {legs="Bagua Pants +1"})

    sets.idle.Town = set_combine(sets.idle, {
		main="Bolelabunga",
		sub="Genmei Shield",
		range="Dunna",
		head="Befouled Crown",
		body="Jhakri Robe +2",
		hands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}},
		legs="Assiduity Pants",
		feet="Geomancy Sandals +1",
		neck="Bagua Charm +2",
		waist="Salire Belt",
		left_ear="Friomisi Earring",
		right_ear="Aredan Earring",
		left_ring="Renaye Ring",
		right_ring="Stikini Ring +1",
		back="Cheviot Cape",
        })
        
    -- Defense sets

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {
        feet="Geo. Sandals +1"
        }

    sets.latent_refresh = {
        waist="Fucho-no-obi"
        }
    
    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {        
        main="Dowser's wand",
        sub="Sors shield",
        ranged="Dunna",
        head="Azimuth hood +1",
        body="Jhakri Robe +2",
        hands="Bagua Mitaines",
        legs="Mallquis trews +1",
        feet="Bagua sandals +1",
        neck="Bathy Choker +1",
        ear1="Genmei Earring",
        ear2="Infused Earring",
        ring1="Paguroidea Ring",
        ring2="Sheltered Ring",
        back="Moonbeam Cape",
        waist="Austerity Belt +1",
        }


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.magic_burst = {
        body="Merlinic Jubbah", --10
        hands="Ea Cuffs", --5(5)
        feet="Merlinic Crackows", --11
        neck="Mizu. Kubikazari", --10
        ring1="Mujin Band", --(5)
        back="Seshaw Cape", --5
        }

    sets.buff.Doom = {ring1="Eshmun's Ring", ring2="Eshmun's Ring", waist="Gishdubar Sash"}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.CP = {back="Mecisto. Mantle"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then 
        if state.MagicBurst.value then
            equip(sets.magic_burst)
            if spell.english == "Impact" then
                equip(sets.midcast.Impact)
            end
        end
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end
    if spell.skill == 'Enhancing Magic' and classes.NoSkillSpells:contains(spell.english) then
        equip(sets.midcast.EnhancingDuration)
        if spellMap == 'Refresh' then
            equip(sets.midcast.Refresh)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            --send_command('@timers d "'..indi_timer..'"')
            --indi_timer = spell.english
            --send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.skill == 'Elemental Magic' then
 --           state.MagicBurst:reset()
        end
        if spell.english == "Sleep II" then
            send_command('@timers c "Sleep II ['..spell.target.name..']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep ['..spell.target.name..']" 60 down spells/00253.png')
        end 
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end

    if buff == "doom" then
        if gain then           
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
            disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end

end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' then
            if spellMap == 'GeoElem' then
                return 'GeoElem'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.CP.current == 'on' then
        equip(sets.CP)
        disable('back')
    else
        enable('back')
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'nuke' then
        handle_nuking(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 1)
end
