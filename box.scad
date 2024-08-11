// All dimensions in mm unless specified

// Hard dimensions

hex_board_w = 6;
quad_board_w = 4;
dual_board_w = 2;
single_board_w = 1;
board_h = 4;
half_board_h = 2;
component_clearance = 0.01; // From edge of board to component area
component_h = 0.5; // From board surface to top of tallest compoent
board_thickness = 2;

// Soft dimensions

box_wall_w = 10;
handle_slot_w = 5;
handle_slot_h = 5;
first_slot_clearance = 10;
slot_width = 3;
board_h_clearance = 0.5; // From tallest component to next board

// calculated dimensions

slot_depth = component_clearance + 0.005;
box_inner_l = hex_board_w + 2*component_clearance - 2*slot_depth;
box_inner_w = quad_board_w + 2*component_clearance - 2*slot_depth;
board_unit = board_thickness + component_h + board_h_clearance;
number_of_hex_slots = floor(box_inner_w / board_unit);