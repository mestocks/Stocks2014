import time

class timer():
    """ """
    def __init__(self):
        """ """
        self.startTime = time.time()
        self.previousTime = time.time()
        self.outFile = ''
        self.firstRun = True
        self.runningTotal = 0.0
        self.sections = ['prep', 'observed', 'parameters', 'rejection']
        self.times = {'prep': 0.0, 'observed': 0.0, 'parameters': 0.0, 
                    'rejection': 0.0}
        
    def outputTimes(self):
        """ """
        file = open(self.outFile, 'w')
        if self.firstRun is True:
            print >> file, '###', time.strftime("%a, %d %b %Y %H:%M:%S +0000", time.gmtime())
            self.firstRun = False
        for (i, j) in self.runParams:
            print >> file, i + ':' + str(j),
        print >> file, '\n',
        print >> file, 'Stats:',
        for i in self.statNames:
            print >> file, i,
        print >> file, '\n',
        for i in range(len(self.paramNames)):
            print >> file, 'Params' + str(i + 1) + ':',
            for j in paramNames[i]:
                print >> file, j,
            print >> file, '\n',
        for i in self.sections:
            print >> file, i + ':', str(self.times[i]),
        print >> file, '\nTotal: ' + str(self.runningTotal)
        
        file.close()
        
    def add_time(self, section):
        """ """
        toadd = time.time() - self.previousTime
        self.times[section] += toadd
        self.runningTotal += time.time() - self.startTime
        self.previousTime = time.time()

import os
import re
import sys
import getopt
import tempfile
from types import TypeType

#sys.path.append('/home/equipe/dynadiv/commun/egglib-2.0.1')

import egglib 

opts, args = getopt.getopt(sys.argv[1:], '', ['obsIters=', 'parIters=', 'tol=', 'dirExt=', 'nsam=', 'nloci=', 
                'length=', 'botNe=', 'theta=', 'parWriteType=', 'parInDir=', 'parOutDir=', 'obsInDir=', 'obsOutDir=', 
                'rejOutDir=', 'number='])

# --obsIters, --parIters and --tol must be specified on the command line if the observations, parameters or the 
# rejection steps are to be performed.
dictOptions = {'obsIters': None, 'parIters': None, 'tol': None, 'dirExt': '', 'nsam': 20, 'nloci': 30, 'length': 750,  
                'botNe': 0.1, 'theta': 0.0015, 'parWriteType': 'w', 'parInDir': '', 'parOutDir': '', 'obsInDir': '', 
                'obsOutDir': '', 'rejOutDir':'', 'number': 10}
                
for (i, j) in opts:
    dictOptions[i.replace('--', '')] = j

generateObservations = False
generateParameters = False
performRejectionStep = False
performRegression = False
transformParameters = None
appendToParameterFile = False

parseFiles = True

printObservations = True
printParameters = True
timeSimulations = True
printInfo = True

if dictOptions['obsIters'] is not None:
    generateObservations = True
    obsIterations = int(dictOptions['obsIters'])
else:
    obsIterations = None
    
if dictOptions['parIters'] is not None:
    generateParameters = True
    parWriteType = dictOptions['parWriteType']
    # Allow for there to be a model specific number of parameter iterations.
    try:
        pIt = int(dictOptions['parIters'])
        parIterations = (pIt, pIt)
    except ValueError:
        parIterations = tuple(map(int, dictOptions['parIters'].split(',')))
else:
    parIterations = None

if dictOptions['tol'] is not None:
    performRejectionStep = True
    tolerance = float(dictOptions['tol'])
else:
    tolerance = None

#inputFileDir = os.path.join('/home/equipe/dynadiv/stocks/stage2', dictOptions['dirExt'])
inputFileDir = os.path.join('/Users/mist/Documents/Projects/morrisonicola/sims/stage2', dictOptions['dirExt'])

#inputFileDir = os.path.join('.', dictOptions['dirExt'])

#outputFileDir = os.path.join('/home/equipe/dynadiv/stocks/stage2', dictOptions['dirExt'])
outputFileDir = os.path.join('/Users/mist/Documents/Projects/morrisonicola/sims/stage2', dictOptions['dirExt'])

#outputFileDir = os.path.join('.', dictOptions['dirExt'])

# Global parameters
nsamples = int(dictOptions['nsam'])
number = int(dictOptions['number'])
nloci = int(dictOptions['nloci'])
length = int(dictOptions['length'])
modelNames = ['SNM', 'BNM']
#statNames = ['thetaW', 'thetaW_sd', 'thetaW_q05', 'thetaW_q95', 'thetaPi', 'thetaPi_sd', 'thetaPi_q05', 'thetaPi_q95', 
#            'thetaH', 'thetaH_sd', 'thetaH_q05', 'thetaH_q95', 'He', 'He_sd', 'He_q05', 'He_q95']
            
statNames = ['thetaW', 'thetaW_sd', 'thetaW_q05', 'thetaW_q95', 'thetaPi', 'thetaPi_sd', 'thetaPi_q05', 'thetaPi_q95', 
            'thetaH', 'thetaH_sd', 'thetaH_q05', 'thetaH_q95', 'He', 'He_sd', 'He_q05', 'He_q95', 
            'S', 'S_sd', 'S_q05', 'S_q95', 'D', 'D_sd', 'D_q05', 'D_q95', 'H', 'H_sd', 'H_q05', 'H_q95', 
            's1', 's2', 's3']
            
statsForRejection = ['thetaW', 'thetaPi', 'He', 'D', 'H']
#statsForRejection = ['s1', 's2', 's3']
#statsForRejection = ['thetaW', 's1', 's2', 's3']
#statsForRejection = ['thetaW', 'thetaPi', 'He_sd']

#statNames = ['D', 'D_sd', 'D_q05', 'D_q95', 'H', 'H_sd', 'H_q05', 'H_q95',
#        'E', 'E_sd', 'E_q05', 'E_q95', 'Z', 'Z_sd', 'Z_q05', 'Z_q95', 's1', 's2', 's3']

#statsForRejection = ['D', 'D_sd', 'D_q05', 'D_q95', 'H', 'H_sd', 'H_q05', 'H_q95',
#        'E', 'E_sd', 'E_q05', 'E_q95', 'Z', 'Z_sd', 'Z_q05', 'Z_q95', 's1', 's2', 's3']

#statNames = ['s1', 's2', 's3', 's4', 's5']
#statsForRejection = ['s1', 's2', 's3', 's4', 's5']

#statNames = ['s1', 's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10']
#statsForRejection = ['s1', 's2', 's3', 's4', 's5', 's6', 's7', 's8', 's9', 's10']

statIndices = [statNames.index(i) for i in statsForRejection]
paramNames = [('theta', 'rho'), ('theta', 'botEnd', 'botDuration', 'botNe', 'ancNe', 'rho')]

# Observed parameters
obsThetaBp = float(dictOptions['theta'])
obsRhoBp = 0.01
obsTheta = obsThetaBp * length
obsRho = obsRhoBp * length
obsBotDuration = 0.2
obsBotEnd = 0.2
obsBotNe = float(dictOptions['botNe'])
obsAncNe = 1.0

# Create file names
baseString = 'nl_' + 'x'.join([str(nsamples), str(nloci)])
idString = 'nlst_' + 'x'.join([str(nsamples), str(nloci), str(obsBotNe).replace('.', ''), str(obsThetaBp).replace('0.', '')]) + '.txt'

# Assign directories
parameterInDir = dictOptions['parInDir']
parameterOutDir = dictOptions['parOutDir']
observationInDir = dictOptions['obsInDir']
observationOutDir = dictOptions['obsOutDir']
rejectionOutDir = dictOptions['rejOutDir']

inObs = [os.path.join(inputFileDir, observationInDir, 'obs_' + i + idString) for i in modelNames]
inParams = [os.path.join(inputFileDir, parameterInDir, 'par_' + i + baseString + '.txt') for i in modelNames]

if generateObservations is True:
    outObs = [os.path.join(inputFileDir, observationOutDir, 'obs_' + i + idString) for i in modelNames]
if generateParameters is True:
    outParams = [os.path.join(inputFileDir, parameterOutDir, 'par_' + i + baseString + '.txt') for i in modelNames]
if performRejectionStep is True:
    outRej = [os.path.join(inputFileDir, rejectionOutDir, 'out' + str(tolerance).replace('.', '') + '_' + i + idString) for i in modelNames]

Timer = timer()
outInfo = os.path.join(inputFileDir, 'info_' + idString)
Timer.outFile = outInfo
Timer.runParams = [('obsIterations', obsIterations), ('parIterations', parIterations), ('nsampels', nsamples), 
                ('nloci', nloci), ('length', length), ('tolerance', tolerance), ('obsThetaBp', obsThetaBp), 
                ('obsRhoBp', obsRhoBp), ('obsBotDuration', obsBotDuration), ('obsBotEnd', obsBotEnd), 
                ('obsBotNe', obsBotNe), ('obsAncNe', obsAncNe)]
Timer.statNames = statNames
Timer.paramNames = paramNames

# A couple of function to keep things tidy...
#############################################

def quantile(x, prob, method = 'R7'):
    """
    x is a list of data points to analyse
    prob is a float, or a list of floats between 0 and 1
    method corresponds to different ways of calculating the quantiles in R
    """
    x.sort()
    N = len(x)
    if isinstance(prob, float): prob = [prob]
    quantiles = []
    for p in prob:
        if method == 'R3':
            if p <= (0.5 / N):
                xh = x[0]
            else:
                h = round(N * p, 0)
                xh = x[int(h) - 1]
        elif method == 'R7':
            if p == 1.0:
                xh = x[-1]
            else:
                h = round(((N - 1) * p) + 1, 0)
                xh = x[int(h) - 1]
        quantiles.append(xh)
    
    return quantiles

def getStats(sims, length):
    """ """
    tw, tp, th, k = [], [], [], []
    for sim in sims:
        outSeq = 'A' * sim.polymorphism(skipDifferentiationStats=True, skipOutgroupBasedStats=True, skipAllHaplotypeStats=True, skipHaplotypeDifferentiationStats=True)['S']
        sim.append('out', outSeq, group = 999)
        poly = sim.polymorphism(skipOutgroupBasedStats=False)
        tw.append((poly['thetaW'] * poly['S']) / length)
        tp.append((poly['Pi'] * poly['S']) / length)
        if poly['S'] == 0:
            th.append(0)
        else:
            th.append((poly['thetaH'] * poly['S']) / length)
        k.append(poly['He'])
    
    thetaW, thetaW_var, thetaW_sd, thetaW_se = egglib.tools.stats(tw)
    thetaPi, thetaPi_var, thetaPi_sd, thetaPi_se = egglib.tools.stats(tp)
    thetaH, thetaH_var, thetaH_sd, thetaH_se = egglib.tools.stats(th)
    He, He_var, He_sd, He_se = egglib.tools.stats(k)
    
    thetaW_q05, thetaW_q95 = quantile(tw, [0.05, 0.95])
    thetaPi_q05, thetaPi_q95 = quantile(tp, [0.05, 0.95])
    thetaH_q05, thetaH_q95 = quantile(th, [0.05, 0.95])
    He_q05, He_q95 = quantile(k, [0.05, 0.95])
    
    stats = [thetaW, thetaW_sd, thetaW_q05, thetaW_q95, thetaPi, thetaPi_sd, thetaPi_q05, 
                thetaPi_q95, thetaH, thetaH_sd, thetaH_q05, thetaH_q95, He, He_sd, He_q05, He_q95]
    
    return stats
    
def getStats2(sims):
    """ """
    s, d, h = [], [], []
    for sim in sims:
        outSeq = 'A' * sim.polymorphism(skipDifferentiationStats=True, skipOutgroupBasedStats=True, skipAllHaplotypeStats=True, skipHaplotypeDifferentiationStats=True)['S']
        sim.append('out', outSeq, group = 999)
        poly = sim.polymorphism(skipOutgroupBasedStats=False)
        s.append(poly['S'])
        if poly['S'] != 0:
            # These stats are ignored if s = 0. Is this correct?
            # Or should they be assigned zero values?
            d.append(poly['D'])
            h.append(poly['H'])
        else:
            h.append(0.0)
    
    S, S_var, S_sd, S_se = egglib.tools.stats(s)
    S_q05, S_q95 = quantile(s, [0.05, 0.95])
    
    if sum(s) != 0:    
        D, D_var, D_sd, D_se = egglib.tools.stats(d)
        D_q05, D_q95 = quantile(d, [0.05, 0.95])        
        H, H_var, H_sd, H_se = egglib.tools.stats(h)
        H_q05, H_q95 = quantile(h, [0.05, 0.95])
    else:
        D, D_sd, D_q05, D_q95, H, H_sd, H_q05, H_q95 = 'NaN', 'NaN', 'NaN', 'NaN', 'NaN', 'NaN', 'NaN', 'NaN'
        
    stats = [S, S_sd, S_q05, S_q95, D, D_sd, D_q05, D_q95, H, H_sd, H_q05, H_q95]
    
    return stats
    
def getStats3(sims, number):
    """ """
    S2 = [0] * number
    Stot = 0
    bins = [(i + 1) * 0.5 / number for i in range(number)]
    
    stats = []
    
    for sim in sims:
        outSeq = 'A' * sim.polymorphism(skipDifferentiationStats=True, skipOutgroupBasedStats=True, skipAllHaplotypeStats=True, skipHaplotypeDifferentiationStats=True)['S']
        sim.append('out', outSeq, group = 999)
        poly = sim.polymorphism(skipOutgroupBasedStats=False)
        for j in range(poly['S']):
            site = poly['sites'][j]
            Stot += 1
            p, q = site.alleleFrequency(0), site.alleleFrequency(1)
            p = 1. * min((p, q)) / (p + q)
            for k in range(number):
                if p <= bins[k]:
                    S2[k] += 1
                    break
                    
    if Stot > 0:
        for i in range(number):
            stats.append(1. * S2[i] / Stot)
    else:
        stats = [0.0] * number
            
    return stats

# Setup ABC priors
thetaPrior = (0.0, 0.01) # per bp
rhoPrior = (0.0, 0.02) # per bp
thetaAncPrior = obsAncNe
durationPrior = obsBotDuration
timePrior = (0.0, 1.5)
freqPrior = (0.0, 1.0)

Timer.add_time('prep')
Timer.outputTimes()

# Generate Observations or take them from a file
################################################

if generateObservations is True:
    #print 'Generating observations...'
    modelClasses = []
    mutator = egglib.simul.CoalesceFiniteAlleleMutator(theta = obsTheta)
    snmParamSet = egglib.simul.CoalesceParamSet(nsamples, rho = obsRho, nsites = length)
    modelClasses.append(snmParamSet)
    bnmParamSet = egglib.simul.CoalesceParamSet(nsamples, rho = obsRho, nsites = length)
    bnmParamSet.changeAllPopulationSizes(obsBotEnd, obsBotNe)
    bnmParamSet.changeAllPopulationSizes(obsBotEnd + obsBotDuration, obsAncNe)
    modelClasses.append(bnmParamSet)
    allObsStats = []
    for mod in range(len(modelNames)):
        if printObservations is True:
            obsOutFile = open(outObs[mod], 'w')
        obsStats = []
        for iter in range(obsIterations):
            sims = egglib.simul.coalesce(modelClasses[mod], mutator, nloci)
            simStats = getStats(sims, length)
            simStats2 = getStats2(sims)
            simStats3 = getStats3(sims, number)
            simStats = simStats + simStats2 + simStats3
            obsStats.append(tuple([simStats[i] for i in statIndices]))
            if printObservations is True:
                simStats = map(str, simStats)
                print >> obsOutFile, ' '.join(simStats)
        allObsStats.append(obsStats)
        if printObservations is True:
            obsOutFile.close()
elif generateObservations is False and performRejectionStep is True:
    #print 'Retrieving observed...'
    allObsStats = []
    for mod in range(len(modelNames)):
        obsInFile = open(inObs[mod], 'r')
        obsStats = []
        for line in obsInFile:
            stats = tuple([float(line.rstrip().split()[i]) for i in range(len(line.rstrip().split())) if i in statIndices])
            obsStats.append(stats)
        allObsStats.append(obsStats)
        obsInFile.close()
        
Timer.add_time('observed')
Timer.outputTimes()

# Some more functions...
##############################################

def snm(priorDraw, nsamples, nloci, length):
    """ """
    theta = priorDraw[0] * length
    rho = priorDraw[1] * length
    mutator = egglib.simul.CoalesceFiniteAlleleMutator(theta)
    paramSet = egglib.simul.CoalesceParamSet(nsamples, rho = rho, nsites = length)
    sims = egglib.simul.coalesce(paramSet, mutator, nloci)
    
    return sims
    
def bnm(priorDraw, nsamples, nloci, length):
    """ """
    theta = priorDraw[0] * length
    botEnd = priorDraw[1]
    botDuration = priorDraw[2]
    botNe = priorDraw[3]
    ancNe = priorDraw[4]
    rho = priorDraw[5] * length
    
    mutator = egglib.simul.CoalesceFiniteAlleleMutator(theta)
    paramSet = egglib.simul.CoalesceParamSet(nsamples, rho = rho, nsites = length)
    paramSet.changeAllPopulationSizes(botEnd, botNe)
    paramSet.changeAllPopulationSizes(botEnd + botDuration, ancNe)        
    sims = egglib.simul.coalesce(paramSet, mutator, nloci)
    
    return sims
        
# Generate parameters or take them from a file
##############################################

if generateParameters is True:
    #print 'Generate parameters...'
    # Setup priors
    random = egglib.egglib_binding.Random()
    # SNM
    snmPriors = egglib.fitmodel.PriorDumb(random)
    snmPriors.add('U', thetaPrior[0], thetaPrior[1])
    snmPriors.add('U', rhoPrior[0], rhoPrior[1])
    # BNM
    botPriors = egglib.fitmodel.PriorDumb(random)
    botPriors.add('U', thetaPrior[0], thetaPrior[1])
    botPriors.add('U', timePrior[0], timePrior[1])
    botPriors.add('F', durationPrior)
    botPriors.add('U', freqPrior[0], freqPrior[1])
    botPriors.add('F', thetaAncPrior)
    botPriors.add('U', rhoPrior[0], rhoPrior[1])
    modelPriors = [snmPriors, botPriors]
    modelFunctions = [snm, bnm]
    modelClasses = []
    for mod in range(len(modelNames)):
        numberOfParameterIterationsForThisModel = parIterations[mod]
        parOutFile = open(outParams[mod], parWriteType)
        for iter in range(numberOfParameterIterationsForThisModel):
            prior = modelPriors[mod].draw()
            sims = modelFunctions[mod](prior, nsamples, nloci, length)
            simStats = getStats(sims, length)
            simStats2 = getStats2(sims)
            simStats3 = getStats3(sims, number)
            simStats = simStats + simStats2 + simStats3
            #simStats = getStats(sims, length)
            simStats = map(str, simStats)
            parOutFile.write(str(prior) + ' # ' + ' '.join(simStats) + '\n')
        parOutFile.close()

Timer.add_time('parameters')
Timer.outputTimes()
     
# Rejection step
##############################################

if performRejectionStep is True:
    #print 'performing rejection step...'
    if generateParameters is not True:
        rejData = [(inParams[i], len(paramNames[i])) for i in range(len(modelNames))]
    else:
        rejData = [(outParams[i], len(paramNames[i])) for i in range(len(modelNames))]
    # Need to parse parameters file so that only certain stats are used.    
    if len(statNames) != len(statsForRejection) and parseFiles is True:
        #print 'parsing stats...'
        for i in range(len(rejData)):
            pFile = rejData[i][0]
            nprms = rejData[i][1]
            infile = open(pFile, 'r')
            outName = pFile.replace('.txt', '_parsed.txt')
            outfile = open(outName, 'w')
            for line in infile:
                separateLine = line.rstrip().split(' # ')
                parHalf, statHalf = separateLine[0], separateLine[1]
                cutStats = [statHalf.split()[j] for j in statIndices]
                if 'NaN' not in cutStats:
                    print >> outfile, parHalf, '#', ' '.join(cutStats) + '\n',
            rejData[i] = (outName, nprms)
            infile.close()
            outfile.close()
            
    for mod in range(len(modelNames)):
        fileForParameters = rejData[mod][0]
        theNumberOfParameters = rejData[mod][1]
        if len(statNames) != len(statsForRejection) and '_parsed' not in fileForParameters:
            rejData[mod] = (fileForParameters.replace('.txt', '_parsed.txt'), theNumberOfParameters)        
    
    #for mod in range(len(modelNames)):
    for mod in [1]:
    #for mod in [0]:
        rejOutFile = open(outRej[mod], 'w')
        #print 'actual rejection step...', outRej[mod]
        print >> rejOutFile, 'SNM', 'BNM'
        obsStats = allObsStats[mod]
        for iterObs in range(len(obsStats)):
            ABC = egglib.egglib_binding.ABC()
            ABC.number_of_statistics(len(obsStats[iterObs]))
            for i, v in enumerate(obsStats[iterObs]):
                ABC.obs(i, v)
            for fname, nparams in rejData:
                ABC.add_fname(fname, nparams)
            
            ABC.get_threshold(tolerance)
            
            handle, tmpfile = tempfile.mkstemp()
            os.close(handle)
            
            # Rejection step
            acc = ABC.rejection(tmpfile, True)
            res = dict.fromkeys(range(len(rejData)), 0)
            
            f = open(tmpfile)
            for line in f:
                match = re.match('\[(\d+)\]', line)
                index = int(match.group(1)) - 1
                res[index] += 1
                
            T = sum(res.itervalues())
            
            if T != 0:
                for i in res:
                    res[i] = 1. * res[i] / T
            else:
                res[0] = 0.5
                res[1] = 0.5
                
            for i, v in enumerate(rejData):
                print >> rejOutFile, 1. * res[i],
            print >> rejOutFile, '\n',
            if iterObs % 50 == 0:
                rejOutFile.flush()
            os.remove(tmpfile)
        
        rejOutFile.close()

Timer.add_time('rejection')
Timer.outputTimes()

# Regression step
###########################

if performRegression is True:
    if transformParameters is None:
        transform = ABC.NONE
    if transformParameters == 'tan':
        transform = ABC.TAN
    if transformParameters == 'log':
        transform = ABC.LOG

    ABC.regression(tmpfile, kwargs['output'], kwargs['model'], transform)