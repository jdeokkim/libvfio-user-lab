#
# Copyright (c) 2026 Jaedeok Kim <jdeokkim@protonmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

# ============================================================================>

.POSIX:

# ============================================================================>

.PHONY: all clean rebuild
.SUFFIXES: .c .out

# ============================================================================>

_COLOR_BEGIN = \033[1;38;5;163m
_COLOR_END = \033[m

# ============================================================================>

LOG_PREFIX = ${_COLOR_BEGIN} *${_COLOR_END}

PROJECT_NAME = libvfio-user-lab

# ============================================================================>

BINARY_PATH = bin
INCLUDE_PATH = include
LIBRARY_PATH = lib
SOURCE_PATH = src

# ============================================================================>

OBJECTS = \
	${SOURCE_PATH}/main.o

TARGET = ${BINARY_PATH}/${PROJECT_NAME}.out

# ============================================================================>

CC = cc

CLFLAGS = -fsanitize=address,leak,undefined

CFLAGS = -D_DEFAULT_SOURCE ${CLFLAGS} -g -I${INCLUDE_PATH} -I${SOURCE_PATH} \
	-O2 -std=c99 -Wall -Wconversion -Wdouble-promotion -Wpedantic -Wno-unused

LDFLAGS = ${CLFLAGS}
LDLIBS = -ljson-c -lm -l:libvfio-user.a

# ============================================================================>

all: pre-build build post-build

pre-build:
	@printf "${LOG_PREFIX} CC = ${CC}, MAKE = ${MAKE}\n"

build: ${TARGET}

# ============================================================================>

.c.o:
	@printf "${LOG_PREFIX} Compiling: $< -> $@\n"
	@${CC} -c $< -o $@ ${CFLAGS}

# ============================================================================>

${TARGET}: ${OBJECTS}
	@mkdir -p ${BINARY_PATH}
	@printf "${LOG_PREFIX} Linking: ${TARGET}\n"
	@${CC} ${OBJECTS} -o ${TARGET} ${LDFLAGS} ${LDLIBS}

# ============================================================================>

post-build:
	@printf "${LOG_PREFIX} Build complete.\n"

# ============================================================================>

rebuild: clean all

# ============================================================================>

clean:
	@printf "${LOG_PREFIX} Cleaning up.\n"
	@rm -f ${BINARY_PATH}/*.bin
	@rm -f ${SOURCE_PATH}/*.o

# ============================================================================>
