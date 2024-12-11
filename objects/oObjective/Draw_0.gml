

// Only draw the text if the timer is still running
if display_timer > 0 {
    // Set text color, alignment, and font
	depth = -10000;
    draw_set_color(c_white);
    draw_set_font(fnt8bitSmall); 
    draw_set_halign(fa_center); // Align text to center horizontally

    // Draw the objective text at the top of the screen
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);
	var view_width = camera_get_view_width(view_camera[0]);
	
	draw_text(view_x + view_width / 2, view_y + 30, "Objective: Survive for 1 minute and 30 seconds and kill 60 enemy combatants");
	draw_text(view_x + view_width / 2, view_y + 50, "to extract safely outside the base!");
}