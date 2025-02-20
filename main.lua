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

SMODS.Atlas {
    key = "BIGBILL",
    path = "BIGBILL.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Addictive",
    path = "Addictive.png",
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

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('Loker', G.C.WHITE, G.C.RED, 1.2 )
    end,

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

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('Moker', G.C.RED, G.C.WHITE, 1.2 )
    end,


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
          "{C:inactive}Currently {X:mult,C:white}X#1# {C:inactive} Mult",
          "{C:inactive}Played more than 9 hours straight"
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
    atlas = 'Addictive',
    pos = {x = 0, y = 0},
    cost = 5,
    unlocked = false,
    unlock_condition = {type = 'win_deck', deck = 'b_plasma'},

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge('Loker', G.C.WHITE, G.C.RED, 1.2 )
    end,

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


SMODS.Joker {

    key='FUCKYOUBALTIMORE',
    loc_txt = {
              name = "FUCK YOU BALTIMORE",
              text = {"If youre dumb enough to buy a new car this weekend, youre a big enough schmuck to come to Big Bill Hells Cars!", 'Bad deals! Cars that break down! Thieves!', 'If you think youre going to find a bargain at Big Bills, you can kiss my ass!', 'Its our belief that youre such a stupid motherfucker, youll fall for this bullshit—guaranteed!', 'If you find a better deal, shove it up your ugly ass!', 'You heard us right!', 'Shove it up your ugly ass!', 'Bring your trade! Bring your title! Bring your wife!', 'Well fuck her!', 'Thats right! We will fuck your wife!', 'Because at Big Bill Hells, youre fucked six ways from Sunday!', 'Take a hike to Big Bill Hells—Home of Challenge Pissing!', 'Thats right! Challenge Pissing!', 'How does it work?', 'If you can piss six feet in the air straight up and not get wet, you get no down payment!', 'Dont wait! Dont delay! Dont fuck with us, or well rip your nuts off!', 'Only at Big Bill Hells, the only dealer that tells you to fuck off!', 'Hurry up, asshole!', 'This event ends the minute after you write us a cheque, and it better not bounce or youre a dead motherfucker!', 'Go to hell—Big Bill Hells Cars!', "Baltimores filthiest and exclusive home of the meanest sons-of-bitches in the state of Maryland! guaranteed!"}
            },
    config = {extra = {}},
        rarity = 1,
        blueprint_compat = false,
        eternal_compat = true,
        perishable_compat = false,
        atlas = 'BIGBILL',
        pos = {x = 0, y = 0},
        cost = 0,
        allow_duplicates = true,
        
        
        set_card_type_badge = function(self, card, badges)
            badges[#badges+1] = create_badge('USELESS', G.C.RED, G.C.BLACK, 1.2 )
        end,
        loc_vars = function(self, info_queue, card)
            card = card
            info_queue[#info_queue + 1] = card:set_eternal(true)
            
        end,
}


--TODO, find out why custom jokers break Center when trying to make custom challenges(whatever that is?)