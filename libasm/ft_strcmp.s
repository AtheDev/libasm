# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/15 10:56:33 by adupuy            #+#    #+#              #
#    Updated: 2021/02/15 11:09:13 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strcmp

ft_strcmp:
	xor	rcx, rcx			; compteur rcx = 0

loop:
	mov	al, byte [rdi, rcx]		; on met rdi[rcx] dans al
	mov	bl, byte [rsi, rcx]		; on met rsi[rcx] dans bl
	cmp	al, 0				; on compare al et 0, si al == '\0' on arrête
	je	break
	cmp	bl, 0				; on compare bl et 0, si bl == '\0' on arrête
	je	break
	cmp	al, bl				; on compare al et bl, si al != bl on s'arrête
	jne	break
	inc	rcx				; on incrémente rcx
	jmp	loop				; on retourne dans loop

break:
	movzx	rax, al				; on copie le contenue de al dans rax
	movzx	rdx, bl				; on copie le contenue de bl dans rdx
	sub	rax, rdx			; on soustrait la valeur de rdx à rax et le résultat se stock dans rax
	ret
