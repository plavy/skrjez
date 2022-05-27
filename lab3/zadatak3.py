import sys
import os

if __name__ == "__main__":
    try:
        dir = sys.argv[1]
    except IndexError:
        print("Exactly one argument required.")
        sys.exit(1)
    jmbag_file = 'studenti.txt'
    files = os.listdir(dir)
    files.remove(jmbag_file)
    d = {}
    with open(dir + '/' + jmbag_file) as f:
        lines = f.readlines()
    for line in lines:
        line = line.strip()
        units = line.split()
        d[units[0]] = {}
        d[units[0]]['prezime'] = units[1]
        d[units[0]]['ime'] = units[2]
    for file in files:
        lab_broj = file.split('_')[1]
        with open(dir + '/' + file) as f:
            lines = f.readlines()
            for line in lines:
                jmbag = line.strip().split()[0]
                bod = line.strip().split()[1]
                d[jmbag][lab_broj] = bod
    print(d)