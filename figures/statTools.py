import numpy
        
class PCA():
    """ """
    def __init__(self, data):
        """ """
        self.data = data
        self.Y = self.normalize(data)
        self.A = numpy.corrcoef(self.Y, rowvar = 0)
        self.u, self.s, self.vt = self.svd(self.A)
        self.v = numpy.transpose(self.vt)
        self.yv = numpy.dot(self.Y, self.v)
        self.ev = self.singularValues(self.s)
        
    def normalize(self, data):
        """ """
        self.mu = data.mean(axis = 0)
        self.sd = data.std(axis = 0)
        Y = (data - self.mu) / self.sd
        
        return Y
        
    def svd(self, A):
        """ """
        u, s, vt = numpy.linalg.svd(A)
        
        return u, s, vt
        
    def singularValues(self, s):
        """ """
        ev = map(lambda x: x ** 2, s)
        ev = map(lambda x: x / sum(ev), ev)
        
        return ev

class correlation():
    """ """
    def __init__(self, data, remove_infinite = True):
        """ """
        if remove_infinite is True:
            isinf = numpy.isfinite(data)
            finite = numpy.all(data, axis = 1)
            data = data[finite]
        
        self.corr = numpy.corrcoef(data.T)

