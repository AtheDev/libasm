# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 17:28:15 by adupuy            #+#    #+#              #
#    Updated: 2021/02/15 13:06:33 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strdup
extern __errno_location
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
	push	rdi
	call	ft_strlen			; on utilise la fonction ft_strlen qui renvoie la taille de la chaîne dans rax
	inc	rax				; on incrémente rax pour le '\0'
	mov	rdi, rax
	call	malloc
	cmp	rax, 0
	jne	copy

error:
	neg	rax
	mov	rdi, rax
	call	__errno_location
	mov	[rax], rdi
	mov	rax, -1
	ret

copy:
	mov	rdi, rax
	pop	rsi
	call	ft_strcpy
	ret

