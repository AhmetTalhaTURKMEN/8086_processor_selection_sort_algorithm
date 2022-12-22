 
 ;kod run edildiginde bellekte 200'den itibaren verilen 10 adet sayiyi kucukten buyuge siralar
 
 org 100h
 
 mov bx,0200h             ;bx'e 0200h hexadecimal degerini atar
 
       ;bellekteki konumu ;sirasiz -> sirali
 
 mov byte ptr [bx],23h    ;0200    -> 0204
 
 mov byte ptr [bx+1],31h  ;0201    -> 0205
 
 mov byte ptr [bx+2],45h  ;0202    -> 0207
  
 mov byte ptr [bx+3],11h  ;0203    -> 0201
  
 mov byte ptr [bx+4],7h   ;0204    -> 0200
 
 mov byte ptr [bx+5],18h  ;0205    -> 0202
 
 mov byte ptr [bx+6],21h  ;0206    -> 0203
  
 mov byte ptr [bx+7],92h  ;0207    -> 0209
 
 mov byte ptr [bx+8],81h  ;0208    -> 0208
  
 mov byte ptr [bx+9],43h  ;0209    -> 0206
 
     
   

  
 j2:             ;altagec icegirindeki di degeri 10 degilse j2 loopuna girer
    
    mov dl,[bx+di]   ;dl degerine hangi bellek sirasinda ise o degeri atar
    
 j1:             ;sirala icegirindeki si degeri 10 degilse j1 loopuna girer
    
    mov al,[bx+si]
    
    cmp al,dl
    
    jae sirala   ;al < dl ise sirala loopuna girer
                       
                 ;al > dl ise asagidaki kod dizini calisir
                
                      
    mov cl,dl    ; dl degerini kaybetmemek icin ;kucuk deger yeni dl'miz oluyor ve bunu odev geregi uzerine yazmamiz gerekiyor
    
    mov byte ptr[bx+di],al   ;yeni kucuk degeri eski kucuk degerin bellek konumuna atiyor
    
    mov byte ptr[bx+si],cl   ; eski kucuk degeri yeni kucuk degerin bellek konumuna atiyor
    
    mov dl,al    ;yeni kucuk degeri dl'ye atiyor
        
        
    
 sirala:         ;sirala loop'u
    
    inc si       ;si=si+1h
    
    cmp si,10    ;si degeri 10 ise zero flag setler 
    
    jnz j1       ;si degeri 10 degilse j1'e git
    
    jz altagec   ;si degeri 10 olunca altagec loopuna girer
    
    
 altagec:        ;altagec loop'u
    
    inc di       ;di=di+1h
    
    mov si,di    ;si degerine di'yi atar 
                                                                                                                            
    cmp di,10    ;di degeri 10 ise zero flag setler
    
    jnz j2       ;di degeri 10 degilse j2'e git 
    
                 ;di degeri 10 olunca alttaki hlt komutu calisir 
    
 hlt             ;halted /*durdur*/
          