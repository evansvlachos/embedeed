#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 
;1. Διαμορφώστε το ίδιο πρόγραμμα που κάνατε στο εργαστήριο αλλά αυτή τη φορά 
χρησιμοποιήστε την εντολή RLF. Κάντε όποιες αλλαγές είναι απαραίτητες. 
Start
bsf status,pro ; μηδενισμος της status
clrf trisc ; καθαρισμος c
bcf status,rpo; το bit 0  γίνεται του status 
movlw 0x80;O wreg παίρνει την τιμή 10000000 
movwf display,w;Ο display παίρνει την τιμή 10000000 
MAINLOOP
movwf portc; Ο καταχωριτής port c παίρνει την τιμή 10000000 
ondelay loop; λούπα καθυστέρισης 
decfsz delay1 ,F;μείοση της τιμής κατα 1
goto ondelayloop
decFsz delay2,f
goto ondelayloop;καθυστέριση 0,19
Bcf status ,c μηδενίζει τον carry  για να είμαστε σίγουροι 
rlf display,f ;περιστρεφει τον display προς τα αριστερά 00000001
btfsc dispAY,3 ;ελεγχεται το bit του display άμα είναι 0 και παμε στην μεθεπόμενη εντολή
GOTO MOVE IT ; πηγαινε στο move it
GOTO MAIN LOOP;πηγαινε στη mainloop
MOVEIT;Oταν ο display είναι 00001000
BCF DISPLAY,3;Το bit 3 του display γίνεται  0 άρα 00000000
BSF DISOLAY,7; Τo 7 bit γίνεται 1άρα έχουμε 10000000
GOTO MAINLOOP;πήγαινε στη mainloop
END
;O κώδικας δεν αλλάζει γιατί είτε έχω περιστροφή δεξια  έιτε αριστερά έχω μηδενισμό του τρίτου bit  και ορισμό του 

#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 
Start: 
;2. Στο παρακάτω πρόγραμμα που δίνεται βάλτε σχόλια μετά από κάθε εντολή. Μετά 
την εκτέλεση του προγράμματος τι τιμή θα έχει ο WREG, o TempRegister, o Display 
και το Carry bit. 
bcf Carry ; Καθαρισμός τουcarry bit. Το carry bit πέρνει την τιμή 0. 
movlw b'10101111' ; μεταφέρεται η τιμή 10101111 στον W 
movwf TempRegister ; η τιμή του tempRegister λόγο αντιγραφής του w είναι 10101111
rrf TempRegister,f ; ο tempregister είναι 11010111
MOVF TempRegister,w ;μεταφέρει το περιεχόμενο του  TempRegister στο w 11010111
MOVWF Display ;μεταφερει το περιεχόμενο W στο display 11010111
rrf Display,f ;περιστροφή του display δεξια 11101011
MOVF Display,w ; μεταφερει το περιεχόμενο του  display 11101011 
rrf Display,f ;περιστρέφει δεξιά το περιεχόμενο του display ‘11110101
;tempregister 11010111
;11101011 w
;display=11110101
; carry BIT=0



 

