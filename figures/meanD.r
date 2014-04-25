obs02xl <- read.table("data/obs/sfs3/obs_BNMnlst_20x30x02x0015.txt", header = F)
obs02xh <- read.table("data/obs/sfs3/obs_BNMnlst_20x30x02x005.txt", header = F)
obs01xl <- read.table("data/obs/sfs3/obs_BNMnlst_20x30x01x0015.txt", header = F)
obs01xh <- read.table("data/obs/sfs3/obs_BNMnlst_20x30x01x005.txt", header = F)
obs001xl <- read.table("data/obs/sfs3/obs_BNMnlst_20x30x001x0015.txt", header = F)
obs001xh <- read.table("data/obs/sfs3/obs_BNMnlst_20x30x001x005.txt", header = F)

print(mean(obs02xl$V21))
print(mean(obs02xh$V21))

print(mean(obs01xl$V21))
print(mean(obs01xh$V21))

print(mean(obs001xl$V21))
print(mean(obs001xh$V21))
