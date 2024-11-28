draw_self();

draw_text( x, y, string(hp) );

//Check the size of the damage list
draw_text( x, y - 32, string(ds_list_size(damageList) ) );