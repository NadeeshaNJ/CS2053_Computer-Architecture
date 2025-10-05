#include "ripes_system.h"
unsigned* led_base = LED_MATRIX_0_BASE;
unsigned* switch_base = SWITCHES_0_BASE;
void main() {
    unsigned state = 0;
    unsigned count = 1;
    
    while (1) {
        if (*switch_base & 0x1) {
            if (count % 10 == 0){ //State Change
                if (state == 2){
                    state = 0;
                }
                else{
                    state++;
                }
            }
            
            if (state == 0){ //Go State
                //unsigned idx = 2;
                *(led_base + 0) = 0x000000;
                *(led_base + 1) = 0x000000;
                *(led_base + 2) = 0x00FF00;
                
            }
            else if (state == 1){ //Get Ready State
                *(led_base + 0) = 0x000000;
                *(led_base + 1) = 0xFFFF00;
                *(led_base + 2) = 0x000000;
            }
            else{ //Stop State
                *(led_base + 0) = 0xFF0000;
                *(led_base + 1) = 0x000000;
                *(led_base + 2) = 0x000000;
            }
        count++; //Increment Count
        } else { //Switch 0 is not toggled
         
            *(led_base + 0) = 0x000000;
            *(led_base + 1) = 0x000000;
            *(led_base + 2) = 0x000000;
        }
    }
}