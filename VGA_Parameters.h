
// Horizontal Parameter ( Pixel )
parameter H_SYNC_CYC   = 128;  //128 pixels time zero sync pulse
parameter H_SYNC_BACK  = 16;   //16 pixels back porch
parameter H_SYNC_DON   = 640; // 640 pixels of content
parameter H_SYNC_FRONT = 16;   // Transferred to back porch to
                              // center screen
parameter H_SYNC_MAX   = 799; // 800 effective pixels (cycles)

// Virtical Parameter ( Line )
parameter V_SYNC_CYC   = 2;   //2 pixel time zero sync pulse
parameter V_SYNC_BACK  =  29; //29 pixels back porch
parameter V_SYNC_DON  = 480; // 480 lines of content
parameter V_SYNC_FRONT = 10;  // Transferred to back porch to
                              // center screen
parameter V_SYNC_MAX   = 524; // 525 effective lines

// Start Offset
parameter X_START      = H_SYNC_CYC + H_SYNC_BACK;
parameter Y_START      = V_SYNC_CYC + V_SYNC_BACK;
