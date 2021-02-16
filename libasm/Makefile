# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 17:10:38 by adupuy            #+#    #+#              #
#    Updated: 2021/02/14 17:26:05 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJS = ${SRCS:.s=.o}

NAME = libasm.a

EXEC = ./a.out

CC = nasm -felf64

RM = rm -f

all: ${NAME}

${NAME}: ${OBJS}
	ar rc ${NAME} ${OBJS}

clean:
	${RM} ${OBJS}

fclean: clean
	${RM} ${NAME}
	${RM} ${EXEC}

re: fclean all

${OBJS}: %.o: %.s
	${CC} $< -o $@

.PHONY: all clean fclean re
