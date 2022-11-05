import cassette.audiofiles.*;

// Librerias utilizadas para gif animado
import gifAnimation.*;
// librerias utilizadas para sonido


// Declaracion de variables para sonido
SoundFile sinicio,golpe1,golpe2;

// Variables utilizadas para controlar que no se cargue nuevamente la imagen del mivimiento del luchador si ya esta cargada
 int imgactj1=0;
 int imgactj2=0;
 
 
// Variables utilizadas para almacenar temporalmente el luchador seleccionado
 int luchador1=0;
 int luchador2=0;
 
// Variable utilizadas para cambia el fondo de las luchas de forma aleatoria. Se tienen 6 fondos diferentes
 float fondox=random(1,6);

// Variable utilizadas para controlar el inicio de la pelea y que solo cargue una ves en draw el gif animado de los luchadores 
 boolean inijuego=false;
 
// Variables utilizadas para cargar los fondos que se utilizan en todo el juego  
 PImage fondo1,fondo2,fondo3,fondo4,fondo5,fondo6,fondo62,fondo63,fondo64,fondo65,fondo66,fondo7; 
 
// Variable utilizada para controlar las diferentes opciones o pantallas del juego
 int x=0,pantalla=1;
 
// Variable utilizada para contar los rounds ganados por jugador 
 int round1, round2;
 
 // Variables de gif animados de cada jugador
 Gif jugador1;
 Gif jugador2;
 
 // Variable arreglo de la clase jugador
 jugador[] ajugador = new jugador[2];  //arreglo para jugadores
 
 
void setup() {
  size(1000, 800); 

 //Se Crea los objetos de los jugadores
 // Parametros: Primero: Numero de jugador, Segundo: el luchador seleccionado, se asigna por default el 1
 ajugador[0]= new jugador(1,1);
 ajugador[1]= new jugador(2,1);
  
 // Se cargan los gif animados a los jugadores 
  jugador1 = new Gif(this, ajugador[0].getimgluchador());  
  jugador1.play();
  jugador2 = new Gif(this, ajugador[1].getimgluchador());  
  jugador2.play();

// Se cargan todos los fondo
  fondo1 = loadImage("inicio1.gif");
  fondo2 = loadImage("inicio2.gif");
  fondo3 = loadImage("round.gif");
  fondo4 = loadImage("jugador1.gif");
  fondo5 = loadImage("jugador2.gif");
  fondo6 = loadImage("fondo1.gif");
  fondo62 = loadImage("fondo2.gif");
  fondo63 = loadImage("fondo3.gif");
  fondo64 = loadImage("fondo4.gif");
  fondo65 = loadImage("fondo5.gif");
  fondo66 = loadImage("fondo6.gif");
  fondo7 = loadImage("finjuego.gif");
// Se cargan los sonidos  
  sinicio = new SoundFile(this, "inicio.mp3");
  golpe1 = new SoundFile(this, "golpe1.mp3");
  golpe2 = new SoundFile(this, "golpe2.mp3");
  sinicio.play();  
}
 
void draw() {
  // swicht que controla el flujo del sistema
  switch (pantalla) {
    case 1:
            inicio1();
            break;
    case 2:
            inicio2();
            break;
    case 3:
            rounds();
            break;
    case 4:
            jugador1();
            break;
    case 5:
            jugador2();
            break;
    case 6:
            juego();
          break;
    case 7:
            finjuego();
            break;
  }
}

// Funciones del Juego
void inicio1(){
          image(fondo1, 0, 0); 
          fill(253,38,5);
          x=x+10;
          rect(100,20,1+x,50); 
          if (x>800){
            x=0;
            clear();
            pantalla=2;
          }         
}
void inicio2(){
          image(fondo2, 0, 0); 
}
void rounds(){
          image(fondo3, 0, 0);
          image(jugador1, 200, 300); 
          image(jugador2, 600, 300);          
          fill(255);
          textSize(60);
          text(round1,250,550);          
          text(round2,650,550);
          x=x+5;
          if (x>800){
            x=0;
            clear();
            PasaaPantalla6();
          }           

}
void jugador1(){
          image(fondo4, 0, 0);          
}
void jugador2(){
          image(fondo5, 0, 0); 
}
void juego(){
          if (inijuego==false){
            jugador1 = new Gif(this, ajugador[0].getimgluchador());
            jugador1.play();
            jugador2 = new Gif(this, ajugador[1].getimgluchador());
            jugador2.play();
            inijuego=true;
          }
          // Control de los diferentes fondos que se mostraran en las peleas
          switch (int(fondox)){
            case 1:
                  image(fondo6, 0, 0);
                  break;
            case 2:
                  image(fondo62, 0, 0);
                  break;
            case 3:
                  image(fondo63, 0, 0);
                  break;
            case 4:
                  image(fondo64, 0, 0);
                  break;
            case 5:
                  image(fondo65, 0, 0);
                  break;
            case 6:
                  image(fondo66, 0, 0);
                  break;
          } 
          // Muestra el score y las vidas que tiene
          fill(255);
          textSize(20);
          text("score: "+ajugador[0].getscore()+" vidas: "+ajugador[0].getvidas(),150,110);          
          text("score: "+ajugador[1].getscore()+" vidas: "+ajugador[1].getvidas(),650,110);
           mueveJugador1();
           mueveJugador2();          
          Muestraluchadores();
}
void finjuego(){
          image(fondo7, 0, 0);
          Muestraluchadores();
          //image(jugador1, posxj1, posy); 
          //image(jugador2, posxj2, posy); 
}
void Muestraluchadores(){
          image(jugador1, ajugador[0].getposx(), ajugador[0].getposy()); 
          image(jugador2, ajugador[1].getposx(), ajugador[1].getposy()); 
}

void keyPressed(){
//  if (gano==false){
  movimiento1();  //detecta cuando se mueven los cuadritos  
//  }
}

void keyReleased(){
  no_movimiento1();  //detecta cuando se mueve el otro cuadrito
}

void mousePressed(){
  if(mouseButton==LEFT){
      switch (pantalla) {
        case 1:
                pantalla=2;
                luchador1=0;
                luchador2=0;
                break;
        case 2:
                if(mouseX>407 && mouseX<607 && mouseY<512 && mouseY>312){
                fondox=random(1,6);
                pantalla=4;
              }                       
                break;
        case 3:
                PasaaPantalla6();
                break;
        case 4:
                luchador1=Seleccionaluchador();
                if (luchador1 != 0){
                  pantalla=5;
                }
                break;
        case 5:
                luchador2=Seleccionaluchador();
                if (luchador2 != 0){
                    round1=0;
                    round2=0;
                    ajugador[0]= new jugador(1,luchador1);
                    ajugador[1]= new jugador(2,luchador2);  
                    pantalla=6;                
                }
                break;

        case 7:
                if(mouseX>363 && mouseX<543 && mouseY<492 && mouseY>312){
                    inijuego=false;
                    pantalla=1;
                }                
                break;
      }

  }
}

void PasaaPantalla6(){
                ajugador[1].posicioninicial();
                ajugador[0].posicioninicial();                
                jugador1 = new Gif(this, ajugador[0].getimgluchador());
                jugador1.play();       
                jugador2 = new Gif(this, ajugador[1].getimgluchador());
                jugador2.play();       
                pantalla=6;
}

int Seleccionaluchador(){
int luchselect=0;  
  if(mouseX>189 && mouseX<339 && mouseY<339 && mouseY>188){
    luchselect=1;
  }
  if(mouseX>425 && mouseX<575 && mouseY<339 && mouseY>188){
    luchselect=2;
  }  
  if(mouseX>661 && mouseX<811 && mouseY<339 && mouseY>188){
    luchselect=3;
  } 
  if(mouseX>189 && mouseX<339 && mouseY<540 && mouseY>390){
    luchselect=4;
  }
  if(mouseX>425 && mouseX<575 && mouseY<540 && mouseY>390){
    luchselect=5;
  }  
  if(mouseX>661 && mouseX<811 && mouseY<540 && mouseY>390){
    luchselect=6;
  }   
  return luchselect;
}

//MOVIMIENTO

boolean j1Derecha = false;
boolean j1Izquierda = false;
boolean j1Arriba = false;
boolean j1Golpe1 = false;
boolean j1Golpe2 = false;

boolean j2Derecha = false;
boolean j2Izquierda = false;
boolean j2Arriba = false;
boolean j2Golpe1 = false;
boolean j2Golpe2 = false;

void no_movimiento1(){

  if(keyCode==RIGHT)
    j1Derecha = false;    

  if(keyCode==LEFT)
    j1Izquierda = false;

  if(keyCode==UP)
    j1Arriba = false;
    
  if(keyCode=='N' || keyCode=='n')
    j1Golpe1=false;

  if(keyCode=='M' || keyCode=='m')
    j1Golpe2=false;
    
    if(keyCode=='D' || keyCode=='d')
       j2Derecha=false;

    if(keyCode=='A' || keyCode=='a')
       j2Izquierda=false;

    if(keyCode=='W' || keyCode=='w')
       j2Arriba=false;
     
    if(keyCode=='1')
      j2Golpe1=false;
    if(keyCode=='2')
      j2Golpe2=false;
}



void movimiento1(){  //si funciona

  if(keyCode==RIGHT)
    j1Derecha = true;    

  if(keyCode==LEFT)
    j1Izquierda = true;

  if(keyCode==UP)
    j1Arriba = true;
    
  if(keyCode=='N' || keyCode=='n')
    j1Golpe1=true;
  if(keyCode=='M' || keyCode=='m')
    j1Golpe2=true;

  
    if(keyCode=='D' || keyCode=='d')
       j2Derecha=true;

    if(keyCode=='A' || keyCode=='a')
       j2Izquierda=true;

    if(keyCode=='W' || keyCode=='w')
       j2Arriba=true;
     
    if(keyCode=='1')
      j2Golpe1=true;
    if(keyCode=='2')
      j2Golpe2=true;
}
void mueveJugador1()
{
// este mueve al jugador
  if(j1Derecha){
        ajugador[0].derecha();
      if (imgactj1!=1){
        jugador1 = new Gif(this, ajugador[0].getimgluchador());
        jugador1.play();
        imgactj1=1;
      }}

  if(j1Izquierda){
        ajugador[0].izquierda();
      if (imgactj1!=1){
        jugador1 = new Gif(this, ajugador[0].getimgluchador());
        jugador1.play();        
        imgactj1=1;
      }}

  if(j1Arriba){
      ajugador[0].arriba();
      if (imgactj1!=2){
        jugador1 = new Gif(this, ajugador[0].getimgluchador());
        jugador1.play();
        imgactj1=2;
      }else{jugador1.play();}
  }
  if(j1Golpe1){
      ajugador[0].golpe1();
      if (ajugador[1].validaGolpe(ajugador[0].getposx())) golpe1.play();
      if (imgactj1!=3){
        jugador1 = new Gif(this, ajugador[0].getimgluchador());
        jugador1.play();
        imgactj1=3;
      }else{jugador1.play();}
  }
  if(j1Golpe2){
      ajugador[0].golpe2();
      if (ajugador[1].validaGolpe(ajugador[0].getposx())) golpe2.play();
      if (imgactj1!=4){
        jugador1 = new Gif(this, ajugador[0].getimgluchador());
        jugador1.play();
        imgactj1=4;
      }else{jugador1.play();}
  }
}

void mueveJugador2()
{
    if(j2Derecha){
        ajugador[1].derecha();
      if (imgactj2!=1){
        jugador2 = new Gif(this, ajugador[1].getimgluchador());
        jugador2.play();
        imgactj2=1;
      }
  }

    if(j2Izquierda){
        ajugador[1].izquierda();
      if (imgactj2!=1){
        jugador2 = new Gif(this, ajugador[1].getimgluchador());
        jugador2.play();        
        imgactj2=1;
      }
  }  

    if(j2Arriba){
      ajugador[1].arriba();
      if (imgactj2!=2){
        jugador2 = new Gif(this, ajugador[1].getimgluchador());
        jugador2.play();
        imgactj2=2;
      }else{jugador2.play();}
  } 

    if(j2Golpe1){
      ajugador[1].golpe1();      
      if (ajugador[0].validaGolpe(ajugador[1].getposx())) golpe1.play();
      if (imgactj2!=3){
        jugador2= new Gif(this, ajugador[1].getimgluchador());
        jugador2.play();
        imgactj2=3;
      }else{jugador2.play();}
  } 
      
    if(j2Golpe2){
      ajugador[1].golpe2();
      if (ajugador[0].validaGolpe(ajugador[1].getposx())) golpe2.play();
      if (imgactj2!=4){
        jugador2 = new Gif(this, ajugador[1].getimgluchador());
        jugador2.play();
        imgactj2=4;
      }else{jugador2.play();}
  }
  // Valida si ya termino el round y si termino el juego
  if (ajugador[0].getfinround() || ajugador[1].getfinround()){
        if (ajugador[0].getfinjuego() || ajugador[1].getfinjuego()){
            if (ajugador[0].getfinjuego()){
              ajugador[0].perder();
            }else{ ajugador[1].perder();}
            pantalla=7;
        }else{
           if (ajugador[0].getfinround()){
                ajugador[0].roundpierde();
                ajugador[1].roundgana();
                round2=round2+1;
            }else{
                ajugador[1].roundpierde();
                ajugador[0].roundgana();
                round1=round1+1;
            }
          ajugador[1].setscore();
          ajugador[0].setscore();
          pantalla=3;
        }
        imgactj1=0;
        imgactj2=0;        
        jugador1 = new Gif(this, ajugador[0].getimgluchador());
        jugador1.play();
        jugador2 = new Gif(this, ajugador[1].getimgluchador());
        jugador2.play();         
  }
  
}

//-----------------------------------
// Clases
//-----------------------------------
public class jugador {
private float posx, posy;
private int luchador;
private int jugador;
private int score;
private int vidas;
private boolean finround;
private boolean finjuego;
private int movimiento; // 1=mover 2=golpe1  3=golpe2  4=saltar 5=perder 6=roundgana 7=roundpierde
private String imgluchador;
private String l11[] = {"j1_m1.gif","j1_g11.gif","j1_g21.gif","j1_s1.gif","j1_p1.gif","j1_g.gif","j1_p.gif"};
private String l12[] = {"j1_m2.gif","j1_g12.gif","j1_g22.gif","j1_s2.gif","j1_p2.gif","j1_g.gif","j1_p.gif"};
private String l21[] = {"j2_m1.gif","j2_g11.gif","j2_g21.gif","j2_s1.gif","j2_p1.gif","j2_g.gif","j2_p.gif"};
private String l22[] = {"j2_m2.gif","j2_g12.gif","j2_g22.gif","j2_s2.gif","j2_p2.gif","j2_g.gif","j2_p.gif"};
private String l31[] = {"j3_m1.gif","j3_g11.gif","j3_g21.gif","j3_s1.gif","j3_p1.gif","j3_g.gif","j3_p.gif"};
private String l32[] = {"j3_m2.gif","j3_g12.gif","j3_g22.gif","j3_s2.gif","j3_p2.gif","j3_g.gif","j3_p.gif"};
private String l41[] = {"j4_m1.gif","j4_g11.gif","j4_g21.gif","j4_s1.gif","j4_p1.gif","j4_g.gif","j4_p.gif"};
private String l42[] = {"j4_m2.gif","j4_g12.gif","j4_g22.gif","j4_s2.gif","j4_p2.gif","j4_g.gif","j4_p.gif"};
private String l51[] = {"j5_m1.gif","j5_g11.gif","j5_g21.gif","j5_s1.gif","j5_p1.gif","j5_g.gif","j5_p.gif"};
private String l52[] = {"j5_m2.gif","j5_g12.gif","j5_g22.gif","j5_s2.gif","j5_p2.gif","j5_g.gif","j5_p.gif"};
private String l61[] = {"j6_m1.gif","j6_g11.gif","j6_g21.gif","j6_s1.gif","j6_p1.gif","j6_g.gif","j6_p.gif"};
private String l62[] = {"j6_m2.gif","j6_g12.gif","j6_g22.gif","j6_s2.gif","j6_p2.gif","j6_g.gif","j6_p.gif"};

public jugador(int jugadort, int luchadort){
  jugador=jugadort;
  luchador=luchadort;
  movimiento=1;
  posicioninicial();
  posy=500;
  score=100;
  vidas=3;
  finjuego=false;
  finround=false;
  seleccionaImagenluchador();
}
public boolean  getfinround() {
        return finround;
    }
public int  getvidas() {
        return vidas;
    }
public boolean getfinjuego() {
        return finjuego;
    }
public String getimgluchador() {
        return imgluchador;
    }
public int getluchador() {
        return luchador;
    }
    
public void setluchador(int nluchador)
    {
        luchador = nluchador;
    }
public int getjugador() {
        return jugador;
    }
    
public void setjugador(int njugador)
    {
        jugador = njugador;
    }


public int getscore() {
        return score;
    }
    
public void setscore()
    {
        score = 100;
    }
public void sumascore(int nscore)
    {
        score = score+nscore;
    }
public float getposx() {
        return posx;
}
    
public void setposx(float nposx) {
        posx = nposx;
    }
    
public float getposy()
    {
        return posy;
    }
public void setposy(float nposx)
    {
        posx = nposx;
    }

public void derecha()
    {
      posx=posx+5;
      if (posx>800){
        posx=posx-5;
      }
      movimiento=1;
      seleccionaImagenluchador();    
}
public void izquierda()
    {
      posx=posx-5;
      if (posx<100){
        posx=posx+5;
      }
      movimiento=1;
      seleccionaImagenluchador();    
    }
public void arriba()
    {
      if (jugador==1){
        posx=posx+45;
        if (posx>800) posx=posx-45;           
      }else{
        posx=posx-45;
        if (posx<50) posx=posx+45;                 
      }
      movimiento=4;
      seleccionaImagenluchador();
    }
public void golpe1()
    {
      movimiento=2;      
      seleccionaImagenluchador();
    }
public void golpe2()
    {
      movimiento=3;
      seleccionaImagenluchador();
    }
public void roundgana()
    {
      movimiento=6;
      seleccionaImagenluchador();
    }
public void roundpierde()
    {
      finround=false;
      movimiento=7;
      seleccionaImagenluchador();
    }    
public void perder()
    {
      movimiento=5;
      seleccionaImagenluchador();
    }
public boolean validaGolpe(float posxC){
 boolean res=false;
  if (posx-5<=posxC && posx+10>=posxC){
    score=score-5;
    res=true;
  }
  if (score==0){
    finround=true;
    score=100;
    vidas=vidas-1;
  }
  if (vidas==0){
    finjuego=true;
  }
  return res;
}
public void posicioninicial()
    {
      if (jugador==1) posx=350; else posx=500;
      movimiento=1;
      seleccionaImagenluchador();
    }
private void seleccionaImagenluchador()
    {
      if (jugador==1){
            switch(luchador){
              case 1:
                    seleccionaImagenMivimiento(l11);
                    break;
              case 2:
                    seleccionaImagenMivimiento(l21);
                    break;
              case 3:
                    seleccionaImagenMivimiento(l31);
                    break;
              case 4:
                    seleccionaImagenMivimiento(l41);
                    break;
              case 5:
                    seleccionaImagenMivimiento(l51);
                    break;
              case 6:
                    seleccionaImagenMivimiento(l61);
                    break;
                  }
          }
      else{
            switch(luchador){
              case 1:
                    seleccionaImagenMivimiento(l12);
                    break;
              case 2:
                    seleccionaImagenMivimiento(l22);
                    break;
              case 3:
                    seleccionaImagenMivimiento(l32);
                    break;
              case 4:
                    seleccionaImagenMivimiento(l42);
                    break;
              case 5:
                    seleccionaImagenMivimiento(l52);
                    break;
              case 6:
                    seleccionaImagenMivimiento(l62);
                    break;
                  }

      }          
    }
     private void seleccionaImagenMivimiento(String[] listamov){
             imgluchador = listamov[movimiento-1];
     }
 }
