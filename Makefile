ODEF=$(shell ode-config --cflags)
ODEFL=$(shell ode-config --libs)
CC = gcc
CFLAGS = -w -Wall $(ODEF) -I/System/Library/Frameworks/OpenGL.framework/Headers
PROG = brainstem

SRCS = udpserver.c

TESTSRC = opengltemplate.cpp openglutils.cpp imageloader.cpp


ifeq ($(shell uname),Darwin)
	LIBS = -framework OpenGL -framework GLUT $(ODEFL)
else
	LIBS = -lglut $(ODEFL)
endif

all: $(PROG)

$(PROG):	$(SRCS)
	$(CC) $(CFLAGS) -o $(PROG) $(SRCS) $(LIBS)


clean:
	rm -f $(PROG)
