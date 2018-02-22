/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   twd_left_lines.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jjauzion <jjauzion@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/02/18 20:35:44 by jjauzion          #+#    #+#             */
/*   Updated: 2018/02/22 20:20:41 by jjauzion         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "header.h"

void	octant_4(t_data *data, t_line line, char option)
{
	int	err;

	(void)option;
	err = line.dx;
	line.dx = line.dx * 2;
	line.dz = line.dz * 2;
	while (line.p1->x > line.p2->x)
	{
		pixel_put(data, line.p1, option);
		line.p1->x -= 1;
		if ((err = err + line.dz) >= 0)
		{
			line.p1->z += 1;
			err = err + line.dx;
		}
	}
}

void	octant_3(t_data *data, t_line line, char option)
{
	int	err;

	(void)option;
	err = line.dz;
	line.dx = line.dx * 2;
	line.dz = line.dz * 2;
	while (line.p1->z < line.p2->z)
	{
		pixel_put(data, line.p1, option);
		line.p1->z += 1;
		if ((err = err + line.dx) <= 0)
		{
			line.p1->x -= 1;
			err = err + line.dz;
		}
	}
}

void	octant_5(t_data *data, t_line line, char option)
{
	int	err;

	(void)option;
	err = line.dx;
	line.dx = line.dx * 2;
	line.dz = line.dz * 2;
	while (line.p1->x > line.p2->x)
	{
		pixel_put(data, line.p1, option);
		line.p1->x -= 1;
		if ((err = err - line.dz) >= 0)
		{
			line.p1->z -= 1;
			err = err + line.dx;
		}
	}
}

void	octant_6(t_data *data, t_line line, char option)
{
	int	err;

	(void)option;
	err = line.dz;
	line.dx = line.dx * 2;
	line.dz = line.dz * 2;
	while (line.p1->z > line.p2->z)
	{
		pixel_put(data, line.p1, option);
		line.p1->z -= 1;
		if ((err = err - line.dx) >= 0)
		{
			line.p1->x -= 1;
			err = err + line.dz;
		}
	}
}
