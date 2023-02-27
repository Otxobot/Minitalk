# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abasante <abasante@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 11:08:39 by abasante          #+#    #+#              #
#    Updated: 2023/02/27 12:53:13 by abasante         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCES = server.c client.c

CC = gcc
CFLAGS = -Wall -Wextra -Werror
NAME = server client
OBJECTS = server.o client.o

all: $(NAME)

$(NAME): $(OBJECTS) $(LIBFT)
	$(CC) -O $@ $< -Llibft -lft
	$(CC) -o $@ $< -Llibft -lft

$(LIBFT):
	make -C libft

clean:
	rm -f $(OBJECTS)
	make -C libft clean

fclean: clean
	rm -f server client libft/libft.a

re: fclean all

.PHONY: all bonus libft clean fclean re
