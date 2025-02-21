# ______________________________________________________
# 
# Generación de datos para modelos de regresión espacial
# 
# MASTER DATA SCIENCE & BIG DATA
# MODELOS PARA DATOS TEMPORALES Y ESPACIALES
# Juan M. Muñoz Pichardo
#_______________________________________________________

# LA FUNCIÓN GENERA LOS DATOS INTRODUCIENDO COMO PARÁMETRO 
# LOS CINCO ÚLTIMOS DÍGITOS DEL DNI


genespdat <- function(DNI15) 
{
  set.seed(DNI15)
# Generación de puntos según coordenadas

x = seq(100, 500, 25)
y = seq(200, 760, 40) 
d=expand.grid(x,y)
colnames(d)=c("X","Y")

vx1=rnorm(255,10,2)
vx2=rnorm(255,15,2)
vx3=rnorm(255,7,2)

epsilon=rnorm(255,0,2)

datos=data.frame(d,vx1,vx2,vx3)
n=dim(datos)[1]
names(datos)
datos[,1:2]
D=as.matrix(dist(datos[,1:2]))
diag(D)=rep(1,n)
W=5/D
diag(W)=rep(0,n)
W=as.matrix(W)

# Parametros
gam=runif(1,0.7,0.9)
rho=runif(1,0.2,0.4)
beta=runif(4,4,8)
beta
# Calculo de y
unos=c(rep(1,n))
X=as.matrix(cbind(unos,vx1,vx2,vx3))
cond=rbinom(1,1,0.5)
cond=1
A=rep(1000,n)+solve(diag(1,n) - rho * W)%*%(X%*%beta + epsilon)
B=X%*%beta + solve(diag(1,n) - gam * W)%*%epsilon
if (cond==1) 
  datos=data.frame(d,vx1,vx2,vx3,"vobj"=A)
if (cond==0) 
  datos=data.frame(d,vx1,vx2,vx3,"vobj"=B)
  
rm(A,B,d,D,W,X,cond,epsilon,gam,n,rho,beta,unos,x,y,vx1,vx2,vx3)
data.frame(datos)
}


