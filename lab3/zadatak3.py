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
    lab_brojevi = set()
    for file in files:
        lab_broj = 'L' + str(int(file.split('_')[1]))
        lab_brojevi.add(lab_broj)
        with open(dir + '/' + file) as f:
            lines = f.readlines()
            for line in lines:
                jmbag = line.strip().split()[0]
                bod = float(line.strip().split()[1])
                if jmbag in d and lab_broj in d[jmbag]:
                    print(f'WARNING: Student {jmbag} has conflicts for {lab_broj}')
                d[jmbag][lab_broj] = bod
    print(f'{"JMBAG":14s} {"Prezime, Ime":26s}', end='')
    for el in sorted(lab_brojevi):
        print(f'{el:6s}', end='')
    print()
    for jmbag in d:
        prez_ime = f'{d[jmbag]["prezime"]}, {d[jmbag]["ime"]}'
        print(f'{jmbag:14s} {prez_ime:26s}', end='')
        for el in sorted(lab_brojevi):
            bod = f'{d[jmbag][el]:<6.1f}' if el in d[jmbag] else f'{"-":6s}'
            print(bod, end='')
        print()
