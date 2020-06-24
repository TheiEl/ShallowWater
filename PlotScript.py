import ShallowWater

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import matplotlib
from scipy.interpolate import griddata

fig = plt.figure()

ax = fig.gca(projection='3d')

#data = np.array(ShallowWater.data_array)

plot_args ={'rstride':1, 'cstride':1, 'cmap': 'coolwarm', 'linewidth': 0.01, 'antialiased': True, 'shade': True}

#for i in range(0, ShallowWater.nt, 5):
#    ax.clear()
#    surf = ax.plot_surface(data[i,:,:,0], data[i,:,:,1], data[i,:,:,2], **plot_args)
#    ax.set_xlabel('x')
#    ax.set_ylabel('y')
#    ax.set_zlabel('z')
#    ax.set_zlim([0.9, 1.1])
#    plt.pause(1e-3)
#    print(i)
