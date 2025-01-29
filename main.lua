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
          "{C:inactive}(Currently {C:mult}+#1# {C:inactive} Mult",
          "{C:inactive} Get them some Spare Trousers!"
        },
        unlock = {
            'Win any stake on', '{C:attention}Plasma Deck{}'
        }
      },

    config = { extra = { mult = 1, mult_gain = 10}},
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    atlas = 'PlaceHolder', --Add Correct Atlas once sprite is finished
    pos = { x = 0, y = 0 }, 
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
                                card = card
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
        },
        unlock = {
        'Win any stake on', '{C:attention}Checkered Deck{}'
        }
      },
    config = {extra = {}},
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = 'hypothetical',
    pos = { x = 0, y = 0 }, 
    cost = 3,
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




SMODS.Joker {

    key = 'addictive',
    loc_txt = {
        name = 'Addictive Joker',
        text = {
          "gains {X:mult,C:white}X0.1{} Mult for each {C:attention}Straight{} played.",
          "{C:inactive}Currently {X:mult,C:white}X#1# {C:inactive} Mult" 
        },
        unlock = {
        "Win any stake on", "{C:attention}Plasma Deck{}"
        }
      },

    config = {extra = {Xmult = 1, Xmult_gain = 0.1}},
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    atlas = 'PlaceHolder',
    pos = {x = 0, y = 0},
    cost = 5,
    unlocked = false,
    unlock_condition = {type = 'win_deck', deck = 'b_plasma'},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
        return {
            Xmult_mod = card.ability.extra.Xmult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.Xmult } }
        }
        end 

        if context.before and next(context.poker_hands['Straight']) and not context.blueprint then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain --scales XMult
                                return {
                                    message = 'Upgraded!',
                                    colour = G.C.Xmult,
                                    card = card
                                    }
                                end
                            end
                        




}


--TODO, find out why custom jokers break Center when trying to make custom challenges(whatever that is?)