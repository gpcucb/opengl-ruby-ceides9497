require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

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
glTranslatef(0.0,0.0,-35.0);

  #modo de Modelado
  glMatrixMode(GL_MODELVIEW)

#cubo normal
  glPushMatrix();
    glColor3f(1.0,0.0,0.0);
    glutWireCube(5);
  glPopMatrix();

#cubo escalado
  glPushMatrix();
    glColor3f(0.0,1.0,0.0);
    glScalef(2.0,2.0,2.0);
    glutWireCube(5);
  glPopMatrix();

  #cubo rotate
  glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glRotatef(30,0,1,3);
    glutWireCube(5);
  glPopMatrix();

#cubo trasladado
glPushMatrix();
  glColor3f(0.0,1.0,1.0);
  glTranslatef(0,10,0);
  glutWireCube(5);
glPopMatrix();

#cubo combinado
glPushMatrix();
  glColor3f(1.0,1.0,1.0);
  glRotatef(30,0,1,3);
  glTranslatef(0,10,0);
  glScalef(2.0,2.0,2.0);
  glutWireCube(5);
glPopMatrix();


  glFlush
  sleep(20)
  exit(0)
end
glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH);
glutInitWindowSize(500,500)
glutInitWindowPosition(20,20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :display
glutMainLoop
