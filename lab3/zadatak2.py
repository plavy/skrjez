import sys


def odredi_HD(elementi, q):
    elementi.sort(key=float)
    el_i = q * len(elementi) - 1
    return float(elementi[int(el_i)])


if __name__ == "__main__":
    try:
        file = sys.argv[1]
    except IndexError:
        print("Exactly one argument required.")
        sys.exit(1)
    with open(file) as f:
        lines = f.readlines()
    Q = [(i+1)/10 for i in range(9)]
    print('Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90')
    for i in range(len(lines)):
        line = lines[i].strip()
        print(f'{i+1:03d}', end='')
        for q in Q:
            hd = odredi_HD(line.split(), q)
            print(f'#{hd:3.1f}', end='')
        print()
