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
          "Gains {C:mult}+10 Mult",
          "if played hand",
          "is a {C:attention}Two Pair{}",
          "and has a non-scoring card.",
          "{C:inactive}(Currently {C:mult}+#1# {C:inactive} Mult)",
          "{C:inactive} Get them some Spare Trousers!"
        }
      },
    config = { extra = { mult = 1, mult_gain = 10}},
    rarity = 3,
    atlas = 'Clovermod',
    pos = { x = 0, y = 0 }, --TODO: add correct cords after sprites finished
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
    
        
        if context.before and next(context.poker_hands['Two Pair']) and not context.blueprint then
            if context.individual and context.cardarea == G.play then
                if not context.scoring_hand and context.othercard:is_face() or context.othercard:is_number() then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                            return {
                                message = 'Upgraded!',
                                colour = G.C.Mult,
                                card = card
                            }
                            end
                        
                    end
                end
            end

} --TODO: This shit dont fucking work, score doesn't scale, figure out why.

SMODS.Challenge {
    key = 'testchallenge',
    loc_txt = {
        name = 'Joker testing deck',
    }
    jokers = {
        {id = 'lodog'},
        {id = 'j_blueprint'},
    }
}