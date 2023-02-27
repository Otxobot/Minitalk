# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abasante <abasante@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 11:08:39 by abasante          #+#    #+#              #
#    Updated: 2023/02/27 13:27:15 by abasante         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = server client server_bonus client_bonus
CC = gcc
CFLAGS 	= -Wall -Werror -Wextra
OBJECTS = server.o client.o server_bonus.o client_bonus.o

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
	rm -f server client server_bonus client_bonus libft/libft.a

re: fclean all

.PHONY : all clean fclean re