import os
import sys
import numpy

sys.path.append("/home/mist/Documents/Codes/evolib")

import dataTools
from statTools import PCA

def getSimData(file_name, archive_name, numParams, numStats, path = '/home/mist/Documents/Projects/ABCpower/sims/stage2/sfs/params/num3/completed/'):
    """ """
    tar_path = os.path.join(path, file_name)
    
    simData = dataTools.tar2array(tar_path, numParams + numStats, archive_name, remove_str = '# ')

    return simData

def getObsData(file_name, path = '/home/mist/Documents/Projects/ABCpower/sims/stage2/sfs/obs/num3'):
    """ """
    file_path = os.path.join(path, file_name)
    obsData = numpy.loadtxt(file_path)
    
    return obsData

def PC1234print(PCAclass, statNames):
    """ """
    PC1 = PCAclass.u[..., 0]
    PC2 = PCAclass.u[..., 1]
    PC3 = PCAclass.u[..., 2]
    PC4 = PCAclass.u[..., 3]
    for i in range(len(PC1)):
        print statNames[i], PC1[i], PC2[i], PC3[i], PC4[i]

def PCcontrPrint(PCAclass):
    """ """
    for i in PCAclass.ev:
        print i

def PCbackgroundPrint(PCAclass):
    """ """
    for i in PCAclass.yv:
        print i[..., 0], i[..., 1], i[..., 2], i[..., 3]

def PCobsPrint(array):
    """ """
    for i in array:
        print i[0], i[1], i[2], i[3]
        
statNames = ['thetaW', 'thetaW_sd', 'thetaW_q05', 'thetaW_q95', 
            'thetaPi', 'thetaPi_sd', 'thetaPi_q05', 'thetaPi_q95', 
            'thetaH', 'thetaH_sd', 'thetaH_q05', 'thetaH_q95', 
            'He', 'He_sd', 'He_q05', 'He_q95', 
            'S', 'S_sd', 'S_q05', 'S_q95', 
            'D', 'D_sd', 'D_q05', 'D_q95', 
            'H', 'H_sd', 'H_q05', 'H_q95', 
            's1', 's2', 's3']

n = 10001
skiprows = 0
numberOfStats = 31

paramSNMCols = [0, 1]
nParamsSNM = 2
usedColsSNM = len(paramSNMCols)

paramBNMCols = [0, 1, 3, 5]
nParamsBNM = 6
usedColsBNM = len(paramBNMCols)

colsSNM = range(nParamsSNM) + range(nParamsSNM + 1, nParamsSNM + 1 + numberOfStats)
colsBNM = paramBNMCols + range(nParamsBNM + 1, nParamsBNM + 1 + numberOfStats)

printPC1234 = False
printContr = False
printPCobs = True

if printPC1234 is True:
    
    data = getSimData('bnm.tar.gz', 'bnm/par_BNMnl_20x30.txt', nParamsBNM, numberOfStats)
    stats = data.array[:n, nParamsBNM:]
    no = dataTools.purgeNaNs(stats)
    PCAout = PCA(no)
    PC1234print(PCAout, statNames)
    
elif printContr is True:
    
    data = getSimData('bnm.tar.gz', 'bnm/par_BNMnl_20x30.txt', nParamsBNM, numberOfStats)
    stats = data.array[:n, nParamsBNM:]
    no = dataTools.purgeNaNs(stats)
    PCAout = PCA(no)
    PC1234print(PCAout, statNames)
    PCcontrPrint(PCAout)
    
elif printPCobs is True:
    
    snmData = getSimData('snm.tar.gz', 'snm/par_SNMnl_20x30.txt', nParamsSNM, numberOfStats)
    bnmData = getSimData('bnm.tar.gz', 'bnm/par_BNMnl_20x30.txt', nParamsBNM, numberOfStats)
    obsSnmData = getObsData('obs_SNMnlst_20x30x01x005.txt')
    obsBnmData = getObsData('obs_BNMnlst_20x30x01x005.txt')
    
    a1 = bnmData.array[..., 1] > 0.2
    a3 = bnmData.array[..., 3] > 0.1
    aboveBool = a1 * a3
    
    b1 = bnmData.array[..., 1] < 0.2
    b3 = bnmData.array[..., 3] < 0.1
    belowBool = b1 * b3
    
    above = bnmData.array[aboveBool]
    below = bnmData.array[belowBool]
    
    concat = numpy.vstack((snmData.array[:n, nParamsSNM:], above[:n, nParamsBNM:], below[:n, nParamsBNM:]))
    
    no = dataTools.purgeNaNs(concat)
    PCAout = PCA(no)
    
    scaledObsSnm = (obsSnmData - PCAout.mu) / PCAout.sd
    obsSnm = numpy.dot(scaledObsSnm, PCAout.v)
    
    scaledObsBnm = (obsBnmData - PCAout.mu) / PCAout.sd
    obsBnm = numpy.dot(scaledObsBnm, PCAout.v)
    
    #PCbackgroundPrint(PCAout)
    #PCobsPrint(obsSnm)
    PCobsPrint(obsBnm)



