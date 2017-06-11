///scr_check_mouse_input()

//if left mouse button released
if (mouse_check_button_released(mb_left))
{
    var cardClicked = instance_position(mouse_x, mouse_y, obj_card)
    //if the mouse is over a card
    if (cardClicked)
    {
        //check if the card has already been matched, if so exit;
        if (!cardClicked.active)
        {
            exit;
        }
        with (obj_game_manager)
        {
            //check if previouse card Choice exists
            if (previousChoice)
            {
                //if same card was clicked again, exit
                if (cardClicked == previousChoice)
                {
                    exit;
                }
                
                //move the card highlighter to the card clicked
                with (obj_highlighter)
                {
                    x = cardClicked.x - 6;
                    y = cardClicked.y - 6;
                }
    
                //reveal the card clicked's true color
                cardClicked.sprite_index = cardClicked.trueColor;
                
                //check for a color match
                //if there is a match, set cards to inactive and give them the checkmark sprite
                if (cardClicked.trueColor == previousChoice.trueColor)
                {
                    cardClicked.active = false;
                    previousChoice.active = false;
                    cardClicked.sprite_index = spr_card_matched;
                    previousChoice.sprite_index = spr_card_matched;
                    matches += 2;
                }
                //if no match turn cards back over
                else
                {
                    previousChoice.sprite_index = spr_card_back;
                    cardClicked.sprite_index = spr_card_back;
                }
                
                //reset previously chosen card to none
                previousChoice = noone;
                
                //hide the card border highlighter
                with (obj_highlighter)
                {
                    x = -200;
                    y = -200;
                }
                
                //if all cards have been matched
                if (matches == totalCards)
                {
                    show_message('WINNNNNNNNNNNNNN');
                }
            }
            else
            {
                //move the card highlighter to the card clicked
                with (obj_highlighter)
                {
                    x = cardClicked.x - 6;
                    y = cardClicked.y - 6;
                }
    
                //reveal the card clicked's true color
                cardClicked.sprite_index = cardClicked.trueColor;
                previousChoice = cardClicked;
 
            }
        }
    }
}
