var tempsprite;

body = identity[? "body"]
bodyModel = body[? "model"]

if (moving) {
    animCounter++;
    if (animCounter >= animSpeed) {
        animCounter = 0;
        moveSpriteIndex++;
        if (moveSpriteIndex >= 8) {
            moveSpriteIndex = 0;
        }
    }
}
var headX = pony_get_head_x(x, moveSpriteIndex, moving);
var headY = pony_get_head_y(y, moveSpriteIndex, moving);

draw_pony_back_layer(id, moving);

if (identity[? "tail"] != noone){
    draw_pony_tail(identity[? "tail"], x, y);
}

draw_pony_front_layer(id, moving);

if(bodyModel == "unicorn" || bodyModel == "alicorn") {
    draw_pony_horn(id, headX, headY);
}

if (cutieMark != undefined) {
    tempsprite = asset_get_index("spr_mark_" + cutieMark);
    if(tempsprite > -1) {
        draw_sprite(tempsprite, 0, x, y);
    }
}

draw_pony_eyes(id, headX, headY);

if(bodyModel == "pegasus" || bodyModel == "alicorn") {
    draw_pony_wings(id);
}

if(identity[? "mane"] != noone){
    draw_pony_mane(identity[? "mane"], headX, headY, bodyModel);
}

/*
if(mane != undefined){
    var manesprite = asset_get_index("spr_mane_outline_" + mane);
    draw_sprite_ext(manesprite, 0, x, y, 1, 1, 0, col_mane_outline, 1);
    if(race == 1 || race == 3) {
        manesprite = asset_get_index("spr_mane_fill_unicorn_" + mane);
    }
    else {
        manesprite = asset_get_index("spr_mane_fill_" + mane);
    }
    draw_sprite_ext(manesprite, 0, x, y, 1, 1, 0, col_mane_fill, 1);
    manesprite = asset_get_index("spr_mane_highlight1_" + mane);
    draw_sprite_ext(manesprite, 0, x, y, 1, 1, 0, col_mane_highlight1, 1);
    manesprite = asset_get_index("spr_mane_highlight2_" + mane);
    draw_sprite_ext(manesprite, 0, x, y, 1, 1, 0, col_mane_highlight2, 1);
}
*/
