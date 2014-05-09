import os
import numpy

class tar2array():
    """ """
    def __init__(self, path, ncols, archive_name, remove_str = None, opts = 'zxf'):
        """ """
        f = os.popen('tar -' + opts + ' ' + path + ' -O ' + archive_name)
        if remove_str is not None:
            f = f.read().replace(remove_str, '')
        
        self.array = self.arch2array(f, ncols)
        
    def arch2array(self, string, ncols, sep = ' '):
        """ """
        array = numpy.fromstring(string, sep = sep)
        nrows = len(array) / ncols
        shaped_array = numpy.reshape(array, (nrows, ncols))
        
        return shaped_array

def purgeNaNs(array):
    """ """
    finite = numpy.isfinite(array)
    assess = numpy.all(finite, axis = 1)    
    noNaNs = array[assess]
    
    return noNaNs

def binarize(data, mini, step):
    data = data[:]
    data.sort()
    mid=[]
    cnt=[]
    w=step
    c=mini
    while len(data):
        mid.append(c+w/2.)
        cnt.append(0)
        while len(data) and data[0]<c+w:
            cnt[-1]+=1
            del data[0]
        c+=w
    return mid, cnt
