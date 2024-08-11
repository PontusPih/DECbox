// All dimensions in mm unless scaled to inch

// Hard dimensions

inch = 25.4;

hex_board_w = 15.69 * inch;
quad_board_w = 10.45 * inch;
dual_board_w = 5.19 * inch;
single_board_w = 2.44 * inch;
board_h = 8.44 * inch;
half_board_h = 4.94 * inch;
component_clearance = 0.063 * inch; // From edge of board to component area
component_h = 0.375 * inch; // From board surface to top of tallest compoent
solder_leads_clearance = 0.063 * inch;
board_thickness = 0.056 * inch;

// Soft dimensions

box_wall_w = 10;
handle_slot_w = 5;
handle_slot_h = 5;
first_slot_clearance = 10;
slot_width = 3;
slot_clearance = 0.25; // Extra wiggle room on each side of board
board_h_clearance = 2; // From tallest component to next board

// calculated dimensions

slot_depth = component_clearance + slot_clearance;
box_inner_w = hex_board_w + 2*component_clearance - 2*slot_depth;
box_inner_d = quad_board_w + 2*component_clearance - 2*slot_depth;
quad_slot_w = box_inner_d + 2*slot_depth;
hex_slot_w = box_inner_w + 2*slot_depth;
box_wall_h = board_h;
board_unit = solder_leads_clearance + board_thickness + component_h + board_h_clearance;
number_of_hex_slots = floor((box_inner_d - first_slot_clearance - board_unit) / board_unit);
number_of_quad_slots = floor((box_inner_w - first_slot_clearance - board_unit) / board_unit);

// Functional layout

// Short sides
difference() {
    union() {
        translate([-box_wall_w, 0, 0])
            cube([box_wall_w,box_inner_d,box_wall_h]);
        translate([box_inner_w, 0, 0])
            cube([box_wall_w,box_inner_d, box_wall_h]);
    }
    hex_slots();
}
    

// Long sides
difference() {
    union() {
        translate([0, box_inner_d, 0])
            cube([box_inner_w, box_wall_w, box_wall_h]);
        translate([0, -box_wall_w, 0])
            cube([box_inner_w, box_wall_w, box_wall_h]);
    }
    quad_slots();
}


module quad_slots() {
    translate([first_slot_clearance, -slot_depth, -1]) {
        for(i = [0: number_of_quad_slots]) {
            translate([i * board_unit, 0, 0])
                cube([slot_width, quad_slot_w, box_wall_h + 2]);
        }
    }
}

module hex_slots() {
    translate([-slot_depth, first_slot_clearance, -1]) {
        for(i = [0: number_of_hex_slots]) {
            translate([0, i * board_unit, 0] )
                cube([hex_slot_w, slot_width, box_wall_h + 2]);
        }
    }
}