
1. Συνδυάστε την προηγούμενη άσκηση του Rotate με τη σημερινή άσκηση και γράψτε πρόγραμμα το οποίο να μπορεί να αλλάζει την ταχύτητα περιστροφής τωνLED μέσο του trimmer Rv1. Παρακάτω δίνονται ένα κομμάτι προγράμματος κορμού και ένα λογικό διάγραμμα ροής που θα σας βοηθήσει για την σύνταξη του προγράμματος.



VARIABLE SPEED ROTATE EXAMPLE
include <p16F882.inc> 
cblock 0x20 
Delay1                     ;δηλωση της διεύθυνσης addres
Delay2 
Display                 ;δηλοση της μεταβλητης που περιμμένει για display
Endc
org 0 

START: 

BSF STATUS, RP0             ; Μετάβαση σε Bank 1 
CLRF TRISC                 ; Κάνε όλη την PORT C έξοδο wb
MOVLW 0xFF 
movwf TRISA             ; μετέφερε την μεταβλητή wreg στον porta 
movlw b'00001111' 
movwf TRISC             ;μεταφέρουμε την wreg στον trisa
movlw 0x00                 ; Left Justified, Vdd-Vss referenced 
movwf ADCON1 
bsf STATUS,RP1             ; επιλέγω τον καταχωρητη STATUS στην Bank 3 
movlw 0x07                 ; Θελουμε τα pins στην porta αναλογικά  
movwf ANSEL 
BCF STATUS, RP0             ; Μετάβαση σε Bank 0 
bcf STATUS,RP1 
movlw 0x80                 ; Μετέφερε στον καταχωρητή W τον αριθμό 80h, ο 
                     ; οποίος στο δυαδικό είναι ο 1000 0000 
movwf ADCON0             ; ρύθμιση for Fosc/8, Channel 2 (RA2), 
; ανοίγει το αναλογικό σε ψηφιακό 
MOVWF Display             ; Μετέφερε στον καταχωρητή Display το περιεχόμενο του                         ;wreg 

MainLoop: 
NOP                     ; περιμμενουμε 5 λεπτα να φορτίσει ο ηλεκτρικος πυκνωτής
nop                     ; wait 1uS 
nop                     ; wait 1uS 
nop                     ; wait 1uS 
nop                     ; wait 1uS 
bsf ADCON0,GO_DONE         ; ξεκίνηημμα μετατροπής ορισμος b‘00000010’
btfsc ADCON0,GO_DONE         ;το bit 2 ελέγχεται άμα το δεύτερο bit είναι 0
goto $-1                 ;πηγαινε πησω μια θεση
movf ADRESH,w             ; μεταφέρω το περιεχόμμενο του adresh στον wreg
movwf PORTC             ;μεταφέρω τον wreg στην portc
ADDLW 1
MOVWF Delay2

A2DDelayLoop:
DECFSZ Delay1, f             ; μείοσε την τιμή του καταχωρητη κατα 1 και μηγαινε στη 
                             ;μεθεπόμμενη otνα μηδενιστεί
GOTO A2DDelayLoop
DECFSZ Delay2, f
GOTO A2DDelayLoop

BCF ADCON0, GO_DONE         ; Καθαρισμός του carry bit. Το carry bit πέρνει την τιμή 0. 
RRF Display, f             ; Περιστροφή του καταχωρητή Display δεξιά κατά μια θέση 
BTFSC ADCON0, GO_DONE    ; Επέστρεψε το bit ‘1’ στο 2 bit? Για όσο θα είναι μηδέν θα 
                     ; πηδάει την επόμενη εντολή. 
BSF Display,7             ; Αφού το Carry είναι 1, γιατί τότε μονο εκτελείται αυτή η 
         ; εντολή, θέτουμε 1 το 7 bit του καταχωρητή Display 
GOTO MainLoop 

END

2wreg b11111111 trisa 
WREG 00001111 TRISC


