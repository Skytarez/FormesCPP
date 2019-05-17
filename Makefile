# Makefile pour EZ-Draw++ : version pour UNIX
#
# 01/02/2017 - Eric.Remy@univ-amu.fr

# Variables pour Unix/X11
SHELL    = /bin/bash

ifeq ($(CXX),)
CXX=g++
endif
CFLAGS   = -g -Wall -pedantic -O2
CXXFLAGS = $(CFLAGS) -std=c++11
LIBS     = -L/usr/X11R6/lib -lX11 -lXext
RM       = rm -f
EXE      =

FORMULA_OBJECTS = Operator.o Value.o Unknown.o Addition.o SinCos.o

OBJECTS= Point.o Forme.o Rectangle.o Ellipse.o Carre.o Cercle.o Formes.o
OBJECTS+= $(FORMULA_OBJECTS)
OBJECTS+= ez-draw++.o

.PHONY:: all clean distclean

# Rajoutez vos executables C++ a la fin de EXECSPP =
#
EXECSPP = Formes$(EXE) Formula$(EXE)

all :: $(EXECSPP)

.cpp.o :
	$(CXX) -c $(CXXFLAGS) $*.cpp


Formes$(EXE) : main.cpp $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)

Formula$(EXE) : main_formula.cpp $(FORMULA_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

depends :
	$(CXX) -MM $(CXXFLAGS) *.cpp >depends

clean ::
	$(RM) $(OBJECTS) core

distclean :: clean
	$(RM) $(EXECSPP) depends

include depends
