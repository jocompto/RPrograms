# Code to create figures
%matplotlib inline
import matplotlib.pyplot as plt
import numpy as np
plt.style.use('ggplot')

def plot_simple_line():
  rng = np.random.RandomState(42)
x = 10 * rng.rand(20)
y = 2 * x + 5 + rng.randn(20)
p = np.polyfit(x, y, 1)
xfit = np.linspace(0, 10)
yfit = np.polyval(p, xfit)
plt.plot(x, y, 'ok')??
plt.plot(xfit, yfit, color='gray')
plt.text(9.8, 1,
         "y = {0:.2f}x + {1:.2f}".format(*p),
         ha='right', size=14);

def plot_underdetermined_fits(p, brange=(-0.5, 1.5), xlim=(-3, 3),
                              plot_conditioned=False):
  rng = np.random.RandomState(42)
x, y = rng.rand(2, p).round(2)
xfit = np.linspace(xlim[0], xlim[1])
for r in rng.rand(20):
  # add a datapoint to make model specified
  b = brange[0] + r * (brange[1] - brange[0])
xx = np.concatenate([x, [0]])
yy = np.concatenate([y, [b]])
theta = np.polyfit(xx, yy, p)
yfit = np.polyval(theta, xfit)
plt.plot(xfit, yfit, color='#BBBBBB')
plt.plot(x, y, 'ok')

if plot_conditioned:
  X = x[:, None] ** np.arange(p + 1)
theta = np.linalg.solve(np.dot(X.T, X)
                        + 1E-3 * np.eye(X.shape[1]),
                        np.dot(X.T, y))
Xfit = xfit[:, None] ** np.arange(p + 1)
yfit = np.dot(Xfit, theta)
plt.plot(xfit, yfit, color='black', lw=2)

def plot_underdetermined_line():
  plot_underdetermined_fits(1)

def plot_underdetermined_cubic():
  plot_underdetermined_fits(3, brange=(-1, 2),
                            xlim=(0, 1.2))

def plot_conditioned_line():
  plot_underdetermined_fits(1, plot_conditioned=True)