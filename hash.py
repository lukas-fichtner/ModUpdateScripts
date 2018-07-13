import sys, glob, hashlib, os, fnmatch

root = str(sys.argv[1])
out = str(sys.argv[2])

folder = os.path.basename(os.path.normpath(root))

f = open(out, 'w')
index = 0
filecount = 0
f.write('[')

files = []
for root, dirnames, filenames in os.walk(root):
        for filename in fnmatch.filter(filenames, '**'):
                if not filename.endswith(('.zsync')):
                        if os.path.isfile(os.path.join(root, filename)):
                                files.append(os.path.join(root, filename))

for x in files:
        filecount+=1
print(("Discovered " + str(filecount) + " files, start hashing (yes) ?"))

if 1 == 1:
        for x in files:
                if os.path.isfile(x):
                        if(index != 0):
                                f.write(',')
                        index+= 1
                        name = os.path.basename(x)
                        size = os.path.getsize(x)
                        hash = hashlib.md5(open(x, 'rb').read()).hexdigest()
                        relativepath = folder + '\\\\' + x.split(folder,1)[1][1:]
                        relativepath = relativepath.replace('/','\\\\')
                        f.write('{"Id":'+ str(index) +',"RelativPath":"' + relativepath + '","Hash":"' + hash + '","FileName":"' + name + '","Size":' + str(size) + '}')
                        print(str(round(float(index) / filecount, 3) * 100) + "%")
        f.write(']')
        f.close()
        print("Saved hashlist to >>" +  out)
else:
        exit()
