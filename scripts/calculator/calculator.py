import math
import numpy as np
from sympy import *

class ConstList:
    def __init__(self):
        self.value = []
        self.name = []
        self.description = []
        self.units = []
        self.mvl: int = len('Value') #Max value len
        self.mnl: int = len('Name') #Max name len
        self.mdl: int = len('Description') #Max description len

    def add(self, value: int, name: str, description: str, units: str):
        self.value.append(value)
        self.name.append(name)
        self.description.append(description)
        self.units.append(units)
        if self.mvl < (len(str(value)) + len(units) + 1):
            self.mvl = len(str(value)) + len(units) + 1
        if self.mnl < len(name):
            self.mnl = len(name)
        if self.mdl < len(description):
            self.mdl = len(description)

    def print(self):
        line = '-'
        self.__printcol('Description', 'Name', 'Value',True)
        for i in range(0,len(self.value),1):
            self.__printcol(self.description[i], self.name[i], str(self.value[i])+' '+self.units[i], False)

    def __printcol(self,description: str, name: str, value: str,begin: bool):
        s = ' '
        line = '-'
        dl = len(description)
        nl = len(name)
        vl = len (value)
        sld = srd = sln = srn = slv = srv = 0
        if (self.mdl-dl)%2:
            sld = int((self.mdl-dl)/2 + 2)
            srd = int((self.mdl-dl)/2 + 1)
        else:
            sld = int((self.mdl-dl)/2 + 1)
            srd = int((self.mdl-dl)/2 + 1)
        if (self.mnl-nl)%2:
            sln = int((self.mnl-nl)/2 + 2)
            srn = int((self.mnl-nl)/2 + 1)
        else:
            sln = int((self.mnl-nl)/2 + 1)
            srn = int((self.mnl-nl)/2 + 1)
        if (self.mvl-vl)%2:
            slv = int((self.mvl-vl)/2 + 2)
            srv = int((self.mvl-vl)/2 + 1)
        else:
            slv = int((self.mvl-vl)/2 + 1)
            srv = int((self.mvl-vl)/2 + 1)

        size: int = 4 + sld + dl + srd + sln + nl + srn + slv + vl + srv
        if begin:
            print(size*line)
        print('|' + sld*s + description + srd*s + '|' + sln*s + name + srn*s + '|' + slv*s + value + srv*s + '|')
        print(size*line)

List = ConstList()

#Define constants as such
pi = math.pi
List.add(pi,"pi","Pi","")

c = 299792458
List.add(c,"c","Speed of light in vacuum","m/s")

mn = 1.674927498E-27
List.add(mn,"mn","Neutron mass","kg")

mp = 1.672621923E-27
List.add(mp,"mp","Proton mass","kg")

me = 9.10938356E-31
List.add(me,"me","Electron mass","kg")

e = 1.602176634E-19
List.add(e,"e","Elementary charge","C")

h = 6.62607004E-34
List.add(h,"h","Planck constant","J s")

heV = 4.135667696E-15
List.add(heV,"heV","Planck constant","eV s")

hbar = 1.054571817E-34
List.add(hbar,"hbar","Reduced Planck constant","J s")

hbareV = 6.582119569E-16
List.add(hbareV,"hbareV","Reduced Planck constant","eV s")

G = 6.67430E-11
List.add(G,"G","Newtonian constant of gravitation","m^3/(kg s^2)")

epsilon0 = 8.8541878128E-12
List.add(epsilon0,"epsilon0","Vacuum electric permitivity","F/m")

kB = 1.380649E-23
List.add(kB,"kB","Boltzmann constant","J/K")

kBeV = 8.617333E-5
List.add(kBeV,"kBeV","Boltzmann constant","eV/K")

NA = 6.02214076E23
List.add(NA, "NA", "Avogadro constant","1/mol")

mu0 = 1.256637062E-6
List.add(mu0, "mu0", "Vacuum magnetic permeability","N/(A^2)")

muB = 9.27401007E-24
List.add(muB, "muB", "Bohr magneton","J/T")

#Useful functions
def sc(x): #scientific notation
    print("{:e}".format(x))

def sqrt(x):
    return math.sqrt(x)

def log(x,b = None):
    if(b == None):
        return math.log(x)
    else:
        return math.log(x,b)

def exp(x):
    return math.exp(x)

def pow(x,y):
    return math.pow(x,y)

def sin(x):
    return math.sin(x)

def sen(x):
    return math.sin(x)

def cos(x):
    return math.cos(x)

def tan(x):
    return math.tan(x)

def arcsin(x):
    return np.arcsin(x)

def arcsen(x):
    return np.arcsin(x)

def arccos(x):
    return np.arccos(x)

def arctan(x):
    return np.arctan(x)

# Pretty printing for sympy
init_printing()

# x,y,z and t as symbolic sympy variables
x, y, z, t = symbols('x y z t')

List.print()
