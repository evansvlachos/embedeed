#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 

start
“Να τοποθετήσετε τον αριθμό FFh στον καταχωρητή TRISA, κατόπιν να τοποθετήσετε 
τον αριθμό 3Αh στον καταχωρητή TRISC. Να γράψετε το απόσπασμα κώδικα στο 
MPLAB και να εξηγήσετε ποια bit από κάθε καταχωρητή ορίζονται ως είσοδοι και 
ποια ως έξοδοι.”
MOVLW Ffh “Η τιμη 11111111 είναι η τιμή ff στο δυαδικο και ορίζεται στην w”
MOVWF 85h “H τιμή της w ορίζεται στην trisa”

MOVLW 3Ah “Η τιμη 00111010 είναι η τιμή 3A στο δυαδικο  και ορίζεται στην w”
MOVWF 87h “H τιμή της w μεταφέρεται στην trisa”

end
“H τιμή ένα σημαίνει είσοδος”
“Η τιμή 0 σημαίνει έξοδος”
“Στον καταχωριτή Trisa όλα είναι σαν είσοδοι “
“Στον καταχωριτή Τrisc τα μηδεν είναι έξοδοι και τα ένα είναι είσοδοι”
