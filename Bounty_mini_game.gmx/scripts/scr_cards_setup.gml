///scr_cards_setup()

/*
cards = 96 x 96
rows = 3 (384 x 96
columns = 4 (96 x 288)
padding = 32
total width = (384 + (32 * 5))
total height =  (288 + (32 * 4))
*/

// build array of card colors to assign randomly
var colors = ds_list_create();
ds_list_add(
    colors,
    spr_card_red,
    spr_card_red,
    spr_card_blue,
    spr_card_blue,
    spr_card_yellow,
    spr_card_yellow,
    spr_card_white,
    spr_card_white,
    spr_card_green,
    spr_card_green,
    spr_card_purple,
    spr_card_purple
    );

// loops through all instances of obj_card 
// assign random color from colors
// remove that color when it is assigned
var cards
var randomNum;
var i;
var colorListSize;
for (i = 0; i < instance_number(obj_card); i += 1)
{
   cards[i] = instance_find(obj_card, i);
   colorListSize = ds_list_size(colors);
   randomNum = irandom(colorListSize - 1);
   cards[i].trueColor = colors[| randomNum]; 
   ds_list_delete(colors, randomNum);
}

instance_create(-200, -200, obj_highlighter);






