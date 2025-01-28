SMODS.Atlas {
    key = "PlaceHolder",
    path = "PlaceHolder.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "hypothetical",
    path = "hypothetical.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'lodog',
    loc_txt = {
        name = 'Unfortunatly Placed Dog',
        text = {
          "Gains {C:mult}+10 Mult",
          "For each face card within",
          "a {C:attention}Two Pair{}",
          "{C:inactive}(Currently {C:mult}+#1# {C:inactive} Mult)",
          "{C:inactive} Get them some Spare Trousers!"
        }
      },
    config = { extra = { mult = 1, mult_gain = 10}},
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    atlas = 'PlaceHolder',
    pos = { x = 0, y = 0 }, --TODO: add correct cords after sprites are finished
    cost = 8,
    unlocked = false,
    unlock_condition = {type = 'win_deck', deck = 'b_plasma'},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
          return {
            mult_mod = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
          }
        end 
    
        
        if context.scoring_name == "Two Pair" and not context.blueprint then --checks to see what hand is being scored and makes sure blueprint or brainstorm wont copy upgrade
            if context.individual and context.cardarea == G.play then
                if context.other_card:is_face() then --checks to see if there are face cards
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain --scales mult
                            return {
                                message = 'Upgraded!',
                                colour = G.C.Mult,
                                
                            }
                            end
                        
                    end
                end
            end

} 

SMODS.Joker {
    key = 'Hypothetical',
    loc_txt = {
        name = 'Hypothetical Joker',
        text = {
          "After each {C:attention}Boss Blind{}",
          "spawn a {C:attention}negitive hanged man card" --This will change once I'm more knowlegeable of LUA
          
        }
      },
    config = {extra = {}},
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'hypothetical',
    pos = { x = 0, y = 0 }, --TODO: add correct cords after sprites are finished
    cost = 10,
    unlocked = false,
    unlock_condition = {type = 'win_deck', deck = 'b_checkered'},



    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and (not context.individual) and (not context.repetition) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = create_card('Tarot', G.consumeables, nil, 0, 0, 0, 'c_hanged_man')
                    card:set_edition({negative = true}, true, true)
                    card:add_to_deck()
                    G.consumeables:emplace(card)
					    return true
				    end
          
        
}))
end
end
}



--[[ SMODS.Challenge {
    key = 'testchallenge',
    loc_txt = {
        name = 'Joker testing deck',
    }
    jokers = {
        {id = 'lodog'},
        {id = 'j_blueprint'},
    }
} ]]--
 --TODO, find out why custom jokers break Center(whatever that is?)