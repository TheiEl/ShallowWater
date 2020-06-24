import csv
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import matplotlib
from scipy.interpolate import griddata

nt=0
nx=0
ny=0

with open('n.csv') as csvfile:
    reader = csv.reader(csvfile, quoting=csv.QUOTE_NONNUMERIC)
    for row in reader:
        nx = int(row[0])
        ny = int(row[1])
        nt = int(row[2])

xx=np.empty((nx,ny))
yy=np.empty((nx,ny))
h=np.empty((nx,ny,nt))

print('Reading csv-files')

with open('xx.csv') as csvfile:
    reader = csv.reader(csvfile, quoting=csv.QUOTE_NONNUMERIC)
    for i in range(nx):
        row = next(reader)
        for j in range (ny):
            xx[i,j] = row[j]

with open('yy.csv') as csvfile:
    reader = csv.reader(csvfile, quoting=csv.QUOTE_NONNUMERIC)
    for i in range(nx):
        row = next(reader)
        for j in range (ny):
            yy[i,j] = row[j]

with open('h.csv') as csvfile:
    reader = csv.reader(csvfile, quoting=csv.QUOTE_NONNUMERIC)
    for k in range(nt):
        print('Reading timestep number ',k,' of ',nt)
        for i in range(nx):
            row = next(reader)
            for j in range (ny):
                h[i,j,k] = row[j]

print('Finished reading csv-files')

fig = plt.figure()

ax = fig.gca(projection='3d')

plot_args ={'rstride':1, 'cstride':1, 'cmap': 'coolwarm', 'linewidth': 0.01, 'antialiased': True, 'shade': True}

for k in range(nt):
    ax.clear()
    surf = ax.plot_surface(xx[:,:],yy[:,:],h[:,:,k], **plot_args)
    ax.set_xlabel('x')
    ax.set_ylabel('y')
    ax.set_zlabel('z')
    ax.set_zlim([0.9, 1.1])
    plt.pause(1e-3)
    print(k)
