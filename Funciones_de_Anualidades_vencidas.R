#Se presentan las funciones del tema de ANUALIDADES VENCIDAS
#Autor: Lic. C. Yaxiri Lopez G.
#V 1.0: 20 de octubre de 2024. 

 #Valor futuro, conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades:  
 valor_futuro=function(anualidad,tasa,n) {
   vf=anualidad*(((1+tasa)^n)-1) / tasa
 
   return(vf)
 }


 # Anualidad, conociendo valor futuro, tasa del periodo y número de pagos:
 calcular_anualidad=function(valor_futuro, tasa, n) {
   anualidad=valor_futuro*(tasa/(((1+tasa)^n) - 1))
  
   return(anualidad)
 }


 # Número de pagos o plazo, conociendo valor futuro, número de pagos y tasa del periodo:
 calcular_plazo=function(valor_futuro, anualidad, tasa) {
   n=(log(((valor_futuro*tasa)/anualidad)+ 1))/(log(1+tasa))
  
   return(n)
 }



 # Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con uniroot:
 calcular_tasa <- function(valor_futuro, anualidad, n) {
   tasa_func <- function(i) {
     if (i == 0) {
       return(valor_futuro - anualidad * n) 
     }
     valor_futuro - anualidad * ((1 + i)^n - 1) / i
   }
   
   tasa <- tryCatch({
     uniroot(tasa_func, c(0.0001, 0.5))$root  
   }, error = function(e) {
     return(NA)  
   })
   
   return(tasa)
 }
 
 
 
 # Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con Newton-R:
 calcular_tasa_newton <- function(valor_futuro, anualidad, n, tol = 1e-8, max_iter = 100) {
   f <- function(i) {
     valor_futuro - anualidad * ((1 + i)^n - 1) / i
   }
   
   f_prime <- function(i) {
     -anualidad * (n * (1 + i)^(n - 1) * i - ((1 + i)^n - 1)) / (i^2)
   }
   
   i <- 0.1
   iter <- 0
   
   while (abs(f(i)) > tol && iter < max_iter) {
     i <- i - f(i) / f_prime(i)  
     iter <- iter + 1
   }
   
   if (iter == max_iter) {
     return(NA)  
   }
   
   return(i)
 }
 
 
 
 
 
 

 # Valor actual conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades:
 valor_actual=function(anualidad,tasa,n){
   va=anualidad*((1-((1+tasa)^(-n)))/tasa)
 
    return(va)
 }



 # Anualidad conociendo valor actual, tasa del periodo y número de pagos:
 calcular_anualidad_va=function(valor_actual,tasa,n){
   anualidad=valor_actual*(tasa/(1-((1+tasa)^(-n))))
 
   return(anualidad)
 }


 #Número de pagos conociendo valor actual, anualidad y tasa del periodo:
 calcular_numero_pagos=function(valor_actual,anualidad,tasa){
   n=(log((anualidad/(valor_actual*tasa))+1))/(log(1+tasa))
   
   return(n)
 }
 
 
 #Tasa del periodo conociendo valor actual, número de pagos y monto de la anualidad, con uniroot:
 calcular_tasa_va <- function(valor_actual, anualidad, n) {
   tasa_func <- function(i) {
     if (i == 0) {
       return(valor_actual - anualidad * n)  
     }
     valor_actual - anualidad * (1 - (1 + i)^(-n)) / i
   }
   
   tasa_va <- tryCatch({
     uniroot(tasa_func, c(0.0001, 0.5))$root  
   }, error = function(e) {
     return(NA) 
   })
   
   return(tasa_va)
 }
 
 
 
 
 #Tasa del periodo conociendo valor actual, número de pagos y monto de la anualidad, con Newton-R:
 calcular_tasa_va_newton <- function(valor_actual, anualidad, n, tol = 1e-8, max_iter = 100) {
   f <- function(i) {
     valor_actual - anualidad * (1 - (1 + i)^(-n)) / i
   }
   
   f_prime <- function(i) {
     -anualidad * ((n * (1 + i)^(-n - 1) * i - (1 - (1 + i)^(-n))) / i^2)
   }
   
   i <- 0.1
   iter <- 0
   
   while (abs(f(i)) > tol && iter < max_iter) {
     i <- i - f(i) / f_prime(i)  
     iter <- iter + 1
   }
   
   if (iter == max_iter) {
     return(NA) 
   }
   
   return(i)
 }
 

 