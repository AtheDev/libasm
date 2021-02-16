NAME = a.out

SRCS = srcs/main.c

OBJS = ${SRCS:.c=.o}

INCLD = -I libasm

CC = clang

RM = rm -f

CFLAGS = -Wall -Werror -Wextra

LDFLAGS = -L ./libasm

all: ${NAME}

${NAME}: ${OBJS}
	make -C libasm
	${CC} ${CFLAGS} ${LDFLAGS} ${OBJS} -o ${NAME} -lasm

${OBJS}: %.o: %.c
	${CC} ${CFLAGS} ${INCLD} -c $< -o $(<:.c=.o)

clean:
	${RM} ${OBJS}
	make clean -C libasm

fclean: clean
	${RM} ${NAME}
	make fclean -C libasm

re: fclean all

.PHONY: all clean fclean re
