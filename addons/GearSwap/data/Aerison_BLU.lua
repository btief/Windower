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
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
    
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb','Spectral Floe','Subduction',
		'Tenebral Crush','Entomb'
    }

    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
        'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'Refresh', 'Learning')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Learning')

    gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}

    -- Additional local binds
    send_command('bind ^` input /ja "Chain Affinity" <me>')
    send_command('bind !` input /ja "Efflux" <me>')
    send_command('bind @` input /ja "Burst Affinity" <me>')
	send_command('wait 2; input /lockstyleset 13')

    update_combat_form()
    select_default_macro_book()
	
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind @`')
end

-- Set up gear sets.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Mavi Basmak +2"}
    sets.buff['Chain Affinity'] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
    sets.buff.Convergence = {head="Luhlaza Keffiyeh"}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs"}
    sets.buff.Enchainment = {body="Luhlaza Jubbah"}
    sets.buff.Efflux = {legs="Mavi Tayt +2"}

    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Azure Lore'] = {hands="Mirage Bazubands +2"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Uk'uxkaj Cap",
        body="Vanir Cotehardie",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		ammo="Impatiens",
		head="Herculean Helm",
		body="Ayanmo Corazza",
		hands="Ayanmo Manopolas",
		legs="Ayanmo Cosciales",
		feet="Herculean Boots",
		neck="Twilight Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Jhakri Ring",
		back="Swith Cape +1",}
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Mavi Mintan +2"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		ammo="Jukukik Feather",
		head="Adhemar Bonnet +1", 
		body="Adhemar jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'Accuracy+5 Attack+5','Crit. hit damage +5%','Accuracy+14','Attack+10',}},
		feet={ name="Herculean Boots", augments={'Crit. hit damage +5%','STR+2','Accuracy+10','Attack+14',}},
		neck="Breeze Gorget",
		waist="Thunder Belt",
		left_ear="Cessance Earring",
		right_ear="Moonshade Earring",
		left_ring="Epona's Ring",
		right_ring="Begrudging Ring",
		back="Rosmerta's Cape",}
    
    sets.precast.WS.acc = set_combine(sets.precast.WS, {hands="Buremte Gloves"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ring1="Aquasoul Ring",feet="Luhlaza Charuqs"})

    sets.precast.WS['Sanguine Blade'] = {
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Mavi Bazubands +2",ring1="Acumen Ring",ring2="Strendu Ring",
        back="Toro Cape",legs="Hagondes Pants",feet="Iuitl Gaiters +1"}
    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
		ammo="Impatiens",
		head="Herculean Helm",
		body="Ayanmo Corazza",
		hands="Ayanmo Manopolas",
		legs="Ayanmo Cosciales",
		feet="Herculean Boots",
		neck="Twilight Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Jhakri Ring",
		back="Swith Cape +1",}
        
    sets.midcast['Blue Magic'] = {}
    
    -- Physical Spells --
    
    sets.midcast['Blue Magic'].Physical = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalAcc = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalStr = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalDex = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalVit = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalAgi = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalInt = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].PhysicalMnd = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].PhysicalChr = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}

    sets.midcast['Blue Magic'].PhysicalHP = {		
		ammo="Mavi Tathlum",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Herculean Gloves",
		legs="Herculean Trousers",
		feet="Herculean Boots",
		neck="Justice Torque",
		waist="Wanion Belt",
		left_ear="Triumph Earring",
		right_ear="Moonshade Earring",
		left_ring="Rajas Ring",
		right_ring="Strigoi Ring",
		back="Cerberus Mantle +1",}


    -- Magical Spells --
    
    sets.midcast['Blue Magic'].Magical = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].Magical.Resistant = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}
    
    sets.midcast['Blue Magic'].MagicalMnd = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].MagicalChr = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].MagicalVit = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].MagicalDex = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].MagicAccuracy = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    -- Breath Spells --
    
    sets.midcast['Blue Magic'].Breath = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    -- Other Types --
    
    sets.midcast['Blue Magic'].Stun = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}
        
    sets.midcast['Blue Magic']['White Wind'] = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].Healing = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].SkillBasedBuff = {		
		ammo="Ombre Tathlum +1",
		head="Jhakri Coronal",
		body="Jhakri Robe",
		hands="Jhakri Cuffs",
		legs="Jhakri Slops",
		feet="Jhakri Pigaches",
		neck="Stoicheion Medal",
		waist="Aswang Sash",
		left_ear="Hecate's Earring",
		ring_ear="Novio Earring",
		left_ring="Strendu Ring",
		right_ring="Aquilo's Ring",
		back="Toro Cape",}

    sets.midcast['Blue Magic'].Buff = {}
    
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
    

    
    
    -- Sets to return to when not performing an action.

    -- Gear for learning spells: +skill and AF hands.
    sets.Learning = {ammo="Mavi Tathlum",hands="Assimilator's Bazubands +1"}
        --head="Luhlaza Keffiyeh",  
        --body="Assimilator's Jubbah",hands="Assimilator's Bazubands +1",
        --back="Cornflower Cape",legs="Mavi Tayt +2",feet="Luhlaza Charuqs"}


    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Resting sets
    sets.resting = {
        head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",feet="Chelona Boots +1"}
    
    -- Idle sets
    sets.idle = {		
		ammo="Jukukik Feather",
		head="Rawhide Mask", 
		body="Jhakri Robe",
		hands="Serpentes Cuffs",
		legs="Rawhide Trousers",
		feet="Serpentes Sabots",
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Moonshade Earring",
		left_ring="Defending Ring",
		right_ring="Paguroidea Ring",
		back="Moonbeam Cape",}	

    sets.idle.PDT = {		
		ammo="Jukukik Feather",
		head="Rawhide Mask", 
		body="Jhakri Robe",
		hands="Serpentes Cuffs",
		legs="Rawhide Trousers",
		feet="Serpentes Sabots",
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Moonshade Earring",
		left_ring="Defending Ring",
		right_ring="Paguroidea Ring",
		back="Moonbeam Cape",}	

    sets.idle.Town = {		
		ammo="Jukukik Feather",
		head="Rawhide Mask", 
		body="Jhakri Robe",
		hands="Serpentes Cuffs",
		legs="Rawhide Trousers",
		feet="Serpentes Sabots",
		neck="Twilight Torque",
		waist="Flume Belt",
		left_ear="Cessance Earring",
		right_ear="Moonshade Earring",
		left_ring="Defending Ring",
		right_ring="Paguroidea Ring",
		back="Moonbeam Cape",}	

    sets.idle.Learning = set_combine(sets.idle, sets.Learning)

    
    -- Defense sets
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Bloodgem Earring",
        body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bloodgem Earring",
        body="Hagondes Coat",hands="Iuitl Wristbands",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}

    sets.Kiting = {legs="Crimson Cuisses"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {		
		ammo="Ginsen",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'STR +10', 'Attack +15', 'Triple Atk. +3'}},
		feet={ name="Herculean boots", augments={'AGI +2', 'Attack +14', 'Triple Atk. +3'}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Rosmerta's Cape",}

    sets.engaged.Acc = {		
		ammo="Ginsen",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'STR +10', 'Attack +15', 'Triple Atk. +3'}},
		feet={ name="Herculean boots", augments={'AGI +2', 'Attack +14', 'Triple Atk. +3'}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Rosmerta's Cape",}

    sets.engaged.Refresh = {		
		ammo="Ginsen",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'STR +10', 'Attack +15', 'Triple Atk. +3'}},
		feet={ name="Herculean boots", augments={'AGI +2', 'Attack +14', 'Triple Atk. +3'}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Rosmerta's Cape",}

    sets.engaged.DW = {		
		ammo="Ginsen",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'STR +10', 'Attack +15', 'Triple Atk. +3'}},
		feet={ name="Herculean boots", augments={'AGI +2', 'Attack +14', 'Triple Atk. +3'}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Rosmerta's Cape",}

    sets.engaged.DW.Acc = {		
		ammo="Ginsen",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'STR +10', 'Attack +15', 'Triple Atk. +3'}},
		feet={ name="Herculean boots", augments={'AGI +2', 'Attack +14', 'Triple Atk. +3'}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Rosmerta's Cape",}

    sets.engaged.DW.Refresh = {		
		ammo="Ginsen",
		head="Adhemar Bonnet +1", 
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs={ name="Herculean Trousers", augments={'STR +10', 'Attack +15', 'Triple Atk. +3'}},
		feet={ name="Herculean boots", augments={'AGI +2', 'Attack +14', 'Triple Atk. +3'}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Hetairoi Ring",
		back="Rosmerta's Cape",}

    sets.engaged.Learning = set_combine(sets.engaged, sets.Learning)
    sets.engaged.DW.Learning = set_combine(sets.engaged.DW, sets.Learning)


    sets.self_healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Add enhancement gear for Chain Affinity, etc.
    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
        if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
            equip(sets.self_healing)
        end
    end

    -- If in learning mode, keep on gear intended to help with that, regardless of action.
    if state.OffenseMode.value == 'Learning' then
        equip(sets.Learning)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        state.Buff[buff] = gain
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    -- Check for H2H or single-wielding
    if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
        state.CombatForm:reset()
    else
        state.CombatForm:set('DW')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 18)
    else
        set_macro_page(4, 18)
    end
end


