# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjauzion <jjauzion@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/17 14:43:00 by jjauzion          #+#    #+#              #
#    Updated: 2018/02/18 20:46:34 by jjauzion         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all, clean, fclean, re, LIB

SRC_NAME1 = main.c \
			get_next_line.c \
			trace_line.c \
			twd_right_lines.c \
			twd_left_lines.c

SRC_NAME2 = 

SRC_PATH1 = src/

SRC_PATH2 = src/

OBJ_PATH1 = .obj/

LIB_PATH = libft/

LDLIBS = libftprintf.a

EXT_LIB = -L /usr/local/lib/ -lmlx \
		  -framework OpenGL -framework AppKit

INC_PATH1 = libft/

INC_PATH2 = includes/

INC_NAME1 = ft_printf.h \
			libft.h

INC_NAME2 = header.h \
			get_next_line.h

NAME = fdf

CC = gcc

ifdef FLAG
	ifeq ($(FLAG), no)
	CFLAGS =
	DBFLAGS =
endif
ifeq ($(FLAG), debug)
	CFLAGS = -Wall -Wextra -Werror
	DBFLAGS = -g
endif
else
	CFLAGS = -Wall -Wextra -Werror
	DBFLAGS =
endif

SRC = $(addprefix $(SRC_PATH1),$(SRC_NAME1)) \
	  $(addprefix $(SRC_PATH2),$(SRC_NAME2))

OBJ1 = $(addprefix $(OBJ_PATH1),$(SRC_NAME1:.c=.o))

OBJ2 = $(addprefix $(OBJ_PATH1),$(SRC_NAME2:.c=.o))

INC =  $(addprefix $(INC_PATH2),$(INC_NAME2)) \
	   $(addprefix $(INC_PATH1),$(INC_NAME1))

LDFLAGS = $(addprefix $(LIB_PATH),$(LDLIBS))

CPPFLAGS = $(addprefix -I,$(INC_PATH1)) \
		   $(addprefix -I,$(INC_PATH2))

all: LIB $(NAME)

$(NAME): $(LDFLAGS) $(OBJ1) $(OBJ2)
	$(CC) $(DBFLAGS) $(LDFLAGS) $(EXT_LIB) $(OBJ1) $(OBJ2) -o $(NAME)

LIB:
	make -C libft

$(OBJ_PATH1)%.o: $(SRC_PATH1)%.c $(INC) Makefile
	@mkdir $(OBJ_PATH1) 2> /dev/null || true
	$(CC) $(CFLAGS) $(DBFLAGS) -c $< $(CPPFLAGS) -o $@

clean:
	make -C libft clean
	rm -f $(OBJ1) $(OBJ2)
	@rmdir $(OBJ_PATH1) 2> /dev/null || true

fclean: clean
	make -C libft fclean
	rm -fv $(NAME1) $(NAME2)

re: fclean all

norme:
	norminette $(SRC)
	norminette $(INC)
	norminette $(LIB_PATH)
