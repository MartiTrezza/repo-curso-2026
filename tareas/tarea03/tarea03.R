
#Instalo los paquetes necesarios para realizar las actividades del capitulo 1
library (tidyverse)
install.packages("tidyverse")
library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins)
install.packages("ggthemes")
library(ggthemes)

#Penguins data frame 
penguins
glimpse(penguins)

#Crear un ggplot 

ggplot(data = penguins)
ggplot( data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g))
ggplot(data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

ggplot( data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point()

ggplot(data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot( data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

ggplot(data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")

ggplot( data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()

#Ejercicios 

#1 How many rows are in penguins? And colummns? 
 dim(penguins) 
 #Tiene 344 filas y 8 columnas 

#2
 ?penguins
# bill_depth_mm = un numero que indica la profundidad del pico en milimetros. 
 
#3
 ggplot(data = penguins) +
   geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm))
 #No se observa una relacion clara entre las dos variables ya que los puntos 
 #estan bastante dispersos 

#4 
 ggplot(data = penguins) +
   geom_point(mapping = aes(x = species, y = bill_depth_mm))
#Los puntos quedan amontonados 
 ggplot(data = penguins) +
   geom_boxplot(mapping = aes(x = species, y = bill_depth_mm))
 
#5
 ggplot(data = penguins) + 
   geom_point()
#Da error porque falta asignar valores a x e y 
 
#6 El na.rm = TRUE ignora los valores que faltan
# El valor por default es FALSE 
 ggplot(penguins) +
   geom_point(aes(x = bill_length_mm, y = bill_depth_mm),
     na.rm = TRUE)

#7 
 ggplot(data = penguins) +
   geom_point(
     mapping = aes(x = bill_length_mm, y = bill_depth_mm),
     na.rm = TRUE ) +
   labs(caption = "Data come from the palmerpenguins package.")

 #8
   ggplot(
      data = penguins, 
      aes(x = flipper_length_mm, y = body_mass_g)) + 
        geom_point(aes(color = bill_depth_mm))+ geom_smooth ()

#9 con color = island , va a haber distintos puntos de colores y geom_smooth() 
   #traza una linea para cada isla 
   ggplot(
     data = penguins,
     mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
   ) +
     geom_point() +
     geom_smooth(se = FALSE)

#10 Los dos graficos van a ser iguales, ya que en el primero las variables estan 
# puestas de forma general para ambos graficos y en el segundo se ponen
# especificamnete para cada geom.    
   
#1.4.3 Ejercicios 
   
#1
   ggplot(penguins, aes(y = species)) +
   geom_bar()
   # el grafico es horizontal en lugar de vertical 

#2 
   ggplot(penguins, aes(x = species)) +
     geom_bar(color = "red")
   
   ggplot(penguins, aes(x = species)) +
     geom_bar(fill = "red")
# fill es mejor para cambiar el color de las barras, 
# ya que color solo marca el borde 

#3 En un histograma bins indica en cuantos intervalos se divide el mismo 

#4
   ggplot(diamonds, aes (x = carat)) +
     geom_histogram(binwidth = 0.1)
   
   ggplot(diamonds, aes (x = carat)) + 
     geom_histogram(binwidth = 0.25)
   
   ggplot(diamonds, aes(x = carat)) +
     geom_histogram(binwidth = 0.5)
# Con 0.1 puedo ver mas los patrones 
   
#1.5.5 Ejercicios 
   
#1
   ?mpg
   glimpse(mpg)
  # manufacterer = categorica 
  # model = categorica 
  # displ = numerica 
  # year = numerica 
  # cyl = numerica 
  # trans = categorica 
  # drv = categorica 
  # cty = numerica 
  # hwy = numerica 
  # fl = categorica 
  # class = categorica
   
#2
   ggplot(mpg, aes(x = hwy, y = displ)) + 
     geom_point()
   
   ggplot(mpg, aes(x = hwy, y = displ, color = year)) + 
     geom_point()
   
   ggplot(mpg, aes(x = hwy, y = displ, size = year)) + 
     geom_point()
   
   ggplot(mpg, aes(x = hwy, y = displ, color = year, size = year)) + 
     geom_point()
   
   ggplot(mpg, aes(x = hwy, y = displ, shape = year)) + 
     geom_point()
   
   # con shape no se pueden usar variables numericas 
   # color y size si permiten variables numericas
   
#3
   ggplot(mpg, aes(x = hwy, y = displ, linewidth = year)) + 
     geom_point()
   # lineweidth se usa para cambiar el grosor de las lienas
   # entonces no funciona con geom_point()

#4 
   ggplot(mpg, aes(x = hwy, y = displ, color = year, size = year)) +
     geom_point()
   # en el grafico aparecen las dos esteticas, color y size. 

#5  
   ggplot(data = penguins, 
          aes(x = bill_depth_mm, y = bill_length_mm,
              color = species)) +
   geom_point()
   
   ggplot(data = penguins, 
          aes(x = bill_depth_mm, y = bill_length_mm)) + 
          facet_wrap(~species) + 
          geom_point()
   # usando color, en un mismo grafico separa la variable species
   # usando facet_wrap, se hace un grafico por cada species 

#6
   ggplot(
     data = penguins,
     mapping = aes(
       x = bill_length_mm, y = bill_depth_mm, 
       color = species, shape = species
     )
   ) +
     geom_point() +
     labs(color = "Species")
   # aparecen dos porque color y shape tienen titulos diferentes
   # si uso el mismo titulo para ambos, ggplot las combina en una
   
   ggplot(
     data = penguins,
     mapping = aes(
       x = bill_length_mm, y = bill_depth_mm, 
       color = species, shape = species
     )
   ) +
     geom_point() +
     labs(color = "Species", shape = "Species")
   
#7 
   ggplot(penguins, aes(x = island, fill = species)) +
   geom_bar(position = "fill")
  # Responde la proporcion de species que hay por isla 
   
   ggplot(penguins, aes(x = species, fill = island)) +
     geom_bar(position = "fill")
   # Responde a que proporcion de islas hay en cada especie 
   
#1.6.1 Ejercicios 
   
#1 
   ggplot(mpg, aes(x = class)) +
     geom_bar()
   ggplot(mpg, aes(x = cty, y = hwy)) +
     geom_point()
   ggsave("mpg-plot.png") 
   # ggsave guarda al segundo grafico, porque es el ultimo que se muestra 
   
#2
   ggplot(mpg, aes(x = class)) +
     geom_bar()
   ggplot(mpg, aes(x = cty, y = hwy)) +
     geom_point()
   ggsave("mpg-plot.pdf") # cambio y el lugar de png, se escribe pdf 
   
   ?ggsave()
  # Se puede guardar en formatos como pdf, png, jpeg, tiff, bmp y svg.
   
   