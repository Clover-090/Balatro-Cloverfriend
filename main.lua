SMODS.Atlas {
    key = "Clovermod",
    -- The name of the file, for the code to pull the atlas from
    path = "Clovermod.png",
    -- Width of each sprite in 1x size
    px = 71,
    -- Height of each sprite in 1x size
    py = 95
}

SMODS.Joker {
    key = 'lodog',
    loc_txt = {
        name = 'Unfortunatly Placed Dog',
        text = {
          "Gains {X:mult,C:white}X0.1 Mult",
          "for each scoring face card",
          "if hand is a {C:attention}Two Pair{}",
          "{C:inactive}(Currently {X:mult,C:white}X#0.1# {C:inactive} Mult)",
          "{C:inactive} Get them some Spare Trousers!"
        }
      },
    config = { extra = { Xmult = 0.1, Xmult_gain = 0.1}},
    rarity = 3,
    atlas = 'Clovermod',
    pos = { x = 0, y = 0 }, --TODO: add correct cords after sprites finished
    cost = 8,
    unlocked = false,
    unlock_condition = {type = 'win_deck', deck = 'b_plasma'},

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
          return {
            mult_mod = card.ability.extra.Xmult,
            message = localize { type = 'variable', key = 'a_Xmult', vars = { card.ability.extra.Xmult } }
          }
        end 
    
        
        if context.before and next(context.poker_hands['Two Pair']) and not context.blueprint then
            if context.individual and context.cardarea == G.play then
                if context.othercard:is_face() then
                        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                            return {
                                message = 'Upgraded!',
                                colour = G.C.XMult,
                                card = card
                            }
                            end
                        
                    end
                end
            end

} --TODO: This shit dont fucking work, score doesn't scale, figure out why.

--[[ SMODS.Challenge {
    key = 'testchallenge',
    loc_txt = {
        name = 'Joker testing deck',
    }
    jokers = {
        {id = 'lodog'},
        {id = 'j_blueprint'},
    }
} TODO: Figure out why my modded joker breaks SMODS.Challenge]]--