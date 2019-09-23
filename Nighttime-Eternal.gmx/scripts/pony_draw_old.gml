draw_sprite_ext(spr_body_outline, 0, x, y, 1, 1, 0, col_body_outline, 1);
draw_sprite_ext(spr_body_fill, 0, x, y, 1, 1, 0, col_body_fill, 1);
draw_sprite_ext(spr_farleg_outline, 0, x, y, 1, 1, 0, col_farleg_outline, 1);
draw_sprite_ext(spr_farleg_fill, 0, x, y, 1, 1, 0, col_farleg_fill, 1);
draw_sprite_ext(spr_eye_top, 0, x, y, 1, 1, 0, col_eye_top, 1);
draw_sprite_ext(spr_eye_bottom, 0, x, y, 1, 1, 0, col_eye_bottom, 1);
if(race == 1 || race == 3) {
    draw_sprite_ext(spr_horn_outline, 0, x, y, 1, 1, 0, col_body_outline, 1);
    draw_sprite_ext(spr_horn_fill, 0, x, y, 1, 1, 0, col_body_fill, 1);
}

var tempsprite;

if(mane != undefined){
    for(i = 0; i < array_length_1d(maneColors); i++) {
        tempsprite = -1
        if(race == 1 || race == 3) {
            tempsprite = asset_get_index("spr_mane_" + mane + string(i) + "_unicorn");
        }
        if(tempsprite <= -1) {
            tempsprite = asset_get_index("spr_mane_" + mane + string(i));
        }
        if(tempsprite > -1) {
            draw_sprite_ext(tempsprite, 0, x, y, 1, 1, 0, maneColors[i], 1);
        }
    }
}

if(tail != undefined){
    tempsprite = -1;
    if (tailAndManeShareColors) {
        for(i = 0; i < array_length_1d(maneColors); i++) {
            tempsprite = asset_get_index("spr_tail_" + tail + string(i));
            if(tempsprite > -1) {
                draw_sprite_ext(tempsprite, 0, x, y, 1, 1, 0, maneColors[i], 1);
            }
        }
    }
    else {
        for(i = 0; i < array_length_1d(tailColors); i++) {
            tempsprite = asset_get_index("spr_tail_" + tail + string(i));
            if(tempsprite > -1) {
                draw_sprite_ext(tempsprite, 0, x, y, 1, 1, 0, tailColors[i], 1);
            }
        }
    }
}

if (cutieMark != undefined) {
    tempsprite = asset_get_index("spr_mark_" + cutieMark);
    if(tempsprite > -1) {
        draw_sprite(tempsprite, 0, x, y);
    }
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
