library(nycflights13)
library(tidyverse)

#3.2.5 Ejercicios 

#1 

flights |> 
  filter(arr_delay >= 120)

flights |>
  filter(dest %in% c("IAH", "HOU"))

flights |>
  filter(carrier %in% c("UA", "AA", "DL"))

flights |> 
  filter(month %in% c(7,8,9))

flights |> 
  filter(arr_delay > 120, dep_delay <= 0)

flights |> 
  filter(dep_delay >= 60, dep_delay - arr_delay > 30)

#2

flights |> 
  arrange(desc (dep_delay))

flights |> 
  arrange(dep_time)

#3

flights |>
  arrange(desc(distance / air_time * 60))

#4
flights |>
  distinct(month, day) |>
  nrow()
# Si 

#5

flights |>
  arrange(desc(distance))

flights |>
  arrange(distance)

#6 Si, importa porque es mas eficiente usar filter() y despues arrange()
# al usar primero filter() se eliminan las filas que no se necesitan y despues 
# arrange ordena las que quedaron. Si se hace al reves, y primero se ordena 
# y despues se filtra, se pierde muhco tiempo ordenando cuando despues se van
# a filtrar

#3.3.5 Ejercicios 

#3 
flights |>
  select(dep_time, dep_time, dep_time)
# por mas que se escriba muchas veces, R no la repite 

#4
variables <- c("year", "month", "day", "dep_delay", "arr_delay")

flights |>
  select(any_of(variables))

# any_of() sirve para seleccionar las variables que están
# dentro del vector.

#5 
flights |> select(contains("TIME"))
# Por defecto no distingue mayúsculas de minúsculas.
# Con ignore.case = FALSE sí las distingue.

flights |> select(contains("TIME", ignore.case = FALSE))

#6
flights |>
  rename(air_time_min = air_time) |>
  relocate(air_time_min)

#7
flights |> 
  select(tailnum) |> 
  arrange(arr_delay)
# Da error porque al hacer select(tailnum) estas dejando afuera todo el resto 
# de las variables, entonces no puede hacer arrange (arr_delay) ya que 
# (arr_delay) no esta 

#3.5.7 Ejercios 

#1

flights |>
  group_by(carrier) |>
  summarize(avg_delay = mean(arr_delay, na.rm = TRUE)) |>
  arrange(desc(avg_delay))
# F9 tiene el peor promedio de demora, pero tambien puede influir 
# a que destino vuela 

flights |>
  group_by(carrier, dest) |>
  summarize(n())

#2
flights |>
  group_by(dest) |>
  slice_max(dep_delay, n = 1)

#3
flights |>
  group_by(hour) |>
  summarize(avg_delay = mean(dep_delay, na.rm = TRUE)) |>
  ggplot(aes(x = hour, y = avg_delay)) +
  geom_line()
# Cuanto mas tarde sale el vuelo, mayor demora tiene 

#4

flights |>
  slice_min(dep_delay, n = -1)

# Con -1, slice_min deja afuera la fila, que en este caso, es la que menos 
# demora tiene 

#5
flights |>
  count(dest) 
# count() agrupa por la variable y muestra cuantas filas hay.

flights |>
  count(dest, sort = TRUE)
# con count() y sort, puedo ademas de agruparlos ordenarlos de mayor a menor
# cantidad

#6
df <- tibble(
  x = 1:5,
  y = c("a", "b", "a", "a", "b"),
  z = c("K", "K", "L", "L", "K")
)

# 1  group_by() agrupa las filas según la variable que le damos,
# pero no cambia los datos ni la cantidad de filas.

df |>
  group_by(y)

#2
df |>
  arrange(y)
#arrange(y) ordena la fila segun 'y', y cambia las filas. 

#3 

df |>
  group_by(y) |>
  summarize(mean_x = mean(x))
# agrupa las filas según y, y calcula el promedio de x para cada grupo.

#4
df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))
# agrupa según y y z y calcula el promedio de x.
# el mensaje dice que el resultado queda agrupado por y.

#5
df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x), .groups = "drop")
# el resultado es el mismo que en el punto anterior,
# pero con .groups = "drop" deja de estar agrupado.

#6 
df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

df |>
  group_by(y, z) |>
  mutate(mean_x = mean(x))

# summarize() reduce cada grupo a una fila.
# mutate() mantiene todas las filas y agrega el promedio
# correspondiente a cada grupo.


#19.2.4 Ejercicios 


#1 weather se relaciona con airports mediante origin y faa.
# un aeropuerto puede tener muchas observaciones de weather

#2 se podria agregar una conexion entre dest de flights
# y origin de weather para tener el clima del aeropuerto de destino

#3 la hora duplicada es por el cambio de horario.
# esa hora aparece dos veces

#4 se podria hacer una tabla con los dias especiales.
# la fecha seria la clave primaria y se conectaria con flights
# usando year, month y day

#5 batting, people y salaries se relacionan mediante playerID.
# people, managers y awardsmanagers tambien se relacionan
# mediante playerID.
# batting, pitching y fielding tienen informacion de los mismos jugadores



#19.3.4 Ejercicios 

# 1

worst_hours <- flights |>
  filter(!is.na(dep_delay)) |>
  group_by(year, month, day, hour) |>
  summarise(
    avg_delay = mean(dep_delay + arr_delay, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  ) |>
  arrange(desc(avg_delay)) |>
  slice_head(n = 48)

worst_hours

worst_hours |>
  left_join(
    weather,
    join_by(year, month, day, hour))

# las horas con mayores restrasos estan relacionas con las condiciones
# meteorologicas 

# 2
top_dest <- flights2 |>
  count(dest, sort = TRUE) |>
  head(10)

flights2 |>
  semi_join(top_dest, join_by(dest))


# 3

flights |>
  anti_join(
    weather,
    join_by(origin, year, month, day, hour))

# no todos los vuelos tienen una observación correspondiente
# en la tabla weather.


# 4
flights |>
  anti_join(
    planes,
    join_by(tailnum))

# carrier explica la mayor parte de los problemas

flights |>
  anti_join(
    planes,
    join_by(tailnum)) |>
  count(carrier, sort = TRUE)

# La mayor parte de los tail numbers sin correspondencia
# pertenece a un mismo carrier


# 5

plane_carriers <- flights |>
  filter(!is.na(tailnum)) |>
  group_by(tailnum) |>
  summarise(
    carriers = paste(unique(carrier), collapse = ", "),
    n_carriers = n_distinct(carrier))

planes |>
  left_join(
    plane_carriers,
    join_by(tailnum))

plane_carriers |>
  filter(n_carriers > 1)

# Si un avión tiene más de un carrier, entonces la hipótesis
# de que cada avión es utilizado por una sola aerolínea es falsa 

# 6
flights |>
  left_join(
    airports |>
      select(faa, lat, lon),
    join_by(origin == faa)) |>
  rename(
    origin_lat = lat,
    origin_lon = lon) |>
  left_join(
    airports |>
      select(faa, lat, lon),
    join_by(dest == faa)) |>
  rename(
    dest_lat = lat,
    dest_lon = lon )

# es más fácil renombrar las columnas despues del join,
# para distinguir las coordenadas de origen y destino.


# 7
average_delay <- flights |>
  group_by(dest) |>
  summarise(
    average_delay = mean(arr_delay, na.rm = TRUE),
    n=n())

average_delay |>
  inner_join(
    airports,
    join_by(dest == faa))


average_delay |>
  inner_join(
    airports,
    join_by(dest == faa)) |>
  ggplot(aes(x = lon, y = lat)) +
  borders("state") +
  geom_point(
    aes(
      size = n,
      color = average_delay)) +
  coord_quickmap()

# 8

june_13 <- flights |>
  filter(
    year == 2013,
    month == 6,
    day == 13)

june_13 |>
  group_by(dest) |>
  summarise(
    average_delay = mean(arr_delay, na.rm = TRUE),
    n = n())

june_13 |>
  group_by(dest) |>
  summarise(
    average_delay = mean(arr_delay, na.rm = TRUE),
    n = n()) |>
  filter(n > 5) |>
  inner_join(
    airports,
    join_by(dest == faa)) |>
  ggplot(aes(x = lon, y = lat)) +
  borders("state") +
  geom_point(
    aes(
      size = n,
      color = average_delay)) +
  coord_quickmap()


# el 13 de junio de 2013 hubo fuertes tormentas en varias
# zonas, lo que puede explicar los retrasos observados.


