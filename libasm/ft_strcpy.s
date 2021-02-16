# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/12 13:22:31 by adupuy            #+#    #+#              #
#    Updated: 2021/02/12 19:18:41 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strcpy

ft_strcpy:
	xor	rcx, rcx			; compteur rcx = 0

loop:
	cmp	byte [rsi, rcx], 0		; si rsi[rcx] = '\0' alors on est arrivé à la fin de la chaîne src et ZF = 1
	jz	null				; si ZF = 1 alors on s'arrête et on passe à la fonction null
	mov	dl, [rsi, rcx]			; au lieu de 'rdx' on utilise 'dl' car 'dl' à une taille de 1 octet
						; on copie ce que l'on trouve à rsi[rcx] dans dl
	mov	[rdi, rcx], dl			; on copie dl dans rdi[rcx]
	inc	rcx				; correspond à rcx = rcx + 1
	jmp	loop				; on retourne dans loop tant qu'il y a des caratères dans src donc dans rsi

null:
	mov	byte [rdi, rcx], 0		; permet d'ajoute le '\0' à la fin de la chaîne dest soit rdi
	jmp	break				; saut inconditionnel vers la fonction break

break:
	mov	rax, rdi			; on affecte la valeur de rdi(correspond à la chaîne copiée) à rax
	ret					; correspond au return
