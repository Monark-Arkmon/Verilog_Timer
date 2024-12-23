ORG &0000

; Initialize display locations and traffic lights to No pattern when starting the board for first time
LDA No_PATTERN
STA &FFA
STA &FF9
STA &FF8
STA &FF7
STA &FF6
STA &FF5
STA &FFF



; Wait for input from any SW
check_button
    LDA &FF1
    JNE start_lights
    JMP check_button



; Load the pattern for H, E, L, L, O into the display
start_lights

    LDA H_PATTERN
    STA &FF9

    LDA E_PATTERN
    STA &FF8

    LDA L_PATTERN
    STA &FF7

    LDA L_PATTERN
    STA &FF6

    LDA O_PATTERN
    STA &FF5

    LDA all_lights
    STA &FFF

:Set a 1 sec delay using a nested delay 
    LDA delay_i
        loopi
        SUB one
        JGE loopj
        JMP close_hello
        loopj
            STA loop_i_acc_store
            LDA delay_j
        
            loopj_inner
                SUB one
                JNE loopj_inner

        LDA loop_i_acc_store
        JMP loopi


; remove hello on display and the traffic lights
close_hello

    LDA No_PATTERN
    STA &FFA
    STA &FF9
    STA &FF8
    STA &FF7
    STA &FF6
    STA &FF5
    STA &FFF        ; For traffic lights



; Input first digit
input_digit_1

    input_1
        LDA &FF2
        SUB K0_PATTERN          ; checks if digit entered digit is 0 
        JNE input_2             ; if not goes to check the next number
        LDA M_ZERO_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute zero pattern and diplays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_2
        LDA &FF2
        SUB K1_PATTERN          ; checks if digit entered is 1
        JNE input_3             ; if not goes to check the next number
        LDA M_ONE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute one pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_3
        LDA &FF2
        SUB K2_PATTERN          ; checks if digit entered is 2
        JNE input_4             ; if not goes to check the next number
        LDA M_TWO_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute two pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_4
        LDA &FF2
        SUB K3_PATTERN          ; checks if digit entered is 3
        JNE input_5             ; if not goes to check the next number
        LDA M_THREE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute three pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_5
        LDA &FF2
        SUB K4_PATTERN          ; checks if digit entered is 4
        JNE input_6             ; if not goes to check the next number
        LDA M_FOUR_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute four pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_6
        LDA &FF2
        SUB K5_PATTERN          ; checks if digit entered is 5
        JNE input_7             ; if not goes to check the next number
        LDA M_FIVE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute five pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_7
        LDA &FF2
        SUB K6_PATTERN          ; checks if digit entered is 6
        JNE input_8             ; if not goes to check the next number
        LDA M_SIX_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute six pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_8
        LDA &FF2
        SUB K7_PATTERN          ; checks if digit entered is 7
        JNE input_9             ; if not goes to check the next number
        LDA M_SEVEN_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute seven pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_9
        LDA &FF2
        SUB K8_PATTERN          ; checks if digit entered is 8
        JNE input_10            ; if not goes to check the next number
        LDA M_EIGHT_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute eight pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit

    input_10
        LDA &FF2
        SUB K9_PATTERN          ; checks if digit entered is 9
        JNE input_1             ; if not then restart this loop
        LDA M_NINE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the minute nine pattern and displays at rightmost pos.
        JMP input_digit_2       ; goes to next loop for entering tens place second digit



; Process second digit
input_digit_2

    LDA delay_1         ; added 6 sequential delays so that the button presses get registered properly properly
    delay_number_loop_1_1
    SUB one
    JNE delay_number_loop_1_1

    LDA delay_1
    delay_number_loop_1_2
    SUB one
    JNE delay_number_loop_1_2

    LDA delay_1
    delay_number_loop_1_3
    SUB one
    JNE delay_number_loop_1_3

    LDA delay_1
    delay_number_loop_1_4
    SUB one
    JNE delay_number_loop_1_4

    LDA delay_1
    delay_number_loop_1_5
    SUB one
    JNE delay_number_loop_1_5

    LDA delay_1
    delay_number_loop_1_6
    SUB one
    JNE delay_number_loop_1_6

    LDA No_PATTERN
    STA &FF2                ; resets keypad just to be safe

    input_11
        LDA &FF2
        SUB K0_PATTERN      ; check if digit entered is 0
        JNE input_12        ; if not goes to check next number
        LDA &FF5
        STA &FF6            ; pushes minute digit to the left by one place
        LDA ZERO_PATTERN
        STA &FF5  ; Store second digit in &FF5 (for display)    ; loads the second zero pattern and displays at rightmost pos.
        JMP input_digit_3   ; goes to next loop for entering ones place second digit

    input_12
        LDA &FF2
        SUB K1_PATTERN      ; check if digit entered is 1
        JNE input_13        ; if not goes to check next number
        LDA &FF5
        STA &FF6            ; pushes minute digit to the left by one place
        LDA ONE_PATTERN
        STA &FF5  ; Store second digit in &FF5 (for display)    ; loads the second one pattern and displays at rightmost pos.
        JMP input_digit_3   ; goes to next loop for entering ones place second digit

    input_13
        LDA &FF2
        SUB K2_PATTERN      ; check if digit entered is 2
        JNE input_14        ; if not goes to check next number
        LDA &FF5
        STA &FF6            ; pushes minute digit to the left by one place
        LDA TWO_PATTERN
        STA &FF5  ; Store second digit in &FF5 (for display)    ; loads the second two pattern and displays at rightmost pos.
        JMP input_digit_3   ; goes to next loop for entering ones place second digit

    input_14
        LDA &FF2
        SUB K3_PATTERN      ; check if digit entered is 3
        JNE input_15        ; if not goes to check next number
        LDA &FF5
        STA &FF6            ; pushes minute digit to the left by one place
        LDA THREE_PATTERN
        STA &FF5  ; Store second digit in &FF5 (for display)    ; loads the second three pattern and displays at rightmost pos.
        JMP input_digit_3   ; goes to next loop for entering ones place second digit

    input_15
        LDA &FF2
        SUB K4_PATTERN      ; check if digit entered is 4
        JNE input_16        ; if not goes to check next number
        LDA &FF5
        STA &FF6            ; pushes minute digit to the left by one place
        LDA FOUR_PATTERN
        STA &FF5  ; Store second digit in &FF5 (for display)    ; loads the second four pattern and displays at rightmost pos.
        JMP input_digit_3   ; goes to next loop for entering ones place second digit

    input_16
        LDA &FF2
        SUB K5_PATTERN      ; check if digit entered is 5
        JNE input_11        ; if not goes to check next number
        LDA &FF5
        STA &FF6            ; pushes minute digit to the left by one place
        LDA FIVE_PATTERN
        STA &FF5  ; Store second digit in &FF5 (for display)    ; loads the second five pattern and displays at rightmost pos.
        JMP input_digit_3   ; goes to next loop for entering ones place second digit



; Process third digit
input_digit_3

    LDA delay_1         ; added 6 sequential delays so that the button presses get registered properly properly
    delay_number_loop_2_1
    SUB one
    JNE delay_number_loop_2_1

    LDA delay_1
    delay_number_loop_2_2
    SUB one
    JNE delay_number_loop_2_2

    LDA delay_1
    delay_number_loop_2_3
    SUB one
    JNE delay_number_loop_2_3

    LDA delay_1
    delay_number_loop_2_4
    SUB one
    JNE delay_number_loop_2_4

    LDA delay_1
    delay_number_loop_2_5
    SUB one
    JNE delay_number_loop_2_5

    LDA delay_1
    delay_number_loop_2_6
    SUB one
    JNE delay_number_loop_2_6

    LDA No_PATTERN
    STA &FF2                 ; reset keypad values just to be safe

    input_31
        LDA &FF2
        SUB K0_PATTERN      ; check if digit entered is 0
        JNE input_32        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place 
        LDA ZERO_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds zero pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_32
        LDA &FF2
        SUB K1_PATTERN      ; check if digit entered is 1
        JNE input_33        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA ONE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds one pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_33
        LDA &FF2
        SUB K2_PATTERN      ; check if digit entered is 2
        JNE input_34        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA TWO_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds two pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_34
        LDA &FF2
        SUB K3_PATTERN      ; check if digit entered is 3
        JNE input_35        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA THREE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds three pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_35
        LDA &FF2
        SUB K4_PATTERN      ; check if digit entered is 4
        JNE input_36        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA FOUR_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds four pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_36
        LDA &FF2
        SUB K5_PATTERN      ; check if digit entered is 5
        JNE input_37        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA FIVE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds five pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_37
        LDA &FF2
        SUB K6_PATTERN      ; check if digit entered is 6
        JNE input_38        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA SIX_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds six pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_38
        LDA &FF2
        SUB K7_PATTERN      ; check if digit entered is 7
        JNE input_39        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA SEVEN_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds seven pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_39
        LDA &FF2
        SUB K8_PATTERN      ; check if digit entered is 8
        JNE input_310       ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA EIGHT_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds eight pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if wants to start the timer or set a new time again

    input_310
        LDA &FF2
        SUB K9_PATTERN      ; check if digit entered is 9
        JNE input_31        ; if not goes to check next number
        LDA &FF6
        STA &FF7            ; pushes minute digit to the left by one place again
        LDA &FF5
        STA &FF6            ; pushes tens place seconds digit to the left by one place
        LDA NINE_PATTERN
        STA &FF5  ; Store the first digit in &FF5 (for display)     ; loads the seconds nine pattern and displays at rightmost pos.
        JMP clear_enter     ; goes to next loop to check if user wants to start the timer or set a new time again



; re-eneter time or start timer loop
clear_enter

    LDA delay_1         ; added 6 sequential delays so that the button presses get registered properly properly
    delay_number_loop_3_1
    SUB one
    JNE delay_number_loop_3_1

    LDA delay_1
    delay_number_loop_3_2
    SUB one
    JNE delay_number_loop_3_2

    LDA delay_1
    delay_number_loop_3_3
    SUB one
    JNE delay_number_loop_3_3

    LDA delay_1
    delay_number_loop_3_4
    SUB one
    JNE delay_number_loop_3_4

    LDA delay_1
    delay_number_loop_3_5
    SUB one
    JNE delay_number_loop_3_5

    LDA delay_1
    delay_number_loop_3_6
    SUB one
    JNE delay_number_loop_3_6

    LDA No_PATTERN
    STA &FF2                 ; reset keypad values just to be safe

    input_41
        LDA &FF2
        SUB KC_PATTERN          ; check if button C is pressed
        JNE input_42            ; if not goes to if A is pressed
              
        LDA No_PATTERN
        STA &FF5
        STA &FF6
        STA &FF7                ; clear the display
        JMP input_digit_1       ;  repeat the diplay imput digt loops

    input_42
        LDA &FF2
        SUB KA_PATTERN          ; check if button C is pressed
        JNE input_41            ; if not goes to if C is pressed
        JMP main_loop           ; else starts the main countdown timer loop






; MAIN TIMER LOOP
main_loop



; most important loop that runs the whole timer, 
one_second

    test_1
        LDA &FF5
        SUB NINE_PATTERN            ; Check if digit is 9
        JNE test_2                  ; if not check next digit
        LDA No_PATTERN
        STA &FFF
        LDA red_light
        STA &FFF                    ; close all traffic light and display red lights

        ; arnd 1 second delay using a nested for loop
        LDA delay_i
            loop_i_2
            SUB one
            JGE loop_j_2
            JMP eight                       ; when delay is over, jump to label eight
            loop_j_2
                STA loop_i_acc_store        ; store value of delay i in a temp. register
                LDA delay_j
        
                loop_j_2_inner              ; the inner loop of the nested loop
                    SUB one
                    JNE loop_j_2_inner

            LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
            JMP loop_i_2

    eight
        LDA EIGHT_PATTERN                   ; diplay digit eight
        STA &FF5


    test_2
        LDA &FF5
        SUB EIGHT_PATTERN           ; Check if digit is 8
        JNE test_3                  ; if not check next digit
        LDA No_PATTERN
        STA &FFF
        LDA green_light
        STA &FFF                    ; close all traffic light and display green lights

        ; arnd 1 second delay using a nested for loop
        LDA delay_i
            loop_i_3
            SUB one
            JGE loop_j_3
            JMP seven                       ; when delay is over, jump to label seven
            loop_j_3
                STA loop_i_acc_store        ; store value of delay i in a temp. register
                LDA delay_j
        
            loop_j_3_inner                  ; the inner loop of the nested loop
                SUB one
                JNE loop_j_3_inner

        LDA loop_i_acc_store                ; load the value of previously stored i and repeat whole loop
        JMP loop_i_3

    seven
        LDA SEVEN_PATTERN
        STA &FF5


    test_3
        LDA &FF5
        SUB SEVEN_PATTERN           ; Check if digit is 7
        JNE test_4                  ; if not check next digit
        LDA No_PATTERN
        STA &FFF
        LDA red_light
        STA &FFF

        ; arnd 1 second delay using a nested for loop
        LDA delay_i
            loop_i_4
            SUB one
            JGE loop_j_4
            JMP six                         ; when delay is over, jump to label six
            loop_j_4
                STA loop_i_acc_store        ; store value of delay i in a temp. register
                LDA delay_j
        
                loop_j_4_inner              ; the inner loop of the nested loop
                    SUB one
                    JNE loop_j_4_inner

        LDA loop_i_acc_store                ; load the value of previously stored i and repeat whole loop
        JMP loop_i_4
        
    six
        LDA SIX_PATTERN
        STA &FF5


    test_4
        LDA &FF5
        SUB SIX_PATTERN             ; Check if digit is 6
        JNE test_5                  ; if not check next digit
        LDA No_PATTERN
        STA &FFF
        LDA green_light
        STA &FFF                    ; close all traffic light and display green lights

        ; arnd 1 second delay using a nested for loop
        LDA delay_i
            loop_i_5
            SUB one
            JGE loop_j_5
            JMP five                        ; when delay is over, jump to label five
            loop_j_5
                STA loop_i_acc_store        ; store value of delay i in a temp. register
                LDA delay_j
        
                loop_j_5_inner              ; the inner loop of the nested loop
                    SUB one
                    JNE loop_j_5_inner

        LDA loop_i_acc_store                ; load the value of previously stored i and repeat whole loop
        JMP loop_i_5
        
    five
        LDA FIVE_PATTERN
        STA &FF5


    test_5
        LDA &FF5
        SUB FIVE_PATTERN            ; Check if digit is 5
        JNE test_6                  ; if not check next digit
        LDA No_PATTERN
        STA &FFF
        LDA red_light
        STA &FFF                    ; close all traffic light and display red lights
    
        ; arnd 1 second delay using a nested for loop
        LDA delay_i
            loop_i_6
            SUB one
            JGE loop_j_6
            JMP four                        ; when delay is over, jump to label four
            loop_j_6
                STA loop_i_acc_store        ; store value of delay i in a temp. register
                LDA delay_j
            
                loop_j_6_inner              ; the inner loop of the nested loop
                    SUB one
                    JNE loop_j_6_inner

            LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
            JMP loop_i_6
    
    four
        LDA FOUR_PATTERN
        STA &FF5


test_6
    LDA &FF5
    SUB FOUR_PATTERN            ; Check if digit is 4
    JNE test_7                  ; if not check next digit
    LDA No_PATTERN
    STA &FFF
    LDA green_light
    STA &FFF                    ; close all traffic light and display green lights
    
    ; arnd 1 second delay using a nested for loop
    LDA delay_i
        loop_i_7
        SUB one
        JGE loop_j_7
        JMP three                       ; when delay is over, jump to label three
        loop_j_7
            STA loop_i_acc_store        ; store value of delay i in a temp. register
            LDA delay_j
        
            loop_j_7_inner              ; the inner loop of the nested loop
                SUB one
                JNE loop_j_7_inner

        LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
        JMP loop_i_7
    
    three
        LDA THREE_PATTERN
        STA &FF5


test_7
    LDA &FF5
    SUB THREE_PATTERN           ; Check if digit is 3
    JNE test_8                  ; if not check next digit
    LDA No_PATTERN
    STA &FFF
    LDA red_light
    STA &FFF                    ; close all traffic light and display red lights
    
    ; arnd 1 second delay using a nested for loop
    LDA delay_i
        loop_i_8
        SUB one
        JGE loop_j_8
        JMP two                         ; when delay is over, jump to label two
        loop_j_8
            STA loop_i_acc_store        ; store value of delay i in a temp. register
            LDA delay_j
        
            loop_j_8_inner
                SUB one
                JNE loop_j_8_inner      ; the inner loop of the nested loop

        LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
        JMP loop_i_8

    two
        LDA TWO_PATTERN
        STA &FF5


test_8
    LDA &FF5
    SUB TWO_PATTERN             ; Check if digit is 2
    JNE test_9                  ; if not check next digit
    LDA No_PATTERN
    STA &FFF
    LDA green_light
    STA &FFF                    ; close all traffic light and display green lights
    
    ; arnd 1 second delay using a nested for loop
    LDA delay_i
        loop_i_9
        SUB one
        JGE loop_j_9
        JMP One                         ; when delay is over, jump to label One
        loop_j_9
            STA loop_i_acc_store        ; store value of delay i in a temp. register
            LDA delay_j
        
            loop_j_9_inner              ; the inner loop of the nested loop
                SUB one
                JNE loop_j_9_inner

        LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
        JMP loop_i_9

    One
        LDA ONE_PATTERN
        STA &FF5


test_9
    LDA &FF5
    SUB ONE_PATTERN             ; Check if digit is 1
    JNE test_0                  ; if not check next digit
    LDA No_PATTERN
    STA &FFF
    LDA red_light
    STA &FFF                    ; close all traffic light and display red lights
    
    ; arnd 1 second delay using a nested for loop
    LDA delay_i
        loop_i_10
        SUB one
        JGE loop_j_10
        JMP zero                        ; when delay is over, jump to label zero
        loop_j_10
            STA loop_i_acc_store        ; store value of delay i in a temp. register
            LDA delay_j
        
            loop_j_10_inner             ; the inner loop of the nested loop
                SUB one
                JNE loop_j_10_inner

        LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
        JMP loop_i_10

    zero
        LDA ZERO_PATTERN
        STA &FF5


test_0
    LDA &FF5
    SUB ZERO_PATTERN            ; Check if digit is 0
    JNE test_1                  ; if not then restart this loop for checking digits again
    LDA No_PATTERN
    STA &FFF
    LDA green_light
    STA &FFF                    ; close all traffic light and display green lights
    
    ; arnd 1 second delay using a nested for loop
    LDA delay_i
        loop_i_1
        SUB one
        JGE loop_j_1
        JMP check_0s                    ; when delay is over, jump to label check_0s
        loop_j_1
            STA loop_i_acc_store        ; store value of delay i in a temp. register
            LDA delay_j
        
            loop_j_1_inner              ; the inner loop of the nested loop
                SUB one
                JNE loop_j_1_inner

        LDA loop_i_acc_store            ; load the value of previously stored i and repeat whole loop
        JMP loop_i_1


check_0s

    LDA &FF5                            ; check if ones place seconds digit is 0, if no, it goes to two_second loop
    SUB ZERO_PATTERN
    JNE two_second

    LDA &FF6                            ; check if tens place seconds digit is 0, if no, it goes to two_second loop
    SUB ZERO_PATTERN
    JNE two_second

    LDA &FF7
    SUB M_ZERO_PATTERN                  ; check if minutes place digit is 0, if no, it goes to two_second loop
    JNE two_second
    JMP check_end




two_second

    LDA NINE_PATTERN                    ; loads and diplays 9 in rightmost place when ones place second digit is 0
    STA &FF5

    test_5_1
        LDA &FF6
        SUB FIVE_PATTERN                ; Check if digit is 5
        JNE test_6_1                    ; if not check next digit

        LDA FOUR_PATTERN                ; if it is, load the checked digit-1
        STA &FF6
        JMP main_loop

    test_6_1
        LDA &FF6
        SUB FOUR_PATTERN                ; Check if digit is 4
        JNE test_7_1                    ; if not check next digit

        LDA THREE_PATTERN               ; if it is, load the checked digit-1
        STA &FF6
        JMP main_loop

    test_7_1
        LDA &FF6
        SUB THREE_PATTERN               ; Check if digit is 3
        JNE test_8_1                    ; if not check next digit

        LDA TWO_PATTERN                 ; if it is, load the checked digit-1
        STA &FF6
        JMP main_loop

    test_8_1
        LDA &FF6
        SUB TWO_PATTERN                 ; Check if digit is 2
        JNE test_9_1                    ; if not check next digit

        LDA ONE_PATTERN                 ; if it is, load the checked digit-1
        STA &FF6
        JMP main_loop

    test_9_1
        LDA &FF6
        SUB ONE_PATTERN                 ; Check if digit is 1
        JNE test_0_1                    ; if not check next digit

        LDA ZERO_PATTERN                ; if it is, load the checked digit-1
        STA &FF6
        JMP main_loop

    test_0_1
        LDA &FF6
        SUB ZERO_PATTERN                ; Check if digit is 0
        JNE test_5_1                    ; if not check next digit

        LDA FIVE_PATTERN                ; if it is, load the checked digit-1
        STA &FF6

    
one_minute

    test_1_2
        LDA &FF7
        SUB M_NINE_PATTERN              ; Check if digit is 9
        JNE test_2_2                    ; if not check next digit

        LDA M_EIGHT_PATTERN             ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_2_2
        LDA &FF7
        SUB M_EIGHT_PATTERN             ; Check if digit is 8
        JNE test_3_2                    ; if not check next digit

        LDA M_SEVEN_PATTERN             ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_3_2
        LDA &FF7
        SUB M_SEVEN_PATTERN             ; Check if digit is 7
        JNE test_4_2                    ; if not check next digit

        LDA M_SIX_PATTERN               ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_4_2
        LDA &FF7
        SUB M_SIX_PATTERN               ; Check if digit is 6
        JNE test_5_2                    ; if not check next digit

        LDA M_FIVE_PATTERN              ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_5_2
        LDA &FF7
        SUB M_FIVE_PATTERN              ; Check if digit is 5
        JNE test_6_2                    ; if not check next digit

        LDA M_FOUR_PATTERN              ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_6_2
        LDA &FF7
        SUB M_FOUR_PATTERN              ; Check if digit is 4
        JNE test_7_2                    ; if not check next digit

        LDA M_THREE_PATTERN             ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_7_2
        LDA &FF7
        SUB M_THREE_PATTERN             ; Check if digit is 3
        JNE test_8_2                    ; if not check next digit

        LDA M_TWO_PATTERN               ; if it is, load the checked digit-1
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_8_2
        LDA &FF7
        SUB M_TWO_PATTERN               ; Check if digit is 2
        JNE test_9_2                    ; if not check next digit

        LDA M_ONE_PATTERN
        STA &FF7
        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop

    test_9_2
        LDA &FF7
        SUB M_ONE_PATTERN               ; Check if digit is 1
        JNE test_0_2                    ; if not check next digit

        LDA M_ZERO_PATTERN              ; if it is, load the checked digit-1
        STA &FF7

        JMP main_loop                   ; restart the 3 whole checking digits loop by jumping back to main_loop
            
    


; 
check_end
    LDA &FF6
    SUB ZERO_PATTERN    
    JNE check_0s
    
    LDA &FF5
    SUB ZERO_PATTERN
    JNE one_second
    JMP end



end

    LDA No_PATTERN                      ; shut off red/green lights
    STA &FFF
    LDA all_lights                      ; diplay all lights on board
    STA &FFF

    LDA sound                           ; give a shot buzzer to signify the timer has ended
    STA &FFD



check_reset_button
    LDA &FF1
    JNE start_lights
    JMP check_reset_button              ; waits for reset button input from any SW to reset the timer and start it again with new input



; Define the binary patterns for each character
H_PATTERN defw &F6    ; 0b00000011110110 for 'H'
E_PATTERN defw &F9    ; 0b00000011111001 for 'E'
L_PATTERN defw &38    ; 0b00000000111000 for 'L'
O_PATTERN defw &3F    ; 0b00000000111111 for 'O'


; Define the 14-segment patterns for seconds (0-9)
ZERO_PATTERN defw &3F  ; 0b000000000111111
ONE_PATTERN defw &406  ; 0b000010000000110
TWO_PATTERN defw &DB   ; 0b000000011011011
THREE_PATTERN defw &CF ; 0b000000011001111
FOUR_PATTERN defw &E6  ; 0b000000011100110
FIVE_PATTERN defw &ED  ; 0b000000011101101
SIX_PATTERN defw &FD   ; 0b000000011111101
SEVEN_PATTERN defw &27 ; 0b000000000100111
EIGHT_PATTERN defw &FF ; 0b000000011111111
NINE_PATTERN defw &EF  ; 0b000000011101111


; Define the 14-segment patterns for minutes (0-9)
M_ZERO_PATTERN defw &403F  ; 0b100000000111111
M_ONE_PATTERN defw &4406   ; 0b100010000000110
M_TWO_PATTERN defw &40DB   ; 0b100000011011011
M_THREE_PATTERN defw &40CF ; 0b100000011001111
M_FOUR_PATTERN defw &40E6  ; 0b100000011100110
M_FIVE_PATTERN defw &40ED  ; 0b100000011101101
M_SIX_PATTERN defw &40FD   ; 0b100000011111101
M_SEVEN_PATTERN defw &4027 ; 0b100000000100111
M_EIGHT_PATTERN defw &40FF ; 0b100000011111111
M_NINE_PATTERN defw &40EF  ; 0b100000011101111



;INPUT FROM KEYBOARD
K0_PATTERN defw &1 ; 0b0000000000000001
K1_PATTERN defw &2 ; 0b0000000000000010
K2_PATTERN defw &4 ; 0b0000000000000100
K3_PATTERN defw &8 ; 0b0000000000001000
K4_PATTERN defw &10 ; 0b0000000000010000
K5_PATTERN defw &20 ; 0b0000000000100000
K6_PATTERN defw &40 ; 0b0000000001000000
K7_PATTERN defw &80 ; 0b0000000010000000
K8_PATTERN defw &100 ; 0b0000000100000000
K9_PATTERN defw &200 ; 0b0000001000000000
KC_PATTERN defw &1000 ; 0b0001000000000000
KA_PATTERN defw &400 ; 0b0000010000000000


; Traffic Lights
red_light defw &48C   ; 0b0000010010001100 for all red lights
amber_light defw &0242; 0b0000001001000010 for all amber lights
green_light defw &0131; 0b0000000100110001 for all green lights
all_lights defw &7FF  ; 0b0000011111111111 for all lights


; Sound labels
sound defw &8E35
sound_counter defw &0003


; Delay labels
one defw &0001
delay_1 defw &FFFF
delay_i defw &0010
delay_j defw &FFFF
loop_i_acc_store defw 0


; Reset display/light label
No_PATTERN defw &0
