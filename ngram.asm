; Group 18
; Mustafa Emre YILDIRIM - 150160069
; Zubeyir GENÇ - 150150136
; Muhammed YILMAZ - 150150149
;
; ebp-44 -> tekrar
; ebp-40 -> tekrar_say_iki
; ebp-36 -> tekrar_say
; ebp-32 -> size_2 - n
; ebp-28 -> size_1 - n
; ebp-24 -> i
; ebp-20 -> j
; ebp-16 -> k
; ebp-12 -> divider
; ebp-8 -> score
; ebp-4 -> sub_score
; ebp -> ebp
; ebp+4 -> return address
; ebp+8 -> *str_1
; ebp+12 -> size_1
; ebp+16 -> *str_2
; ebp+20 -> size_2
; ebp+24 -> n


global n_gram

n_gram:
        push    ebp
        mov     ebp, esp

        mov     dword [ebp-4], 0                ; sub_score = 0
        mov     dword [ebp-8], 0                ; score = 0
        mov     dword [ebp-12], 0               ; divider = 0
        mov     dword [ebp-36], 0               ; tekrar_say = 0

        mov     edx, dword [ebp+12]             ; edx = size_1
        sub     edx, dword [ebp+24]             ; edx = size_1 - n
        mov     dword [ebp-28], edx             ; ebp-28 = size_1 - n

        mov     edx, dword [ebp+20]             ; edx = size_2
        sub     edx, dword [ebp+24]             ; edx = size_2 - n
        mov     dword [ebp-32], edx             ; ebp-32 = size_2 - n

        mov     dword [ebp-24], 0               ; i = 0

        jmp     l1_cnt

l1_cnt: mov     edx, dword [ebp-28]             ; edx = size_1 - n
        cmp     edx, dword [ebp-24]             ; cmp size_1 - n, i
        jl      l1_dis                          ; size_1 - n < i -> l1_dis
        jmp     l1_ici

l1_ici: mov     eax, dword [ebp-24]             ; eax = i
        mov     dword [ebp-20], eax             ; j = i
        inc     dword [ebp-20]                  ; j++
        jmp     l4_cnt     

l4_cnt: mov     edx, dword [ebp-28]             ; edx = size_1 - n
        cmp     edx, dword [ebp-20]             ; cmp size_1 - n, j
        jl      l4_dis                          ; size_1 - n < j -> l4_dis
        jmp     l4_ici

l4_dis: mov     dword [ebp-40], 0               ; tekrar_say_iki = 0
        mov     dword [ebp-20], 0               ; j = 0
        jmp     l2_cnt

l4_ici: mov     dword [ebp-44], 0               ; tekrar = 0
        mov     dword [ebp-16], 0               ; k = 0
        jmp     l5_cnt

l5_cnt: mov     eax, dword [ebp-16]             ; eax = k
        cmp     eax, dword [ebp+24]             ; cmp k, n
        jl      l5_ici                          ; k < n -> l5_ici
        jmp     l5_dis

l5_ici: mov     eax, dword [ebp-16]             ; eax = k
        add     eax, dword [ebp-24]             ; eax = k + i  ;edx e toplamayı dene 
        add     eax, dword [ebp+8]              ; eax = address of (k+i)th charachter of str_1
        mov     edx, dword [eax]                ; ebx = (k+i)th charachter of str_1
        
        mov     eax, dword [ebp-16]             ; eax = k
        add     eax, dword [ebp-20]             ; eax = k + j
        add     eax, dword [ebp+8]              ; eax = address of (k+j)th charachter of str_1
        mov     ebx, dword [eax]                ; ebx = (k+j)th charachter of str_1

        cmp     dl, bl                          ; compare (k+i)th charachter of str_1 and (k+j)th charachter of str_1
        jz      i3_ici
        jmp     i3_dis

i3_ici: inc     dword [ebp-44]                  ; tekrar++
        jmp     i3_dis

i3_dis: inc     dword [ebp-16]                  ; k++
        jmp     l5_cnt

l5_dis: mov     eax, dword[ebp-44]              ; eax = tekrar
        cmp     eax, dword[ebp+24]              ; cmp tekrar, n
        jz      i4_ici                          ; tekrar == n -> i4_ici
        jmp     i4_dis

i4_ici: inc     dword [ebp-36]                  ; tekrar_say++
        inc     dword [ebp-24]                  ; i++
        jmp     l1_cnt

i4_dis: inc     dword [ebp-20]                  ; j++
        jmp     l4_cnt

l2_cnt: mov     edx, dword [ebp-32]             ; edx = ebp-32 = size_2 - n
        cmp     edx, dword [ebp-20]             ; cmp size_2 - n, j
        jl      l2_dis                          ; size_2 - n < j -> l2_dis
        jmp     l2_ici

l2_dis: mov     eax, dword [ebp-40]             ; eax = tekrar_say_2
        cmp     eax, 0                          ; cmp tekrar_say_2, 0
        jg      i6_ici                          ; tekrar_say_2 > 0
        jmp     i6_dis

i6_ici: inc     dword [ebp-8]                   ; score++
        mov     eax, dword [ebp-40]             ; eax = tekrar_say_iki
        add     dword [ebp-36], eax             ; tekrar_say = tekrar_say + tekrar_say_iki
        dec     dword [ebp-36]                  ; tekrar_say--

i6_dis: inc     dword [ebp-24]                  ; i++
        jmp     l1_cnt

l2_ici: mov     dword [ebp-16], 0               ; k = 0
        jmp     l3_cnt

l3_cnt: mov     eax, dword [ebp-16]             ; eax = k
        cmp     eax, dword [ebp+24]             ; cmp k, n
        jl      l3_ici                          ; k < n -> l3_ici
        jmp     l3_dis

l3_dis: mov     eax, dword[ebp-4]               ; eax = sub_score
        cmp     eax, dword[ebp+24]              ; cmp sub_score, n
        jz      i2_ici                          ; sub_score == n -> i2_ici
        jmp     i2_dis

l3_ici: mov     eax, dword [ebp-16]             ; eax = k
        add     eax, dword [ebp-24]             ; eax = k + i  ;edx e toplamayı dene 
        add     eax, dword [ebp+8]              ; eax = address of (k+i)th charachter of str_1
        mov     edx, dword [eax]                ; ebx = (k+i)th charachter of str_1
        
        mov     eax, dword [ebp-16]             ; eax = k
        add     eax, dword [ebp-20]             ; eax = k + j
        add     eax, dword [ebp+16]             ; eax = address of (k+j)th charachter of str_2
        mov     ebx, dword [eax]                ; ebx = (k+j)th charachter of str_2

        cmp     dl, bl                          ; compare (k+i)th charachter of str_1 and (k+j)th charachter of str_2
        jz      i1_ici
        jmp     i1_dis

i1_ici: inc     dword [ebp-4]                   ; sub_score++
        jmp     i1_dis

i1_dis: inc     dword [ebp-16]                  ; k++
        jmp     l3_cnt

i2_ici: inc     dword [ebp-40]                  ; tekrar_say_iki++
        jmp     i2_dis

i2_dis: mov     dword [ebp-4], 0                ; sub_score = 0
        inc     dword [ebp-20]                  ; j++
        jmp     l2_cnt

l1_dis: mov     eax, dword [ebp-28]             ; eax = size_1 - n
        mov     ebx, dword [ebp-32]             ; ebx = size_2 - n
        add     eax, ebx                        ; eax = size_1 - n + size_2 - n
        add     eax, 2                          ; eax = size_1 - n + 1 + size_2 - n + 1
        sub     eax, dword [ebp-8]              ; eax = size_1 - n + 1 + size_2 - n + 1 - score
        sub     eax, dword [ebp-36]             ; eax = size_1 - n + 1 + size_2 - n + 1 - score - tekrar_say
        mov     dword [ebp-12], eax             ; divider = size_1 - n + 1 + size_2 - n + 1 - score
        mov     eax, dword [ebp-8]              ; eax = score
        imul    eax, eax, 100                   ; eax = score * 100
        cdq                     
        idiv    dword [ebp-12]                  ; score * 100 / divider

        pop     ebp    
        ret