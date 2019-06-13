#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 

start
“1. Να γραφτεί πρόγραμμα το οποίο να ανάβει και να σβήνει ένα led στην θύρα C στο bit 0 και 
κατόπιν να ανάβει και να σβήνει ένα δεύτερο led στο bit 2 της ίδιας θύρας. ”
movlw 00h
movw porta
bsf 07h,0”Το bit 0 γίνεται 1 με αποτέλεσμα το led να ανάβει”
Bcf 07h,0”Το bit 0 γίνεται 0 με αποτέλεσμα το led να σβήνει”
bsf 07h,2”Το bit 2 γίνεται 1 με αποτέλεσμα το led να ανάβει”
Bcf 07h,2”Το bit 2 γίνεται 0 με αποτέλεσμα το  led να σβήνει”
end
