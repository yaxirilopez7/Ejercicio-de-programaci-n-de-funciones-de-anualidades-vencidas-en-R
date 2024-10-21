# Ejercicio-de-programacion-de-funciones-de-anualidades-vencidas-en-R

En este repositorio encontrara las formulas necesarias y esenciales del tema de Anualidades Vencidas, al igual, que van acompañadas con ejemplos para un mejor entendimiento.

Con el siguiente codigo, puede usted  cargar las funciones relativas a los calculos solicitadas de Anualidades Vencidas:

```{r}
source("https://raw.githubusercontent.com/yaxirilopez7/Ejercicio-de-programaci-n-de-funciones-de-anualidades-vencidas-en-R/refs/heads/main/Funciones_de_Anualidades_vencidas.R")
```


### Valor futuro, conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades

Una persona invierte $1000 cada año durante 10 años en una cuenta que gana un 5% de interés anual. ¿Cuál será el valor futuro de la inversión?
$VA$=$1,000.00
$i$=0.05 
$n$=10

```{r}
valor_futuro(1000, 0.05, 10) 
```


### Anualidad, conociendo valor futuro, tasa del periodo y número de pagos

Una persona quiere ahorrar $10,000 en 10 años con una tasa de interés del 5%. ¿Cuánto debería ahorrar cada año?
$VF$=$10,000.00
$i$=0.05 
$n$=10

```{r}
calcular_anualidad(10000, 0.05, 10)
```

### Número de pagos o plazo, conociendo valor futuro, número de pagos y tasa del periodo

Si una persona desea acumular $10,000, haciendo pagos de $1,000 al final de cada año a una tasa del 5%, ¿cuántos años necesitará?
$VF$=$10,000.00
$R$=$1,000.00 
$i$=0.06

```{r}
calcular_plazo(10000, 1000, 0.05)
```



En el apartado de la tasa del periodo con valor futuro, he decidido implementar dos tipos de codigos(procedimientos) donde se llega al mismo resultado, la unica variacion es que un metodo utiliza mas decimales que otro, donde concluyo que el metodo de Newton es mas eficiente a comparacion de uniroot(ya que me costo mas trabajo hacerlo por no conocer la herramienta).

En ambos casos es el mismo ejemplo
Una persona invierte $1,000 al año durante 10 años y recibe un valor futuro de $15,937.42. ¿Cuál fue la tasa de interés anual?
$VF$=$100,000.00
$R$=$12,000.00 
$n$=8


### Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con uniroot


```{r}
calcular_tasa(100000, 12000, 8)
```

### Tasa del periodo, conociendo valor futuro, número de pagos y monto de la anualidad, con Newton-R


```{r}
calcular_tasa_newton(100000, 12000, 8)
```


### Valor actual conociendo la anualidad, tasa de interés del periodo y el número (plazo) de anualidades

Anualidad de 1000, tasa del 5%, plazo de 10 periodos.

```{r}
valor_actual(1000, 0.05, 10) 
```


### Anualidad conociendo valor actual, tasa del periodo y número de pagos

Donde el valor actual es 10,000., tasa del 5%, plazo de 10 periodos

```{r}
calcular_anualidad_va(10000, 0.05, 10)
```


### Número de pagos conociendo valor actual, anualidad y tasa del periodo

Donde el valor actual es de 10,000., anualidad de 1000, y la tasa de 5%

```{r}
 calcular_numero_pagos(10000, 1000, 0.05)
```



Al igual que el caso de la tasa del periodo con valor futuro, en esta tasa con valor actual he decidido utilizar ambos metodos para una comparativa, y por las mismas razones anteriores.

### Tasa del periodo conociendo valor actual, número de pagos y monto de la anualidad, con uniroot


```{r}
calcular_tasa_va(80000, 10000, 10)
```


### Tasa del periodo conociendo valor actual, número de pagos y monto de la anualidad, con Newton-R


```{r}
calcular_tasa_va_newton(80000, 10000, 10)
```


Con estos ejemplos, espero quede mas claro la aplicacion de las formulas.


