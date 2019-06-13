#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 

Start
;1. Δίνετε το παρακάτω απόσπασμα κώδικα. Να γράψετε σε λίγες λέξεις τι κάνει το παρακάτω 
πρόγραμμα. Εάν εκτελεί κάποια περιοδική λειτουργία, ποια είναι η περίοδος και η συχνότητά της όταν εκτελείται στην πραγματικότητα.Πως θα μπορούσατε να αλλάξετε τη συχνότητα λειτουργίας; 
BSF PORTA,1 ;To bit 1 του καταχωρητή porta γίνεται 1
BCF PORTA,1 ;Το bit 1 του καταχωρητή porta γίνεται 0
GOTO Start “Πήγαινε στην αρχή start
;Η συγνότητα είναι 1 μs για κάθε εντόλή οπότε λόγω αυτού έχω συχνότητα 10 μs λόγω ότι η εντολή goto πιάνει 8 μs και  οι άλλες 2 απο 1 μs
;Aμα θέλουμε καθυστέριση χρησιμοποιούμε βρόχο καθηστέρισης μονό ή διπλό ανάλογα την επιθιμιτή καθυστέριση.Ξεκινόντας χρησιμοποιούμε  την εντολή delay Clearf Delay1 για να μηδενίσω τον καταχωρητή ,αν δεν γίνει αυτό θα έχω μύνημα λάθους στην οθόνη,έπειτα έχω την εντολή OndelayLoop που προκαλεί επανάληψη και την εντολή  decfsz Delay1,που αφερει  κατα 1 απο την τιμή μέχρι να έχω 0 ,οπότε παραλίπει τελείος 


#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 

;2. Αν αρχικά ο καταχωρητής PORTB = CAH, ποια τιμή θα έχει μετά την εκτέλεση του παρακάτω προγράμματος: 
;O καταχωρητης portb έχει την διαδική τιμή b’11001010’ 
BSF PORTB,5 ;H τιμή του bit 5 του καταχωρητή portb γίνεται 1,άρα  11101010
DECFSZ PORTB,f ; Απο την τιμή του καταχωρητή portb 11101010,αφερείται 1 στο ;δεκαδικό,όπου αντιστιχεί στο 1,άρα αφαιροντας την δυαδικό έχουμε 11101000,επειή δεν ;έχω loop πηγαίνει στην επόμενη εντολή 
BCF PORTB,7 ;Το 7 bit του καταχωρητή portb γίνεται 0 άρα έχω 01101000
;To πρόγραμμα δεν θα τρέξει λόγο έλειψης εντολής end



#include <p16F882.inc> 
 __CONFIG _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & 
_BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & 
_INTRC_OSC_NOCLKOUT 
 __CONFIG _CONFIG2, _WRT_OFF & _BOR21V 

start
; 3. Να γραφεί ένα πρόγραμμα στο MPLAB, το οποίο να αναβοσβήνει ένα led µε µία 
συγκεκριμένη συχνότητα. Να αναφέρετε τη συχνότητα που έχετε πετύχει. 
Clearf porta;μηδενοσμος της porta
;Λούπα καθυστέρισης 
 TIME Clearf Delay1 ;μηδενίζω την delay 
 Clearf Delay2 
OndelayLoop: 
 decfsz Delay1,f ; Waste time. 
 goto OndelayLoop ; The Inner loop takes 3 instructions 
per loop * 256 loopss = 768 instructions 
 decfsz Delay2,f ; The outer loop takes and additional 3 
instructions per lap * 256 loops 
 goto OndelayLoop ; (768+3) * 256 = 197376 instructions / 
1M instructions per second = 0.197 sec. 
 ; call it two-tenths of a second 
                                                 RETURN
;Λoυπα επανάλιψης time
 time2 Clear Delay3;μηδενίζω την delay3 
movlw 10h;μεταφέρω την τιμή 10 στο δεκαεξαδικό στην w
movlw delay3 μεταφέρω την w στην delay
Loop decfsz Delay3,f μειονει την τιμή delay κατα 1 και καλεί την λούπα time
call time;καλεί την time ωστε να έχω επανάλληψη 
goto Loop  :Η λούπα τρέχει 10 φορές και έτσι  έχω χρόνο 2 sec λόγω 10*0,19 μέχρι το μηδενισμό 
return
call time2
bsf porta,0;Εχουμε 1 στο bit 0 επομένως το led ανάβει 
call time2;επαναλαμβάνεται η ρουτίνα για επανάλιψη της καθιστέρισης
end
 

 


