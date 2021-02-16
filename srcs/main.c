/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/11 16:54:46 by adupuy            #+#    #+#             */
/*   Updated: 2021/02/15 13:22:20 by adupuy           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void	test_ft_strlen(void)
{
	printf("*************** ft_strlen ***************\n\n");
	printf("str = 'test'\n");
	printf("ft_strlen = %zd\nstrlen = %zd\n\n", ft_strlen("test"), strlen("test"));
	printf("str = ''\n");
	printf("ft_strlen = %zd\nstrlen = %zd\n\n", ft_strlen(""), strlen(""));
	printf("str = '\\0'\n");
	printf("ft_strlen = %zd\nstrlen = %zd\n\n", ft_strlen("\0"), strlen("\0"));
	printf("str = 'coucou comment tu vas?'\n");
	printf("ft_strlen = %zd\nstrlen = %zd\n\n", ft_strlen("coucou comment tu vas?"), strlen("coucou comment tu vas?"));
	printf("str = ' '\n");
	printf("ft_strlen = %zd\nstrlen = %zd\n", ft_strlen(" "), strlen(" "));
}

void	test_ft_strcpy(void)
{
	char	src[] = "coucou!";
	char	dest[10];
	char	dest2[10];
	printf("*************** ft_strcpy ***************\n\n");
	printf("ft_strcpy = %s et strcpy = %s\n", ft_strcpy(dest, src), strcpy(dest2, src));
}

void	test_ft_strcmp(void)
{
	char	*s1;
	char	*s2;
	char	*s3;
	//s1 = "bonjour";
	//s2 = "bonjour";
	//s3 = "bonjar";
	s1 = "coucou";
	s2 = "coucou";
	s3 = "coucou toi";
	printf("***** ft_strcmp *****\n\n");
	printf("1 -> ft_strcmp = %d et strcmp = %d\n", ft_strcmp(s1, s2), strcmp(s1, s2));
	printf("2 -> ft_strcmp = %d et strcmp = %d\n", ft_strcmp(s1, s3), strcmp(s1, s3));
}

void	test_ft_write(void)
{
	printf("***** ft_write *****\n\n");
//	printf("ft_write = %zd et write = %zd\n",ft_write(-2, "test1\n", 6), write(-2, "test1\n", 6));
	printf("ft_write = %zd et write = %zd\n", ft_write(-1, "test", 5), write(-1, "test", 5));
}

void	test_ft_read(void)
{
//	int	fd1;
//	int	fd2;
	int	fd3;
	ssize_t	ret;
	char	buff1[100];
//	char	buff2[100];

//	fd1 = open("file_text/test1.txt", O_RDONLY);
//	fd2 = open("file_text/test2.txt", O_RDONLY);
	errno = 0;
	fd3 = open("file_text/test3.txt", O_RDONLY);
	printf("***** ft_read *****\n\n");
	printf("-----> ft_read:\n");
	ret = ft_read(fd3, buff1, -10);
	buff1[ret] = '\0';
	printf("ft_read = %zd et buff1 = %s\n", ret, buff1);
	printf("errno = %d\n\n", errno);
	close(fd3);
	errno = 0;
	fd3 = open("file_text/test3.txt", O_RDONLY);
	printf("***** read *****\n");
	printf("-----> read:\n");
	ret = read(fd3, buff1, -10);
	buff1[ret] = '\0';
	printf("read = %zd et buff1 = %s\n", ret, buff1);
	printf("errno = %d\n", errno);
	close(fd3);
//	close(fd2);
//	close(fd3);
}

void	test_ft_strdup(void)
{
	printf("***** ft_strdup *****\n\n");
	printf("ft_strdup = %s et strdup = %s\n", ft_strdup("coucou toi!"), strdup("coucou toi!"));
}

int	main(void)
{
	test_ft_strlen();
	printf("\n\n");
	test_ft_strcpy();
	printf("\n\n");
	test_ft_strcmp();
	printf("\n\n");
	test_ft_write();
	printf("\n\n");
	test_ft_read();
	printf("\n\n");
	test_ft_strdup();
	return (0);
}
