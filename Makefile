# Copyright (C) 2023 Ethan Uppal. All rights reserved.

SRCDIR		:= src
INCLUDEDIR	:= src

CC			:= $(shell which g++ || which clang)
PY			:= $(shell which python3 || which python)
CFLAGS		:= -std=c++17 -pedantic -Wall -Wextra -I $(INCLUDEDIR)
CDEBUG		:= -g
CRELEASE	:= -O3 -DRELEASE_BUILD #-fno-fast-math
TARGET		:= libcevslam.a

# follow instructions on website to install
ICPLIB		:= /usr/local/lib/libcevicp.a
ICPINC		:= /usr/local/include/cev_icp
TESTH		:= /usr/local/include/simple_test/simple_test.h

LDFLAGS		:= $(ICPLIB)
CFLAGS		+= -I$(ICPINC) \
			   -I/usr/local/include/eigen3 \
			   -I/usr/local/include$

# CFLAGS 		+= $(CRELEASE)
CFLAGS 		+= $(CDEBUG)

SRC			:= $(shell find $(SRCDIR) -name "*.cpp")
OBJ			:= $(SRC:.cpp=.o)
DEPS 		:= $(OBJS:.o=.d) 

-include $(DEPS)

.PHONY: check
check:
	@if [ -f $(ICPLIB) ]; then \
		echo "==> ICP library installed"; \
	else \
		echo "error: ICP library missing: please read the website for dependency installation instructions"; \
		exit 1; \
	fi
	@if [ -f $(TESTH) ]; then \
		echo "==> simple-test installed"; \
	else \
		echo "error: simple-test missing: please read the website for dependency installation instructions"; \
		exit 1; \
	fi

.PHONY: test
test: test.cpp $(OBJ)
	@make check
	@$(CC) $(CFLAGS) $(LDFLAGS) -DTEST -o _temp $^
	@echo '==> Running tests...'
	@./_temp
	@rm -f ./_temp

%.o: %.cpp check
	@echo 'Compiling $@'
	$(CC) $(CFLAGS) -MMD -MP $< -c -o $@

.PHONY: clean
clean:
	rm -rf $(OBJ) $(shell find . -name "*.dSYM") $(shell find . -name "*.d") docs

.PHONY: docs 
docs:
	doxygen

.PHONY: cloc
cloc:
	cloc . --include-lang=c++,"c/c++ header" --by-file

.PHONY: readme
readme:
	$(PY) readme.py

ifeq ($(shell uname), Darwin)
AR 		:= /usr/bin/libtool
AR_OPT 	:= -static
else
AR 		:= ar
AR_OPT 	:= rcs $@ $^
endif

.PHONY: $(TARGET)
$(TARGET): $(LIBOBJ)
	$(AR) $(AR_OPT) $^ -o $@
