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


  glEnable(GL_LIGHTING)
  glEnable(GL_LIGHT0)
  glEnable(GL_COLOR_MATERIAL)
  glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
  glEnable(GL_NORMALIZE)
  glShadeModel(GL_FLAT)

  position = [80.0, 100.0, 100.0]
  color = [1.0, 1.0, 1.0, 1.0]
  ambient = [0.2, 0.2, 0.2, 0.1]

  glLightfv(GL_LIGHT0, GL_POSITION, position)
  glLightfv(GL_LIGHT0, GL_DIFFUSE, color)
  glLightfv(GL_LIGHT0, GL_SPECULAR, color)
  glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient)


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


#esfera normal
  glPushMatrix();
    glColor3f(1.0,0.0,0.0);
    glutSolidSphere(5, 150, 150);
  glPopMatrix();

  glPushMatrix();
    glColor3f(1.0,1.0,0.0);
    glTranslatef(10.0,10.0,0.0);
    glutSolidSphere(5, 150, 150);
  glPopMatrix();

  glPushMatrix();
    glColor3f(1.0,0.5,0.5);
    glTranslatef(-10.0,10.0,0.0);
    glutSolidSphere(5, 150, 150);
  glPopMatrix();

  glPushMatrix();
    glColor3f(1.0,0.5,1.0);
    glTranslatef(-10.0,-10.0,0.0);
    glutSolidSphere(5, 150, 150);
  glPopMatrix();

  glPushMatrix();
    glColor3f(0.0,0.5,0.5);
    glTranslatef(10.0,-10.0,0.0);
    glutSolidSphere(5, 150, 150);
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
