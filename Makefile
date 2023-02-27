# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abasante <abasante@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 11:08:39 by abasante          #+#    #+#              #
#    Updated: 2023/02/27 13:20:18 by abasante         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = server client
CC = gcc
CFLAGS 	= -Wall -Werror -Wextra

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