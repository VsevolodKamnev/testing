# Define compiler
CC := gcc

# Define any compile-time flags
CFLAGS := -Wall -IC:/ProgramData/mingw64/mingw64/include

# Define any directories containing header files other than /usr/include
INCLUDES := -IC:/ProgramData/mingw64/mingw64/include/SDL2

# Define library paths in addition to /usr/lib
LFLAGS := -LC:/ProgramData/mingw64/mingw64/lib

# Define any libraries to link into executable:
LIBS := -lmingw32 -lSDL2main -lSDL2

# Define the C source files
SRCS := main.c

# Define the C object files 
OBJS := $(SRCS:.c=.o)

# Define the executable file 
MAIN := sdl_test

.PHONY: clean

all:    $(MAIN)
	@echo  Simple compiler named $(MAIN) has been compiled

$(MAIN): $(OBJS) 
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LFLAGS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN)
