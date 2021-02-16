# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 13:29:42 by adupuy            #+#    #+#              #
#    Updated: 2021/02/14 16:57:37 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_read
extern __errno_location

ft_read:
	mov	rax, 0			; sys_read
	syscall
	cmp	rax, 0			; on compare le retour de read qui se met dans rax à 0
	jge	break			; si rax >= 0 aucun problème et on quitte dans la fonction break
					; sinon on continue dans la fonction error

error:
	neg	rax			; rax négatif , on le passe en positif
	mov	rdi, rax		; on enregistre la valeur de rax dans rdi
					; car rax va prendre la valeur de retour de __errno_location
	call	__errno_location	; on fait appelle à __errno_location qui renvoie un ponteur sur errno
	mov	[rax], rdi		; étant donné que rax contient l'adresse de errno
					; en ajoutant [] on met la valeur de rdi dans ernno
	mov	rax, -1			; on dit que rax vaut -1 car read retourne -1 en cas d'erreur
	ret

break:
	ret
