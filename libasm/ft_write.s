# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adupuy <adupuy@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/14 11:57:30 by adupuy            #+#    #+#              #
#    Updated: 2021/02/14 16:53:25 by adupuy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_write
extern __errno_location

ft_write:
	mov	rax, 1			; sys_write
	syscall
	cmp	rax, 0			; on compare le retour de write qui se met dans rax à 0
	jge	break			; si rax >= 0 aucun problème et on quitte dans la fonction break
					; sinon on continue dans la fonction error

error:
	neg	rax			; rax est négatif, on le passe en positif
	mov	rdi, rax		; on enregistre la valeur de rax dans rdi 
					; car rax va prendre la valeur du retour de __errno_location
	call	__errno_location	; on fait appelle à __errno_location qui renvoie un pointeur sur errno
	mov	[rax], rdi		; étant donné que rax contient l'adresse de errno,
					; en ajoutant [] on met la valeur de rdi dans errno
	mov	rax, -1			; on dit que rax vaut -1 car write retourne -1 en cas d'erreur
	ret

break:
	ret
