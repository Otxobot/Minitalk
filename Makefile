# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abasante <abasante@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/27 11:08:39 by abasante          #+#    #+#              #
#    Updated: 2023/02/27 13:53:01 by abasante         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SOURCES = server.c client.c server_bonus.c client_bonus.c

NAME = server client server_bonus client_bonus
CC = gcc
CFLAGS 	= -Wall -Werror -Wextra
OBJECTS = server.o client.o server_bonus.o client_bonus.o

all: $(NAME)

$(NAME): $(OBJECTS) $(LIBFT)
	make -C libft
	$(CC) -o server server.o $(CFLAGS) libft/libft.a
	$(CC) -o client client.o $(CFLAGS) libft/libft.a
	$(CC) -o server_bonus server_bonus.o $(CFLAGS) libft/libft.a
	$(CC) -o client_bonus client_bonus.o $(CFLAGS) libft/libft.a
	
$(LIBFT):
	make -C libft

clean:
	rm -f $(OBJECTS)
	make -C libft clean

fclean: clean
	rm -f server client server_bonus client_bonus libft/libft.a

re: fclean all

.PHONY : all clean fclean re