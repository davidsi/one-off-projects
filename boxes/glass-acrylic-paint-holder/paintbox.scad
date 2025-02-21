include <../libs/openscad-lib/tabbed-box.scad>

NUM_TABS        = 3;
NUM_SHELF_TABS  = 3;
POT_DIAM        = 36;    
POT_RADIUS      = POT_DIAM/2;   
POT_BODY_HEIGHT = 76;
POT_HEIGHT      = 99;
MATERIAL        = 3;
CONTAINER_W     = 7*POT_DIAM;
CONTAINER_H     = POT_HEIGHT;
CONTAINER_D     = 3*POT_DIAM/2 + MATERIAL*2;
SHELF_1_HEIGHT  = POT_BODY_HEIGHT/3;
SHELF_2_HEIGHT  = 2*POT_BODY_HEIGHT/3;

SHOW_SHELF      = 128;
VIEW            = SHOW_SHELF ;

if( VIEW == TABBEDBOX_SHOW_BOTTOM)  {
    drawBase( CONTAINER_W, CONTAINER_D, NUM_TABS, MATERIAL, false, false, true, false  );
}

else if( VIEW == TABBEDBOX_SHOW_BACK ) {

    offsetW = CONTAINER_W/2 - MATERIAL/2 ;
    offsetH = CONTAINER_H/2 - MATERIAL/2 ;

    difference() {

        tabbedContainer( CONTAINER_W, CONTAINER_D, CONTAINER_H, TABBEDBOX_SHOW_BACK, true, NUM_TABS, MATERIAL );

        translate( [0, offsetH/3, 0] )
            drawTabs( CONTAINER_W, MATERIAL, NUM_SHELF_TABS );

        translate( [0, -offsetH/3, 0] )
            drawTabs( CONTAINER_W, MATERIAL, NUM_SHELF_TABS );
    }    
}

else if( VIEW == TABBEDBOX_SHOW_LEFT ) {

    offsetD = CONTAINER_D/2 - MATERIAL/2;
    offsetH = CONTAINER_H/2 - MATERIAL/2;

    difference() {

        drawSideD_LR( CONTAINER_D, CONTAINER_H, NUM_TABS, MATERIAL, true, false, true, false );

        // tabbedContainer( CONTAINER_W, CONTAINER_D, CONTAINER_H, TABBEDBOX_SHOW_LEFT, true, NUM_SHELF_TABS, MATERIAL );

        translate( [0, offsetH/3, 0] )
            drawTabs( CONTAINER_D, MATERIAL, NUM_SHELF_TABS );


        translate( [0, -offsetH/3, 0] )
            drawTabs( CONTAINER_D, MATERIAL, NUM_SHELF_TABS );
    }
}    

// else if( VIEW == TABBEDBOX_SHOW_RIGHT  ) {
//     tabbedContainer( CONTAINER_W, CONTAINER_D, CONTAINER_H, VIEW, true, NUM_TABS, MATERIAL );
// }    

else if( VIEW == SHOW_SHELF ) {
    difference() {
        // tabbedContainer( CONTAINER_W, CONTAINER_D, CONTAINER_H, TABBEDBOX_SHOW_BOTTOM, false, NUM_SHELF_TABS, MATERIAL );
    drawBase( CONTAINER_W, CONTAINER_D, NUM_TABS, MATERIAL, false, false, true, false  );
        union() {
            circle( POT_RADIUS );
            translate( [POT_DIAM+POT_RADIUS/2, 0, 0] ) 
                circle( POT_RADIUS );
            translate( [2*POT_DIAM+POT_RADIUS, 0, 0] ) 
                circle( POT_RADIUS );
            translate( [-POT_DIAM-POT_RADIUS/2, 0, 0] ) 
                circle( POT_RADIUS );
            translate( [-2*POT_DIAM-POT_RADIUS, 0, 0] ) 
                circle( POT_RADIUS );
        }
    }
}
