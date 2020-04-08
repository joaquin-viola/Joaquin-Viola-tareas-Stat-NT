#Tarea 6 Joaquin Viola
#Ejercicio 1
library(ggplot2)
datos=mpg
disp1=ggplot(datos, aes(hwy,cty)) + labs(title="Millas por galon", subtitle = "Cuantas millas por galon rinde cada auto", x="En Ruta", y="En Ciudad") + geom_point()

#Ejercicio 2
disp2=ggplot(datos, aes(hwy,cty)) + labs(title="Millas por galon", subtitle = "Cuantas millas por galon rinde cada auto", x="En Ruta", y="En Ciudad") + geom_point(alpha=1/10)
disp3=ggplot(datos, aes(hwy,cty)) + labs(title="Millas por galon", subtitle = "Cuantas millas por galon rinde cada auto", x="En Ruta", y="En Ciudad") + geom_jitter()
# la funcion de alpha me resulta mejor porque te ayuda a ver la densidad de cada caso que repite

#Ejercicio 3
disp4=ggplot(datos, aes(hwy,cty, colour= class)) + labs(title="Millas por galon", subtitle = "Cuantas millas por galon rinde cada auto", x="En Ruta", y="En Ciudad") + geom_point()
disp5=ggplot(datos, aes(hwy,cty, colour= class)) + labs(title="Millas por galon", subtitle = "Cuantas millas por galon rinde cada auto", x="En Ruta", y="En Ciudad") + geom_point() + scale_color_brewer(palette="Dark2")
disp6=ggplot(datos, aes(hwy,cty, colour= class)) + labs(title="Millas por galon", subtitle = "Cuantas millas por galon rinde cada auto", x="En Ruta", y="En Ciudad") + geom_point() + facet_wrap(vars(class))
