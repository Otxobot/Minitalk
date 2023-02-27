/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abasante <abasante@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/27 11:08:24 by abasante          #+#    #+#             */
/*   Updated: 2023/02/27 11:08:26 by abasante         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	sig_handler(int sig)
{
	static int	received = 0;

	if (sig == SIGUSR1)
		++received;
	else
	{
		ft_putnbr_fd(received, 1);
		ft_putchar_fd('\n', 1);
		exit(0);
	}
}

static void	get_bits(int pid, char *str)
{
	int		i;
	char	c;

	while (*str != '\0')
	{
		i = 8;
		c = *str++;
		while (i--)
		{
			if (c >> i & 1)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			usleep(100);
		}
	}
	i = 8;
	while (i--)
	{
		kill(pid, SIGUSR1);
		usleep(100);
	}
}

int	main(int ac, char **av)
{
	if (ac != 3 || !ft_strlen(av[2]))
	{
		ft_putstr_fd("Wrong format: <PID> <MESSAGE>", 1);
		ft_putchar_fd('\n', 1);
		return (1);
	}
	ft_putstr_fd("Sent    : ", 1);
	ft_putnbr_fd(ft_strlen(av[2]), 1);
	ft_putchar_fd('\n', 1);
	ft_putstr_fd("Received: ", 1);
	signal(SIGUSR1, sig_handler);
	signal(SIGUSR2, sig_handler);
	get_bits(ft_atoi(av[1]), av[2]);
	while (1)
		pause();
	return (0);
}
