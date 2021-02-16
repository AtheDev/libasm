# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/11 17:26:39 by adupuy            #+#    #+#              #
#    Updated: 2021/02/12 13:27:11 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	ft_strlen

ft_strlen:
	xor rcx, rcx		; compteur rcx = 0;

loop:
	cmp	byte [rdi + rcx], 0	; si rdi[rcx] == '\0' alors ZF = 1
	jz 	break			; jz -> saut à l'adresse de break si résultat précédent = 0
					; si Z = 1 alors on arrête et on passe à la fonction break
	add	rcx, 1			; correspond à rcx = rcx + 1
	jmp	loop			; jmp -> saut inconditionnel à l'adresse de loop;

break:
	mov	rax, rcx		; on affecte la valeur de rcx(taille de la chaîne) à rax
	ret				; correspond au return
