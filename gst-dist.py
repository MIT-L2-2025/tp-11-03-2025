#!/usr/bin/env python
from __future__ import print_function
from sys import argv, stderr
from math import pi, sin, cos, sqrt, atan2

def deg_to_rad(angle_deg):
    """Convert degrees to radians."""
    return angle_deg * pi / 180

def rad_to_deg(angle_rad):
    """Convert radians to degrees."""
    return 180 * angle_rad / pi

def geodesic_distance(lat_a, lon_a, lat_b, lon_b, sphere_radius = 6371):
    """Return the geodesic distance between two points a, b at the surface
of a two-dimensional sphere of radius sphere_radius.

The longitudes and lattitudes of a and b must be expressed in degrees,
with lat=0 at the equator, lat=+90 at the north pole, and lat=-90 at
the south pole. (This is what happens in the GPS coordinates system).

By default, sphere_radius=6371, which is an approximation of earth's
radius in km. Change to sphere_radius=6371000 for an answer in metres.

    """
    lat_a = deg_to_rad(lat_a)
    lon_a = deg_to_rad(lon_a)
    lat_b = deg_to_rad(lat_b)
    lon_b = deg_to_rad(lon_b)
    delta_lat = deg_to_rad(lat_b - lat_a)
    delta_lon = deg_to_rad(lon_b - lon_a)
    
    x = sin(delta_lat/2) ** 2
    y = sin(delta_lon/2) ** 2
    z = cos(lat_a) * cos(lat_b)
    
    t = x + y * z
    d = 2 * atan2(sqrt(t), sqrt(1-t))
    
    return sphere_radius * d

def main():
    """Function called when this module is executed as a script."""
    try:
        (lat_a, lon_a, lat_b, lon_b) = map(float, argv[1:])
        print(geodesic_distance(lat_a, lon_a, lat_b, lon_b))
        exit(0)
    except ValueError:
        print("Usage: " + argv[0] + " lattitude_a longitude_a lattitude_b longitude_b",
              file=stderr)
        exit(1)

if __name__ == '__main__':
    main()