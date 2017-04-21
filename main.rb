require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

puts ("Hola Mundo")

def display
  #Color de Fondo:negro
  glClearColor(0.0,0.0,0.0,0.0)
  #borramos la pantalla
  glClear(GL_COLOR_BUFFER_BIT)
  #modo proyeccion
  glMatrixMode(GL_PROJECTION)
  #cargamos la matriz identidad
  glLoadIdentity

  #Proyeccion ortografica, dentro de un cubo
  glOrtho(-1.0,1.0,-1.0,1.0,-1.0,1.0)

  #modo de Modelado
  glMatrixMode(GL_MODELVIEW)

  #Dibujamos un triangulo
  glBegin(GL_QUADS)
    glColor3f(1.0,0.0,0.0) #Color del primer vertice
    glVertex3f(-0.6,0.8,0.0) #coordenadas del primer vector
    glColor3f(0.0,1.0,1.0) #Color del segundo vertice
    glVertex3f(0.6,0.8,0.0) #coordenadas del segundo vector
    glColor3f(0.0,0.0,1.0) #Color del tercer vertice
    glVertex3f(0.6,-0.2,0.0) #coordenadas del tercer vector
    glColor3f(0.0,1.0,0.0) #Color del cuarto vertice
    glVertex3f(-0.6,-0.2,0.0) #coordenadas del cuarto vector
  glEnd
  glFlush
  glutPostRedisplay
end
glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA)
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :display
glutMainLoop
