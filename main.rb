require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

puts ("Hola Mundo")

def display
  #activar Buffer
  glDepthFunc(GL_LEQUAL);
  glEnable(GL_DEPTH_TEST);
  glClearDepth(1.0);

  #Color de Fondo:negro
  glClearColor(0.0,0.0,0.0,0.0)
  #borramos la pantalla
  glClear(GL_COLOR_BUFFER_BIT  | GL_DEPTH_BUFFER_BIT)
  #modo proyeccion
  glMatrixMode(GL_PROJECTION)
  #cargamos la matriz identidad
  glLoadIdentity

  #Proyeccion ortografica, dentro de un cubo
  #glOrtho(-1.0,1.0,-1.0,1.0,-1.0,1.0)
gluPerspective(60.0,1.0,1.0,100.0);
glTranslatef(0.0,0.0,-2.0);

  #modo de Modelado
  glMatrixMode(GL_MODELVIEW)

  #Dibujamos un triangulo
  glBegin(GL_QUADS); #Dibujamos un cuadrado
    glColor3f(0.0,1.0,1.0) #Color del primer vertice
    glVertex3f(-0.5,0.5,-0.5);#Coordenadas del primer vértice (superior-izquierda)
    glVertex3f(-0.5,-0.5,0.5);#Coordenadas del segundo vértice (inferior-izquierda)
    glVertex3f(0.5,-0.5,0.5);#Coordenadas del primer vértice (inferior-derecha)
    glVertex3f(0.5,0.5,-0.5);# Coordenadas del primer vértice (superior-derecha)
  glEnd();

  glBegin(GL_TRIANGLES);
    glColor3f(1.0,0.0,0.0);
    glVertex3f(0.0,0.5,0.0);
    glVertex3f(-0.7,-0.5,0.0);
    glVertex3f(0.7,-0.5,0.0);
  glEnd();

  glFlush
end
glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH);
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :display
glutMainLoop
