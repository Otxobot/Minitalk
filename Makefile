# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abasante <abasante@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 11:08:39 by abasante          #+#    #+#              #
#    Updated: 2023/02/27 13:16:49 by abasante         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = server client
CC = gcc
CFLAGS 	= -Wall -Werror -Wextra

CLIENT_C =	client.c
SERVER_C =	server.c

OBJECTS = server.o client.o

all: $(NAME)

$(NAME): $(OBJECTS) $(LIBFT)
	make -C libft
	$(CC) -o $@ $< $(CFLAGS) libft/libft.a
	$(CC) -o $@ $< $(CFLAGS) libft/libft.a

$(LIBFT):
	make -C libft

clean:
	rm -f $(OBJECTS)
	make -C libft clean

fclean: clean

	rm -f server client libft/libft.a

re: fclean all

.PHONY : all clean fclean re